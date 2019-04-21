+--------------------------------------+
|  MLO - Movie Library Organizer 1.4v  |
+--------------------------------------+
---------------------------------------
+ Developed by Leonardo Monteiro.
+ Contact info: leonardomm037@gmail.com
---------------------------------------

SUMMARY--------------------------------------------------------------------------------------------------------------------------------
This algorithm was developed for a mine problem, that was:
Always that a download a movie by Torrent, besides the Movie File, the download brought some files about merchandasing
from the site that I download it and some times, subtitle files, that I doesn't want.
Already the movie's title it was composoed by the movie title, it premiere year, it resolution and the site's link that a downloaed it. And blank spaces replaced by dots, all these like the behind exemple for the fictitious movie "Leo's Adventures":

	Movie Libary/Leo's Adventures/
	
	SiteMerchandasing.png   Subtitles.sub   Leo's.Adventures.2019.1080p.www.leodownload.com.br.mkv   README.md   Merchandasing.mp4

So, what I want is: after executing the algorithm, there is just the movie file, renamed without dots, composed by just the movie name and the premiere year. So for the previous exemple, the result will be:

	Movie Libary/

	Leo's Adventures 2019.mkv

HOW TO USE-----------------------------------------------------------------------------------------------------------------------------
It's very simples, just follow the following steps:
 1. Give permission to MLO file to execute with the follow command on terminal:
	chmod +x MLO.sh
 2. Now you have two ways to execute it on your movie libary:
	2.1. Just to execute the MLO file on the movie libary folder, or
	2.2. Inform the folder path of your movie libary on the execute line command as a parameter, like the following example:
		./MLO.sh ~/Downloads/Movie\ Libary/
		("\" terminal notation to idicate a blank space on line command)

And just! After execute, your movies libary will be organized! For understand how it do it, read the next section.

HOW IT WORKS---------------------------------------------------------------------------------------------------------------------------
When the alorithm is executed on your movies libary the following steps will be executed for each movie folders:
 1. It will get in on movie folder (cd)
 2. It will regonaze the movie file

	Tactic: The largest file (du)
 
 3. The movie file will be moved for the previous folder (Movie Libary folder) (mv)
 4. It will get out of the movie folder (cd ..)
 5. The movie folder will be deleted, with all unwanted files inside (rm)
 6. Finally, the movie will be renamed (mv)

	Tactic: All the words before the movie resolution string (1080p, 720p, 2160p or 4K).

"If you are not me, first, thanks for to be using my script!
I feel very happy on to know that my solution it helps more people than me! (People with OCD, us! Haha)
And second, if possible, increments the following counter, and push the change to the repository!
For me know how much people one day use this algorithm!"

PEOPLE_THAT_USE_IT = 1;
