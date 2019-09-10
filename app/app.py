import os
import requests
import smtplib
import names
import xlrd
from flask import Flask,render_template,request,flash,redirect,url_for,session,logging,Response
from flask_mysqldb import MySQL
from itsdangerous import URLSafeTimedSerializer, SignatureExpired
from wtforms import Form,fields, StringField, TextAreaField, PasswordField, validators, FileField
from passlib.hash import sha256_crypt
from functools import wraps
from werkzeug.utils import secure_filename
from flask import jsonify,json
from array import *
from flask_mail import Mail, Message
from flask.debughelpers import DebugFilesKeyError

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'app'
app.config['MYSQL_CURSORCLASS']= 'DictCursor'

APP_ROOT = os.path.dirname(os.path.abspath(__file__))

mysql = MySQL(app)

def is_logged_in(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if 'logged_in' in session:
			return f(*args, **kwargs)
		else:
			flash('Unauthorized, Please login', 'danger')
			return redirect(url_for('login_request'))
	return wrap

def his_logged_in(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if 'adlogged_in' in session:
			return f(*args, **kwargs)
		else:
			flash('Unauthorized, Please login', 'danger')
			return redirect(url_for('admin_cpanel'))
	return wrap

@app.route('/delete_movie/<string:id>', methods=['POST','GET'])
@is_logged_in
def delete_movie(id):
	cur = mysql.connection.cursor()
	cur.execute("DELETE FROM details WHERE id=%s",[id])
	mysql.connection.commit()
	cur.close()
	return redirect(url_for('dashboard'))

@app.route('/dashboard',methods=['GET','POST'])
@is_logged_in
def dashboard():
	cur = mysql.connection.cursor()
	cur.execute("SELECT * FROM details")
	result = cur.fetchall()
	cur.close()
	return render_template('dashboard.html',result=result)

@app.route('/')
def index():
	return render_template('home.html')

@app.route('/admin_register_form',methods=['GET','POST'])
def admin_user():
	if request.method == 'POST':
		ademail = request.form['ademail']
		adusername = request.form['adusername']
		adpassword = sha256_crypt.encrypt(str(request.form['adpassword']))
		adphone = request.form['adphone']
		cur = mysql.connection.cursor()
		result_email = cur.execute("SELECT * FROM admin_details WHERE ademail = %s",[ademail])
		if result_email >0:
			return redirect(url_for('admin_cpanel'))
		else:
			cur.execute("INSERT INTO admin_details(ademail,adusername,adpassword,adphone) VALUES(%s,%s,%s,%s)",(ademail,adusername,adpassword,adphone))
			mysql.connection.commit()
			cur.close()
			return redirect(url_for('admin_cpanel'))
	return render_template('admin_register.html')

@app.route('/cpanel',methods=['GET','POST'])
def admin_cpanel():
	if request.method == 'POST':
		email = request.form['ademail']
		password_candidate = request.form['adpassword']
		cur = mysql.connection.cursor()
		result = cur.execute("SELECT * FROM admin_details WHERE ademail = %s",[email])
		if result > 0:
			data= cur.fetchone()
			password = data['adpassword']
			if sha256_crypt.verify(password_candidate, password):
				session['adlogged_in'] = True
				session['ademail']= email
				return redirect(url_for('admin'))
			else:
				error = 'Invalid password'
				return render_template('admin_login.html', error=error)
			cur.close()
		else:
			error = 'Username not found'
			return render_template('admin_login.html', error=error)
	return render_template('admin_login.html')

class RegisterForm(Form):
	email = StringField('email',[validators.length(min=3,max=50)])
	user = StringField('username',[validators.length(min=3,max=20)])
	password = PasswordField('Password', [
											validators.DataRequired(),
											validators.EqualTo('confirm', message='Passwords do not match')
										])
	confirm = PasswordField('cpassword')

@app.route('/register_form',methods=['GET','POST'])
def register():
	if request.method == 'POST':
		email = request.form['email']
		user = request.form['username']
		password = sha256_crypt.encrypt(str(request.form['password']))
		check_email = request.form['email']
		cur = mysql.connection.cursor()
		result_email = cur.execute("SELECT * FROM users WHERE email=%s",[email])
		
		if result_email > 0:
			return 'already exist'
		else:
			cur.execute("INSERT INTO users(email,username,password) VALUES(%s,%s,%s)", (email,user,password))
			mysql.connection.commit()
			cur.close()
			return redirect(url_for('login_request'))
	return render_template('register.html')

@app.route('/user_login_request',methods=['GET','POST'])
def login_request():
	if request.method == 'POST':
		email = request.form['user_email']
		password_candidate = request.form['user_password']
		cur = mysql.connection.cursor()
		result = cur.execute("SELECT * FROM users WHERE email = %s",[email])
		if result > 0:
			data= cur.fetchone()
			password = data['password']
			if sha256_crypt.verify(password_candidate, password):
				session['logged_in'] = True
				session['email']= email
				return redirect(url_for('get'))
			else:
				error = 'Invalid password'
				return render_template('login.html', error=error)
			cur.close()
		else:
			error = 'Username not found'
			return render_template('login.html', error=error)
	return  render_template('login.html')

@app.route('/logout')
def logout_session():
	session.clear()
	return redirect(url_for('login_request'))

class AdminForm(Form):
	title = StringField('title',[validators.length(min=1,max=20)])
	rating = StringField('rating', [validators.length(min=2,max=20)])
	rdate = StringField('rdate', [validators.length(min=2,max=20)])
	body = TextAreaField('body',[validators.length(min=10,max=1000)])

@app.route('/admin',methods=['GET','POST'])
@his_logged_in
def admin(): 
	target = os.path.join(APP_ROOT,'static/')
	if not os.path.isdir(target):
		os.mkdir(target)
	for file in request.files.getlist('cp'):
		filename = file.filename
		destination = '/'.join([target,filename])
		file.save(destination)
	for file1 in request.files.getlist('pp'):
		filename = file1.filename
		destination = '/'.join([target,filename])
		file1.save(destination)
	for file2 in request.files.getlist('act[]'):
		filename = file2.filename
		destination = '/'.join([target,filename])
		file2.save(destination)
		return redirect(url_for('upload'))
	return render_template('admin.html')

@app.route('/upload',methods=['GET','POST'])
@is_logged_in
def upload():
	if request.method == 'POST':
		title = request.form['title']
		rating = request.form['rating']
		rdate = request.form['rdate']
		cphoto = request.form['cphoto']
		pphoto = request.form['pphoto']
		body = request.form['body']
		cur = mysql.connection.cursor()
		cur.execute("INSERT INTO details(title,rating,rdate,cphoto,pphoto,body) VALUES(%s,%s,%s,%s,%s,%s)",(title,rating,rdate,cphoto,pphoto,body))
		mysql.connection.commit()
		cur.close() 
		return redirect(url_for('admin'))
	return render_template('upload.html')


@app.route('/all_movie_collection')
@is_logged_in
def get():
	cur = mysql.connection.cursor()
	cur.execute("SELECT * FROM details")
	views = cur.fetchall()
	return render_template('all_views.html',views=views)

@app.route('/movie_info/<string:id>/')
@is_logged_in
def movie(id):
	cur = mysql.connection.cursor()
	cur.execute("SELECT * FROM details WHERE id=%s",[id])
	fetchs = cur.fetchall()
	return render_template('getresult.html', fetchs=fetchs)

if __name__ == '__main__':
	app.secret_key = 'secret0987'
	app.run(debug=True)
	