#!/usr/bin/env perl6


sub MAIN(
        *@language-code, #= List of language codes to generate stats for (or all if blank)
        Bool :$d,        #= Print detailed stats
        Bool :$h         #= Print this help
    ) {

    if $h {
        say $*USAGE;
        exit;
    }

    @language-code = $?FILE.IO
            .parent
            .sibling('lib')
            .add('Intl')
            .add('X')
            .dir(test => * ne 'Support.pm6' | '.' | '..')
            .map({
                .basename.substr: ^(.basename.rindex: '.')
            });

    for @language-code -> $lang {
        my $file = $?FILE.IO.parent.sibling('lib').add('Intl').add('X').add("$lang.rakumod");
        my @status;
        @status.push: $0
            if $_ ~~ /^'# Status:'\h* (.*?)\h*$/
                for $file.lines;

        my %stats = @status.categorize(~*);
        my $total = %stats.values>>.elems.sum;
        my $todo  = %stats{"TO DO"}.elems;

        say (percent ($total - $todo) / $total) ~ " $lang";

        if $d {
            say "       - {.value.elems} {.key.lc}"
                for @status.categorize(~*);
        }
    }
}

sub percent ($_) {
    when * <= 0   { '  0.0%' }
    when * >= 1   { '100.0%' }
    when * >= 0.1 { (' '  ~ ($_ * 100) ~ '.0').substr(^5) ~ '%' }
    default       { ('  ' ~ ($_ * 100) ~ '.0').substr(^5) ~ '%' }
}