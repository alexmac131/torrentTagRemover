#!/usr/bin/perl
use Cwd;
use File::Find;
use File::Copy qw(move);

#####
# To scan for files that have the junk torrent tags or other unwanted markers within the file name.
# The caution is some tags may be legit in the file name but we will remove them

# later this will be an arrage of directories to check
$basedir = "/Volumes/movies/movies/";
#$basedir = "/Volumes/educational/educational/";
#$basedir = "/Volumes/tvshows/tvshows/";
#$basedir = "/Volumes/tvshows/videos/";

# this is the tags to remove 
@remove = qw[ \[ \] eztv x264 AAC  lol hdtv yify 720p 1080p QPEL DIMENSION DVDRIP ETRG xvid bbrip ChattChitto ac3 -ift hdrip  brip RARBG -EVO __ wwww torentz .ro 3xforum  ' ' JKY DTS FXG hindi maxspeed dvdscr]  ;

find(\&test, $basedir);

sub test {
    my $test = $_ ;
    my $match = 0;
    if (-f $_) {
        my $origin = $test; 
        foreach my $toTest (@remove) {
        
            if ($test =~ s/\Q$toTest//i) {
                #print "Match " . $test . " \n";
                $match = 1;
            }
        }
        # we want to remove unwanted artifacts like ... or .-. 
        if ($match) {
           $match = 0;
           $test =~ s/\.-\././g;
           $test =~ s/\.mp4\.mp4/\.mp4/g;
           $test =~ s/\.mkv\.mkv/\.mkv/g;
           $test =~ s/\.{2,}/./g;
           $test =~ s/ /_/g;
           $test =~ s/_{2,}/_/g;
           print "Finaly ($origin)---> $test \n";
           print getcwd();
        $cwd = getcwd();
        $src = $cwd . "/" . $origin;
        $target = $cwd . "/" . $test;
        print "--->$src $target \n";
        move $src,  $target ;
        }
        # once we have a clean new name we will take the original and rename it to the new set
        # we do this after all the other steps to allow for possible human review before changes 
        # to be written in the future.
        #move $cwd .  $orgin $cwd . $test;
    
    }

}

