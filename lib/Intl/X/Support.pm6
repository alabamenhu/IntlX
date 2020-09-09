unit module Support;

# This currently copies the contents of Str.naive-word-wrapper, allowing
# us to use the method on compiler releases that lack it (pre-Summer 2020.

without Str.^find_method("naive-word-wrapper") {
    # A naive word wrapper intended to be used for aligning error messages.
    # Naive in the sense that it assumes all graphemes are the same width,
    # and words that are too long for a line, will simply live on a line of
    # their own, even if that is longer than the given maximum width.
    my &naive-word-wrapper = anon method naive-word-wrapper(
            int :$max    = 72,
            str :$indent = "",
            --> Str:D) is implementation-detail {
        my $lines := nqp::list_s;
        my $line  := nqp::list_s;
        my int $width = nqp::chars($indent);

        for self.words -> str $word {
            if $width + nqp::chars($word) >= $max {
                if nqp::elems($line) {
                    nqp::push_s(
                            $lines,
                            nqp::concat($indent,nqp::join(" ",$line))
                                                       );
                    $line := nqp::list_s($word);
                    $width = nqp::chars($indent) + nqp::chars($word);
                }
                else {
                    nqp::push_s($lines,nqp::concat($indent,$word));
                    $width = nqp::chars($indent);
                }
            }
            else {
                nqp::push_s($line,$word);
                $width = $width + 1 + nqp::chars($word);
            }

            # double space after . or ?
            if $word.ends-with('.') || $word.ends-with('?') {
                nqp::push_s($line,"");
                ++$width;
            }
        }

        nqp::pop_s($line) if nqp::elems($line) && nqp::atpos_s($line,-1) eq "";
        nqp::push_s($lines,nqp::concat($indent,nqp::join(" ",$line)))
        if nqp::elems($line);

        nqp::join("\n",$lines)
    }


    Str.^add_fallback:
        anon sub condition ($object, $want) { $want eq 'naive-word-wrapper' },
        anon sub calculate ($object, $want) {          &naive-word-wrapper  };

}