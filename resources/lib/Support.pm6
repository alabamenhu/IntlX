unit module ExceptionParser;

my rule class-header {
    ^ my class
        $<class>=(\S+)
    [[is|does] \S+]*
        '{'
        $     # this disallows stubs
}

my rule method-header {
    ^$<indent>=(\h*)method
        message ['(' ')']?
        '{'
        [$<oneliner>=[.*?] '}' \h* ]?  # a few exceptions are in a single line
    $
}



#| Does a rough parsing of a file to find exceptions
sub exceptions-in-file($file, :@exclude) is export {

    my $in-class = False;
    my $in-method = False;
    my $class = "";
    my $method = "";
    my $method-indent = "";
    my %exceptions;

    for $file.lines -> $line {
        if not $in-class {
            if $line ~~ &class-header {
                next if $<class> eq any @exclude;
                $class = ~$<class>;
                $in-class = True;
            }
        } elsif not $in-method {
            if $line ~~ &method-header {
                $method = "";
                with $<oneliner> {
                    $method = "        " ~ .Str;
                    $in-method = False;
                    $in-class = False;
                    %exceptions{$class} = $method;
                } else {
                    $in-method = True;
                    $method-indent = $<indent>;
                }
            }
        } else {
            if $line.starts-with("$method-indent}") {
                $in-class = False;
                $in-method = False;
                %exceptions{$class} = $method;
            }else{
                if $method {
                    $method ~= "\n" ~ $line;
                }else{
                    $method = $line;
                }
            }
        }
    }

    return %exceptions
}

#| Reads in the notes in a file.
sub notes-in-file($file) is export {
    my %notes;
    for ($file.slurp ~~ m:g/^^CLASS <.ws> $<class>=(\S+) <.ws> $<note>=(.*?) <before $$ <.ws> [CLASS|$]>/) -> $/ {
        %notes{~$<class>} = ~$<note>;
    }
    %notes;
}

#| Quickly compares the code by compacting white space.
#| Comments may cause code to appear changed.
sub compare-code($a, $b) is export {
    $a.subst(/\s+/, ' ')
    eq
    $b.subst(/\s+/, ' ')
}
