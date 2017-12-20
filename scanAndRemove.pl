#!/usr/bin/perl
use Cwd;
use File::Find;
use File::Copy qw(move);

#####
# To scan for files that have the junk torrent tags or other unwanted markers within the file name.
# The caution is some tags may be legit in the file name but we will remove them


@baseArray = qw (/Volumes/movies/movies/ /Volumes/educational/educational/  /Volumes/tvshows/tvshows/  /Volumes/tvshows/videos/ /Volumes/booksAndAudio/epubs /Volumes/booksAndAudio/audiobooks/ Volumes/booksAndAudio/ebooks/);

# this is the tags to remove 
@remove = qw[ \[ \] eztv x264 YTS AAC  lol hdtv yify 720p 1080p QPEL DIMENSION DVDRIP ETRG xvid bbrip ChattChitto ac3 -ift hdrip  brip RARBG -EVO __ wwww torentz .ro 3xforum JKY DTS FXG hindi maxspeed dvdscr WEB-DL  MkvCage h264 dd5 ethd brrip BOKUTOX axxo DMMovies KartiKing ExtraTorrentRG dummy]  ;

foreach  $basedir (@baseArray) {
    find(\&test, $basedir);
}

sub test {
    my $test = $_ ;
    my $match = 0;
    if (-f $_) {
        my $origin = $test; 
        foreach my $toTest (@remove) {
            if ($test =~ s/\Q$toTest//i) {
                print "Match " . $test . " \n";
                $match = 1;
            }
        }
        # we want to remove unwanted artifacts like ... or .-. 
        if ($match) {
           $match = 0;
           $test =~ s/\.-\././g;
           $test =~ s/\.mp4\.mp4/\.mp4/g;
           $test =~ s/\.mkv\.mkv/\.mkv/g;
           $test =~ s/\.{2,}/\./g;
           $test =~ s/ /_/g;
           $test =~ s/_{2,}/_/g;
           $test =~ s/_\./\./g;
            $cwd = getcwd();
            $src = $cwd . "/" . $origin;
            $target = $cwd . "/" . $test;
            move $src,  $target ;
        }
    }
}

