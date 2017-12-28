#!/usr/bin/env perl

use strict ;

my $DupCount = 0 ;

if (!@ARGV) {
    print "Usage: dups <file> ...\n" ;
    exit ;
}

while (1) {
    my $FileName = shift @ARGV ;

    exit $DupCount if (!$FileName) ;

    open FILE, $FileName or die $!;

    my $LastWord = "" ;
    my $LineNum = 0 ;

    while (<FILE>) {
        chomp ;

        $LineNum ++ ;

        my @words = split (/(\W+)/);

        foreach my $word (@words) {
            next if $word =~ /^\s*$/ ;

            if ($word =~ /^W+$/) {
                $LastWord = "" ;
                next ;
            }

            if (lc($word) eq lc($LastWord)) {
                print "$FileName:$LineNum $word\n" ;
                $DupCount ++ ;
            }

            $LastWord = $word ;
        }
    }

    close FILE ;
}