#!/usr/bin/env perl6

=begin pod
This is a super simple parser that relies on the fact that Rakudo's code base follows
fairly good code indenting.  This way we can look for a specific indent.  If Rakudo's
style changes, a newer parser may be needed.
=end pod

# The following exceptions are explicitly excluded, because they have
# code that is sufficiently complex and sensitive that it's best to request
# specific sub-phrases as a special translation and have X.pm6 handle things.
my @excluded = <Exception X::Method::NotFound X::StubCode CX::Warn>;

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



sub MAIN() {
    # Grab any translation notes.
    # These will be included with POD to aide translators.
    my %notes;
    my $note-file = "translation-notes/root".IO.slurp;
    for ($note-file ~~ m:g/^^CLASS <.ws> $<class>=(\S+) <.ws> $<note>=(.*?) <before $$ <.ws> [CLASS|$]>/) -> $/ {
        %notes{~$<class>} = ~$<note>;
    }

    my $file = "Exception.pm6".IO;

    my $in-class = False;
    my $in-method = False;
    my $class = "";
    my $method = "";
    my $method-indent = "";
    my %exceptions;

    for $file.lines -> $line {
        if not $in-class {
            if $line ~~ &class-header {
                next if $<class> eq any @excluded;
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

    say "Found {%exceptions.keys.elems} exceptions";
    my $translation-template = q:to/HEADER/;
        # EXCEPTIONS LOCALIZATION FOR ----
        #
        # Note that this file has been automatically generated.
        # Do NOT allow a code editor to reformat, as it will mess up (NYI) comparison
        # and update scripts.
        #
        # 1. Change the ?? to your language code
        unit module Intl::X::??;
        # 2. Rename this template file to match the language code
        # 3. Place in the lib/Intl/X/ directory.
        # 4. Add the module to the 'provides' section of META6.json
        # 5. Violà :-)

        use MONKEY-GUTS;

        our %exceptions = Map.new:

        # These first few are special translations that are not directly messages,
        # but may be produced as a part of other messages.  They should be very stable
        # however should be checked upon each release that they match the current set
        # of special translations.  All translations MUST exist on a single line for
        # proper post-processing.
        #
        # BEGIN SPECIAL TRANSLATIONS (DO NOT EDIT THIS LINE)
        'Exception.something-wrong'           => method { "Something went wrong in {self.WHAT.gist}" },
        'Exception.died-with'                 => method { "Died with {self.^name}"                   },
        'Exception.no-backtrace'              => method { '  (no backtrace available)'               },
        'Exception.unknown'                   => method { "Unthrown {self.^name} with no message"    },
        'X::Comp::Group.sorry'                => method { 'SORRY!'                                   },
        'X::Comp::Group.difficulties'         => method { 'Potential difficulties:'                  },
        'X::Comp::Group.other-diff'           => method { 'Other potential difficulties:'            },
        'X::SecurityPolicy::Eval.payload'     => method { 'EVAL is a very dangerous function!!!'     },
        'X::AdHoc.payload'                    => method { 'Unexplained error'                        },
        'X::StubCode.default'                 => method { 'Stub code executed'                       },
        'X::Met.default'                      => method { 'Stub code executed'                       },
        'X::Method::NotFound.of-type'         => method { "of type '$.typename'" },
        'X::Method::NotFound.no-public'       => method { "No such private method '!$.method' for invocant $.of-type" },
        'X::Method::NotFound.no-private'      => method { "No such method '$.method' for invocant $.of-type" },
        'X::Method::NotFound.private-sug'     => method { "Method name starts with '!', did you mean 'self!\"__INDIRECT-METHOD__\"()'?" },
        'X::Method::NotFound.suggestion'      => method { "Did you mean '@.suggestions[0]'?" },
        'X::Method::NotFound.suggestions'     => method { "Did you mean any of these: { @.suggestions.map( { "'$_'" } ).join(", ") }?" },
        'X::Method::NotFound.perhaps-public'  => method { "Perhaps a public method call must be used." },
        'X::Method::NotFound.perhaps-private' => method { "Perhaps a private method call must be used." },
        'X::Method::NotFound.possible'        => method { ($.addendum ?? "Other possible" !! "Possible") ~ " causes are:" },
        # END SPECIAL TRANSLATIONS (DO NOT EDIT THIS LINE)

        # For each of the following entries, do not edit the original code in
        # in the comment block, as it is used for tracking.
        # Only adjust the code inside of the primary method block.

        HEADER

    for %exceptions.sort -> (:$key, :$value) {
        my $note = %notes{$key};

        # The value already has a newline here
        $translation-template ~= "# Class:  $key\n";
        $translation-template ~= "# Status: TO DO\n";
        $translation-template ~= "# Note:   "~.lines.join("\n#         ")~"\n" with $note;
        $translation-template ~= "# Original Code:\n";
        $translation-template ~= "#" ~ $value.lines.join("\n#");
        $translation-template ~= "\n\n'$key' => method \{\n";
        $translation-template ~= $value;
        $translation-template ~= "\n\},\n\n\n";
    }
    "template.rakumod".IO.open(:w).print: $translation-template ~ ";";
}
