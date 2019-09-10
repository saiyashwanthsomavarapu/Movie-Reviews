-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2017 at 06:24 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `app`
--

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE IF NOT EXISTS `details` (
`id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL,
  `rating` varchar(225) NOT NULL,
  `rdate` varchar(225) NOT NULL,
  `cphoto` varchar(225) NOT NULL,
  `pphoto` varchar(225) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `title`, `rating`, `rdate`, `cphoto`, `pphoto`, `body`) VALUES
(1, 'jai lava kusa', '4.3', 'sept 25,2017', 'Kusa.jpg', 'Jai.jpg', '<p>Triplets Jai Lava Kusa being taken care by their maternal uncle seek a humble living by stage drama performances. Both Lava and Kusa excel in acting whereas Jai is side-lined by his maternal uncle due to his stammering disability. Jai, though a member of the family, is generally set to do the household chores and treated as the second class citizen. An instigated and a humiliated Jai sets the drama stage on fire and flees away.</p><p><br />After 20 years all three brothers are scattered and seek their own lives in different places. Kusa, an expert mugger with an easy go attitude mugs a huge amount of money to fly over to the USA but the plan eventually fizzles out as the money becomes worthless due to demonetization. He happens to meet Lava, a bank manager, who adheres to his principles and runs an ethical life. Lava meanwhile, would have got entangled in a professional issue and also would be seen losing his love life as well. Kusa hatch plan to go to bank as lava kumar and kusa cheats lava kumar and ran away with money. Priya father files a kidnap case on lava kumar. Lava ask police officer to find kusa. Finally they find kusa and he angrily punches kusa and ask about Priya. Kusa says that he didn&#39;t kidnapped lava&#39;s girl friend. Then lava and kusa come to know that Jai is alive. Police officers says he is not Jai now his name is Ravan.</p><p>Police officer narrate the story about Jai after the fire accident. After knowing the truth about his elder brother Ravan (Jai) lava and kusa enters Ravan (Jai) house. Ravan (Jai) says to lava, kusa about Priya and money. Ravan (Jai) says they have to change their outfits like Ravan (Jai) and follow his mentor kaka. Lava succeeded by winning election as Ravan (Jai). Kusa meet Simran who is trying to take revenge on Ravan (Jai) for her brother&#39;s death. Kusa makes a deal to with Simran that she has to act like lover of Ravan (Jai) and take her revenge on Ravan (Jai). Kusa tell all the truth to lava about his deal with simran while kusa narrating his deal with lava Ravan (Jai) listen the plan of kusa and simran and he angrily try to kill kusa. Lava begs his brother Ravan (Jai) to leave kusa. Then kusa know all the truth and makes a deal with lava to change his brother&#39;s behavior. Ravan (Jai) orders his guards to kill lava and kusa. After a lot of drama done by lava and kusa. Kaka thinks lava as Ravan (Jai) and tell the plan about killing lava and kusa. Next day morning lava and kusa drives the car attached with a bomb. The triplets maternal uncle begs Ravan (Jai) to save lava and kusa. Ravan did not reply&#39;s then he go to kaka and ask to say to Ravan (Jai) not kill lava and kusa kaka says he already said to him but he didn&#39;t reply anything. Ravan (Jai) slowly say that kaka didn&#39;t tell him to save them. Kaka come to know that he said to lava not Ravan (Jai). Lava tells all the plan to kusa while driving and they to understand Ravan (Jai) and decided to die.</p><p>Sarkar who is seeking to take revenge on Ravan (Jai) stops car and shoots kusa. Ravan (Jai) comes and save lava and kusa by killing Sarkar and his Guards. Story ends with Jai (Ravan) death .</p>'),
(2, 'oye ninney', '4.4', 'oct 6,2017', 'ninney.jpg', 'oye.jpg', '<p><strong>STORY:</strong>&nbsp;&#39;Oye Ninne&#39; charts the story of Vishnu (Bharat), a young man who aspires to be a farmer while his parents want him to aim for something big. He grows up with his cousin Veda (Srushti Dange), whom he shares a love-hate relationship. For Vishnu, she&#39;s that &quot;annoying cousin&quot; everyone has in a family; whom your parents love more than you. Vishnu&#39;s father believes he&#39;s good-for-nothing, but will that change?<br /><br /><strong>REVIEW:</strong>&nbsp;Vishnu is a young man craving for love from his parents who seem to love his cousin Veda, aka Ammu, more. He believes, ever since she entered his life, it has become one of negligence and servitude. The only place he can find solace is with Ammu&#39;s parents, who feel as neglected by their daughter as Vishnu.<br /><br />Vishnu&#39;s father, Sekhar, is a school principal respected by many for what he has done for the village. He brings up Ammu as his own because he feels she&#39;s the reincarnation of his mother. While Ammu grows up as a perfect child under his mentor-ship, Vishnu&#39;s childhood is that of a rebel. Even when his actions almost break the friendship between his father and the character of Tanikella Bharani, he feels no remorse; that&#39;s how adamant he is.<br /><br />The movie is set in the beautiful locales of Konaseema, and the plot takes its own sweet time to set the pace and explore the relationship between Vishnu and Ammu. Taking up an hour for the same would seem draggy at parts, if not for comic relief provided by Satya Akkala, who plays Vishnu&#39;s best friend. In fact, Satya almost seems to be overshadowing the protagonist duo in the first half, until the story takes a melodramatic turn in the second.<br /><br />The use of a character of a child-abuser to disconcertingly provide comic relief and its consequential solution that seemed straight out of cinema&#39;s black-and-white days (the victim marrying the abuser), the movie does have its irrational moments. However, what was even more absurd was an educated Ammu agreeing to it with the illiterate villagers.<br /><br />But other than that, the second half has nothing much to write home about. The customary kidnap scene that leads to an obligatory fight and the sudden transition of Vishnu announcing his love for Ammu seem to lack flow. Ammu on the other hand doesn&#39;t express her love to protect her beloved uncle&#39;s &#39;respect and honour&#39;, but yet feels justified in asking Vishnu to elope with her.<br /><br />Tagubothu Ramesh acts as a catalyst in the film&#39;s key moments and Dhanraj has a forgettable cameo. The lead actors are okay in their roles, with debutant Bharat doing a decent job. Watch the movie if you&#39;re in for a feel-good film that explores relationships on a relatable level and has beautifully rustic visuals. Give this one a miss if you&#39;re looking for logic.&nbsp;</p>'),
(3, 'spyder', '3.5', 'Sept  27, 2017', 'spyder.jpg', 'spyder1.jpg', '<p>Shiva, an officer in the Intelligence Bureau office spies on the ones who need help. He develops a software to listen to the needing ones by tracking their phone call. One day, he listens to a lady Charlie talking about her wish with her friend. Later, they develop feelings for each other. After he listens to a girl asking her friend for help as she is lonely in her house, he sends his friend and police constable Renuka to help the girl. But the next day, he finds them dead. To know who murdered them, he sets out to spy the girl&#39;s chats and police commissioner&#39;s calls. He finds that a guy followed her at a cafe. He learns the past about the guy Bhairavudu that Bhairavudu has an anxiety to kill people and see the victims&#39; family crying. Shiva then catches the guy but he is revealed to be Bhairavudu&#39;s brother. Bhairavudu threatens the whole citizens to leave his brother free. Shiva kills Bhairavudu&#39;s brother which angers Bhairavudu. After many chases, Shiva arrests Bhairavudu. Then Bhairavudu tells him that he had already planned a big rock fall in the city. Shiva stops the big rock which had crushed many cars in the city and thus saves the people. Bhairavudu escapes from the police quarters and plans to destroy a hospital. Shiva reaches there by time but couldn&#39;t save few patients. Lastly, Shiva kills Bhairavudu and tells media about humanity.</p>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `details`
--
ALTER TABLE `details`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
