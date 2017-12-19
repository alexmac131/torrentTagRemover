#!/usr/bin/perl
use File::Find;

$basedir = "/Volumes/movies/movies/";

@remove = qw[ \[ \] eztv x264 AAC  lol hdtv yify];

find(\&test, $basedir);

sub test {
    my $test = $_ ;
    my $match = 0;
    if (-f $_) {
        foreach my $toTest (@remove) {
            if ($test =~ s/\Q$toTest//i) {
                #print "Match " . $test . " \n";
                $match = 1;
            }
        }
        if ($match) {
           $match = 0;
           $test =~ s/\.{2,}/./g;
           $test =~ s/\.-\././g;
           print "Finaly ---> $test \n";
        }
    }

}

