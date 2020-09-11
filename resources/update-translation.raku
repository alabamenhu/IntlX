#!/usr/bin/env perl6
use lib ($?FILE.IO.sibling("lib"));
use Support;

my $x-file = $?FILE.IO.sibling("Exception.pm6");
my $n-file = $?FILE.IO.sibling("translation-notes").add("root");
my @exclude = <Exception X::Method::NotFound X::StubCode CX::Warn>;


sub MAIN ($lang) {
    #my $lang = 'ast';
    my $t-file = $?FILE.IO.parent.sibling('lib').add('Intl').add('X').add("$lang.pm6");
    my $b-file = $?FILE.IO.parent.sibling('lib').add('Intl').add('X').add("{ $lang }_BACKUP.pm6");

    my $orig = $t-file.slurp;

    my $misc-header = '# BEGIN SPECIAL TRANSLATIONS (DO NOT EDIT THIS LINE)';
    my $misc-footer = '# END SPECIAL TRANSLATIONS (DO NOT EDIT THIS LINE)';
    my $main-header = '# BEGIN MAIN TRANSLATIONS (DO NOT EDIT THIS LINE)';

    # Step 1
    # Handle special translations (these are not technically messages,
    # and may be specially composed by the Intl::X module).

    # 1.a: Find special translation position information
    my $misc-header-start = $orig.index: $misc-header
            or die "Could not locate header for special translations (BEGIN SPECIAL TRANSLATIONS)";
    my $misc-footer-start = $orig.index: $misc-footer
            or die "Could not locate footer for special translations (BEGIN SPECIAL TRANSLATIONS)";
    my $misc-header-end = $orig.index: "\n", $misc-header-start;

    # 1.b: Parse out translations
    my %misc;
    my regex header-translation {
        \' $<class>=(.*?) \'
        # key (quoted class name)
        <.ws> '=>' <.ws>
        # fat comma
        'method' <.ws>
        # value (method)
        '{'$<content>=(.*)'},' $
        #   contents of method
    }

    my $header = trim $orig.substr: $misc-header-end, $misc-footer-start - $misc-header-end;

    for $header.lines {
        $_ ~~ &header-translation;
        %misc{$<class>} = $<content>;
    }

    # Step 2
    # Grab all the original translations
    my %main;
    my regex main-translation {
        '# Class:'         <.ws> $<class>=[\S+] <.ws>
        '# Status:'        <.ws> $<status>=[<-[\n]>+] \n
        ['# Note:'          <.ws> $<note>=[<-[\n]> || \n <!before '# Original Code'> || <!>]*]?
        '# Original Code:' <.ws> $<code>=[<-[\n]> || \n '#' || <!>]*
    }

    #my $main-header-start = $orig.index: $main-header
    #        or die "Could not locate header for main translations (BEGIN MAIN TRANSLATIONS)";
    #my $main-header-end = $orig.index: "\n", $main-header-start;


    my $class = '';
    my $status = '';
    my $note-finished = False;
    my $code-finished = False;
    my $note = '';
    my $code = '';
    my $trans = '';
    my $trans-started = False;
    # Messy, but effective.
    for $orig.substr($misc-footer-start).lines -> $line {
        if $class eq '' {
            if $line ~~ /^'# Class:' <.ws> $<class>=\S+/ {
                $class = $<class>;
            }
        } elsif $status eq '' {
            if $line ~~ /^'# Status:' <.ws> $<status>=<-[\n]>+/ {
                $status = ~$<status>;
            }else {
                die "Invalid status line";
            }
        } elsif !$note-finished {
            if $line.starts-with('# Original Code:') {
                $note-finished = True;
            }elsif $line ~~ /'# Note:' <.ws> $<note>=<-[\n]>+/ {
                $note ~= $<note>;
            }else {
                $note ~= "\n";
                $note ~= $line.substr(1).trim;
            }
        } elsif !$code-finished { # we have code
            if $line.starts-with('#') {
                $code ~= "\n" if $code;
                $code ~= $line.substr(1);
            }else {
                $code-finished = True;
                if $line.starts-with("'$class'") {
                    $trans-started = True;
                }
            }
        } elsif !$trans-started {
            if $line.starts-with("'$class'") {
                $trans-started = True;
            }
        } else {
            if $line.starts-with('},') {
                #say "saving data for $class";
                %main{$class} = %(
                    :$note,
                    :$trans,
                    :$code,
                    :$status
                );

                $trans-started = False;
                $code-finished = False;
                $note-finished = False;
                $trans = "";
                $code = "";
                $class = "";
                $status = "";
            }else {
                $trans ~= "\n" if $trans;
                $trans ~= $line;
            }
        }
    }

    # Step 3
    # Read in a fresh version of notes
    my %notes := notes-in-file $n-file;

    # Step 4
    # Read in a fresh copy of exceptioins code
    my %exceptions = exceptions-in-file $x-file, :@exclude;

    # Step 5
    # Now step through all new exceptions, plucking them out
    my %new-x;
    #| Quickly compares code to see if they are functionally identical

    for %exceptions.keys -> $x {
        if %main{$x}:exists {
            # Check if there are changes
            if compare-code %main{$x}<code>, %exceptions{$x} {
                # Just use a refreshed note, in case it changed
                %new-x{$x} = %(
                    class => $x,
                    status => %main{$x}<status>,
                    note => (%notes{$x} // ''),
                    code => %exceptions{$x},
                    trans => %main{$x}<trans>
                );
                %main{$x}:delete;
            }else {
                # There was an update, alert unless status was already todo
                %new-x{$x} = %(
                    class => $x,
                    status => %main{$x}<status>.starts-with('TO DO') ?? 'TO DO' !! 'REVISION REQUIRED',
                    note => (%notes{$x} // ''),
                    code => %exceptions{$x},
                    trans => %main{$x}<trans>
                );
                %main{$x}:delete;
            }
        }else {
            # This is a brand new exception
            %new-x{$x} = %(
                class => $x,
                status => "TO DO",
                note => (%notes{$x} // ''),
                code => %exceptions{$x},
                trans => %exceptions{$x},
            )
        }
    }

    # Note that anything left in main is now deprecated.  This is highly unlikely


    my $rewrite = '';

    # restore the old intro text (includes header)
    $rewrite ~= $orig.substr(0, $misc-header-end);

    # restore the special transaltions
    my $width-key = %misc.keys>>.chars.max;
    my $width-value = %misc.values>>.trim>>.chars.max;
    for %misc.keys.sort -> $key {
        $rewrite ~= "\n"
                ~ "'$key' "
                ~ " " x ($width-key - $key.chars)
                ~ ' => method { '
                ~ %misc{$key}.trim
                ~ " " x ($width-value - %misc{$key}.trim.chars)
                ~ ' },';
    }

    # restore the rest of the text
    my $start-of-translations = $orig.index('# Class:', $misc-footer-start);

    $rewrite ~= "\n" ~ $orig.substr($misc-footer-start, $start-of-translations - $misc-footer-start);

    for %new-x.keys.sort -> $key {
        $rewrite ~= "\n"
                ~ "# Class: " ~ %new-x{$key}<class> ~ "\n"
                ~ "# Status: " ~ %new-x{$key}<status>;
        if %new-x{$key}<note> {
            $rewrite ~= "\n" ~ "# Notes:  " ~ %new-x{$key}<note>.lines[0];
            if %new-x{$key}<note>.lines > 0 {
                $rewrite ~= "\n" ~ "#         " ~ $_ for %new-x{$key}<note>.lines[1 ..*];
            }
        }

        $rewrite ~= "\n" ~ "# Original Code:";
        $rewrite ~= "\n#$_" for %new-x{$key}<code>.lines;
        $rewrite ~= "\n\n";
        $rewrite ~= "'" ~ %new-x{$key}<class> ~ "' => method \{";
        $rewrite ~= "\n" ~ $_ for %new-x{$key}<trans>.lines;
        $rewrite ~= "\n" ~ '},';
        $rewrite ~= "\n\n\n";
    }

    if %main.elems > 0 {
        say "Please be aware that some exceptions had been translated ";
        say "that apparently do not exist.  They include: ";
        say "  $_" for %main.keys;
        say "These may be found in the backup file.";
        say "";
    }

    $b-file.spurt: $t-file.slurp;
    $t-file.spurt: $rewrite;

    say "Translation file for $lang was updated.  Current status:";
    for %new-x.values.categorize(*.<status>) {
        say "  { .value.elems }\t{ .key }";
    }
    say "In case there was an error, a backup file was made in { $lang }_BACKUP.pm6";
}