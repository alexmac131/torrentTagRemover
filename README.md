# NasCollectionTools

This repo is for cleaning the NAS Collection of movies, tvshows, documents, etc...  It is often tough to do find the right file when you have ugly tags. Such as w4f eetv skull2008 korsub webrip Blackjesus tdx jyk eztv x264 YTS AAC DHD FreeCourseSite lol nezu bluray w6f hdtv yify 720p 1080p QPEL DIMENSION DVDRIP ETRG xvid bbrip ChattChitto ac3 -ift hdrip brip RARBG (a few examples).

# Directories 
Often we have NAS drive collections. So I created a @baseArray ... In my example it is created for my own Nas colletion but not all of it.. I have included a commented out example and a base array.

#@baseArray = qw (/Volumes/movies/movies/ 
                  /Volumes/educational/educational/  
                  /Volumes/tvshows/tvshows/  
                  /Volumes/tvshows/videos/ 
                  /Volumes/booksAndAudio/epubs 
                  /Volumes/booksAndAudio/audiobooks/ 
                  Volumes/booksAndAudio/ebooks/);

@baseArray = qw (/Volumes/tvshows/videos/ );

# reqular expressions.

Inside the code is also some cleanup of artifacts such as __ .. -._ etc etc...  Generally it is flexible enough to just change the script and add the lines.  I'd recommend not removing the regular expressions unless you know what you are doing. I suspect you will be smarter than me.
