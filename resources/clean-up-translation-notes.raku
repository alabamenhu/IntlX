#!/usr/bin/env raku

use lib $?FILE.IO.sibling('lib');
use Support;

#| Automated mode
multi sub MAIN(
         *@language, #= Language(s) to cleanup
    Bool :$v;        #= Verbose mode
) {
    for @language -> $lang {
        print "Processing $lang ... " if $v;

        my $file  = $?FILE.IO.sibling('translation-notes').dir(test => *.lc eq $lang.lc).head;
        my %notes = notes-in-file $file;
        my $clean = "";

        for %notes.keys.sort -> $x {
            $clean ~= "CLASS $x\n" ~ %notes{$x} ~ "\n\n";
        }
        $file.spurt: $clean.trim;
        say "OK" if $v;
    }
    say "Done" if $v;
}

#| Interactive mode
multi sub MAIN(
    Bool :$h, #= Display this help
    Bool :$v; #= Verbose mode
) {
    say USAGE() andthen exit if $h;

    my @available = $?FILE.IO.sibling('translation-notes').dir(test => *ne '.' | '..')».basename;

    say   "The following languages are available:";
    say   "  " ~ @available.join(" ");
    say   "Which language(s) would you like to clean up? (use * for all)";
    print "> ";

    my @languages = $*IN.get.comb(/[<[a..zA..Z]>+]+ % '-'/)>>.lc;

    if my %garbage = @languages (-) @available {
        say "The following languages do not exist: ";
        say "  " ~ %garbage.keys.join(" ");
        @languages = (@languages (-) %garbage).keys;
    }

    MAIN @languages

}

sub USAGE {
    $*USAGE ~ q:to/USAGE/;


    This module will clean up translation notes by ordering them
    alphabetically and inserting exactly one bare new line between
    each translation.  To use, simply specify the language of the
    translations notes to be updated.  If no language is indicated,
    then the 'root' translation notes will be cleaned up.
    USAGE

}