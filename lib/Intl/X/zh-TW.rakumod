# EXCEPTIONS LOCALIZATION FOR MANDARIN (TAIWAN)
#
# Note that this file has been automatically generated.
# Do NOT allow a code editor to reformat, as it will mess up (NYI) comparison
# and update scripts.
#
# 1. Change the ?? to your language code
unit module Intl::X::zh-TW;
# 2. Rename this template file to match the language code
# 3. Place in the lib/Intl/X/ directory.
# 4. Add the module to the 'provides' section of META6.json
# 5. Violà :-)

use MONKEY-GUTS;
use Intl::X::Support;

our %exceptions = Map.new:

# You may wish to create a glossary or provide other translation notes for
# future localizers to your language here.  All text before the first translation
# is preserved verbatim during updates, so you can also feel free to delete
# the instructions from this template.

# Glossary:
#
# backtrace: 回溯
# class: 類別
# function: 函式
# invocant: 呼叫主體
# method call: 方法呼叫
# method: 方法
# private method: 私人方法
# stub: 模擬程式碼
# subroutine: 副程式
# to die: 中止
# to throw: 丟出
# type: 型態

# These first few are special translations that are not directly messages,
# but may be produced as a part of other messages.  They should be very stable
# however should be checked upon each release that they match the current set
# of special translations.  All translations MUST exist on a single line for
# proper post-processing.
#
# BEGIN SPECIAL TRANSLATIONS (DO NOT EDIT THIS LINE)
'Exception.something-wrong'           => method { "在 {self.WHAT.gist} 裡發生錯誤"           },
'Exception.died-with'                 => method { "在 {self.^name} 中止"                     },
'Exception.no-backtrace'              => method { '  （沒有可用的回溯）'                     },
'Exception.unknown'                   => method { "尚未丟出的 {self.^name} 並沒有訊息"       },
'X::Comp::Group.sorry'                => method { '抱歉！'                                   },
'X::Comp::Group.difficulties'         => method { '潛在困難：'                               },
'X::Comp::Group.other-diff'           => method { '其他潛在困難：'                           },
'X::SecurityPolicy::Eval.payload'     => method { 'EVAL 是很危險的函式！！！'                },
'X::AdHoc.payload'                    => method { '無法解釋的錯誤'                           },
'X::StubCode.default'                 => method { '模擬程式碼已執行'                        },
'X::Method::NotFound.of-type'         => method { "型態「$.typename」的" },
'X::Method::NotFound.no-public'       => method { "為 $.of-type 的呼叫主體沒有「!$.method」的方法" },
'X::Method::NotFound.no-private'      => method { "為 $.of-type 的呼叫主體沒有「!$.method」的私人方法" },
'X::Method::NotFound.private-sug'     => method { "方法名稱開頭為「!」，您是指「self!\"__INDIRECT-METHOD__\"()」嗎？" },
'X::Method::NotFound.suggestion'      => method { "您是指「@.suggestions[0]」嗎？" },
'X::Method::NotFound.suggestions'     => method { "您是指{ @.suggestions.map( { "「$_」" } ).join("、") }其中之一嗎？" },
'X::Method::NotFound.perhaps-public'  => method { "也許應該使用公用方法呼叫" },
'X::Method::NotFound.perhaps-private' => method { "也許應該使用私人方法呼叫" },
'X::Method::NotFound.possible'        => method { ($.addendum ?? "其他" !! "") ~ "可能的原因：" },
# END SPECIAL TRANSLATIONS (DO NOT EDIT THIS LINE)

# For each of the following entries, do not edit the original code in
# in the comment block, as it is used for tracking.
# Only adjust the code inside of the primary method block.

# Class:  CX::Done
# Status: TO DO
# Note:   Currently untranslated in core.  Ensure 'done' is left verbatim.
# Original Code:
#        "<done control exception>"

'CX::Done' => method {
        "<done control exception>"
},


# Class:  CX::Emit
# Status: TO DO
# Note:   Currently untranslated in core.  Ensure 'emit' is left verbatim.
# Original Code:
#        "<emit control exception>"

'CX::Emit' => method {
        "<emit control exception>"
},


# Class:  CX::Last
# Status: TO DO
# Note:   Currently untranslated in core.  Ensure 'last' is left verbatim.
# Original Code:
#        "<last control exception>"

'CX::Last' => method {
        "<last control exception>"
},


# Class:  CX::Next
# Status: TO DO
# Note:   Currently untranslated in core.  Ensure 'next' is left verbatim.
# Original Code:
#        "<next control exception>"

'CX::Next' => method {
        "<next control exception>"
},


# Class:  CX::Proceed
# Status: TO DO
# Note:   Currently untranslated in core.  Ensure 'proceed' is left verbatim.
# Original Code:
#        "<proceed control exception>"

'CX::Proceed' => method {
        "<proceed control exception>"
},


# Class:  CX::Redo
# Status: TO DO
# Note:   Currently untranslated in core.  Ensure 'redo' is left verbatim.
# Original Code:
#        "<redo control exception>"

'CX::Redo' => method {
        "<redo control exception>"
},


# Class:  CX::Return
# Status: TO DO
# Note:   Currently untranslated in core.  Ensure 'return' is left verbatim.
# Original Code:
#        "<return control exception>"

'CX::Return' => method {
        "<return control exception>"
},


# Class:  CX::Succeed
# Status: TO DO
# Note:   Currently untranslated in core.  Ensure 'succeed' is left verbatim.
# Original Code:
#        "<succeed control exception>"

'CX::Succeed' => method {
        "<succeed control exception>"
},


# Class:  CX::Take
# Status: TO DO
# Note:   Currently untranslated in core.  Ensure 'take' is left verbatim.
# Original Code:
#        "<take control exception>"

'CX::Take' => method {
        "<take control exception>"
},


# Class:  X::AdHoc
# Status: TO DO
# Note:   The SlurpySentry referenced is an old internal role, nowadays unused.
#         Most languages should simply use '$.payload.Str' as the entire method,
#         which is what core should probably do as well.
# Original Code:
#        # Remove spaces for die(*@msg)/fail(*@msg) forms
#        given $.payload {
#            when SlurpySentry {
#                $_.list.join;
#            }
#            default {
#                .Str;
#            }
#        }

'X::AdHoc' => method {
        # Remove spaces for die(*@msg)/fail(*@msg) forms
        $.payload.Str
},


# Class:  X::Adverb
# Status: TO DO
# Note:   Use the method access for the instance variables (@.unexpected, @.nogo, etc).
#         You may need to substantially rewrite the logic to create a text that is
#         grammatically correct for your language.  The $.what contains one of three
#         string values: '{} slice', '[] slice', 'slice'.
# Original Code:
#        my $text = '';
#        if @!unexpected.elems -> $elems {
#            $text = $elems > 1
#              ?? "$elems unexpected adverbs ('@.unexpected.join("', '")')"
#              !! "Unexpected adverb '@!unexpected[0]'"
#        }
#        if @!nogo {
#            $text ~= $text ?? " and u" !! "U";
#            $text ~= "nsupported combination of adverbs ('@.nogo.join("', '")')";
#        }
#        ($text ~ " passed to $!what on '$!source'.").naive-word-wrapper

'X::Adverb' => method {
        my $text = '';
        if @.unexpected.elems -> $elems {
            $text = $elems > 1
              ?? "$elems unexpected adverbs ('@.unexpected.join("', '")')"
              !! "Unexpected adverb '@.unexpected[0]'"
        }
        if @.nogo {
            $text ~= $text ?? " and u" !! "U";
            $text ~= "nsupported combination of adverbs ('@.nogo.join("', '")')";
        }
        ($text ~ " passed to $.what on '$.source'.").naive-word-wrapper
},


# Class:  X::Anon::Augment
# Status: TO DO
# Note:   The package-types that are possible are <package module class grammar
#         role knowhow native slang block>.
# Original Code:
#        "Cannot augment anonymous $.package-kind"

'X::Anon::Augment' => method {
        "Cannot augment anonymous $.package-kind"
},


# Class:  X::Anon::Multi
# Status: TO DO
# Original Code:
#        "An anonymous $.routine-type may not take a $.multiness declarator"

'X::Anon::Multi' => method {
        "An anonymous $.routine-type may not take a $.multiness declarator"
},


# Class:  X::ArrayShapeMismatch
# Status: TO DO
# Original Code:
#        "Cannot assign an array of shape $.source-shape to an array of shape $.target-shape"

'X::ArrayShapeMismatch' => method {
        "Cannot assign an array of shape $.source-shape to an array of shape $.target-shape"
},


# Class:  X::Assignment::ArrayShapeMismatch
# Status: TO DO
# Original Code:
#        "Assignment to array with shape $.shape must provide structured data"

'X::Assignment::ArrayShapeMismatch' => method {
        "Assignment to array with shape $.shape must provide structured data"
},


# Class:  X::Assignment::RO
# Status: TO DO
# Note:   Use $.value instead of $!value
# Original Code:
#        nqp::isconcrete($!value)
#          ?? "Cannot modify an immutable {$!value.^name} ({
#                 Rakudo::Internals.SHORT-STRING: $!value
#             })"
#          !! "Cannot modify an immutable '{$!value.^name}' type object"

'X::Assignment::RO' => method {
        nqp::isconcrete($.value)
          ?? "Cannot modify an immutable {$.value.^name} ({
                 Rakudo::Internals.SHORT-STRING: $.value
             })"
          !! "Cannot modify an immutable '{$.value.^name}' type object"
},


# Class:  X::Assignment::RO::Comp
# Status: TO DO
# Original Code:
#        "Cannot assign to readonly variable {$.variable}"

'X::Assignment::RO::Comp' => method {
        "Cannot assign to readonly variable {$.variable}"
},


# Class:  X::Attribute::NoPackage
# Status: TO DO
# Original Code:
#        "You cannot declare attribute '$.name' here; maybe you'd like a class or a role?"

'X::Attribute::NoPackage' => method {
        "You cannot declare attribute '$.name' here; maybe you'd like a class or a role?"
},


# Class:  X::Attribute::Package
# Status: TO DO
# Note:   The package-types that are possible are <package module class grammar
#         role knowhow native slang block>.
# Original Code:
#        "A $.package-kind cannot have attributes, but you tried to declare '$.name'"

'X::Attribute::Package' => method {
        "A $.package-kind cannot have attributes, but you tried to declare '$.name'"
},


# Class:  X::Attribute::Regex
# Status: TO DO
# Original Code:
#        "Attribute '$.symbol' not available inside of a regex, since regexes are methods on the Cursor class. Consider storing the attribute in a lexical, and using that in the regex.".naive-word-wrapper

'X::Attribute::Regex' => method {
        "Attribute '$.symbol' not available inside of a regex, since regexes are methods on the Cursor class. Consider storing the attribute in a lexical, and using that in the regex.".naive-word-wrapper
},


# Class:  X::Attribute::Required
# Status: TO DO
# Note:   The reason is arbitrary text at the moment.  You may consider avoiding printing it.
# Original Code:
#        $.why && nqp::istype($.why,Str)
#          ?? "The attribute '$.name' is required because $.why,\nbut you did not provide a value for it."
#          !! "The attribute '$.name' is required, but you did not provide a value for it."

'X::Attribute::Required' => method {
        $.why && nqp::istype($.why,Str)
          ?? "The attribute '$.name' is required because $.why,\nbut you did not provide a value for it."
          !! "The attribute '$.name' is required, but you did not provide a value for it."
},


# Class:  X::Attribute::Scope::Package
# Status: TO DO
# Original Code:
#        "Cannot use '$.scope' with $.declaration declaration"

'X::Attribute::Scope::Package' => method {
        "Cannot use '$.scope' with $.declaration declaration"
},


# Class:  X::Attribute::Undeclared
# Status: TO DO
# Original Code:
#        "Attribute $.symbol not declared in $.package-kind $.package-name";

'X::Attribute::Undeclared' => method {
        "Attribute $.symbol not declared in $.package-kind $.package-name";
},


# Class:  X::Augment::NoSuchType
# Status: TO DO
# Original Code:
#        "You tried to augment $.package-kind $.package, but it does not exist"

'X::Augment::NoSuchType' => method {
        "You tried to augment $.package-kind $.package, but it does not exist"
},


# Class:  X::Backslash::NonVariableDollar
# Status: TO DO
# Original Code:
#        "Non-variable \$ must be backslashed"

'X::Backslash::NonVariableDollar' => method {
        "Non-variable \$ must be backslashed"
},


# Class:  X::Backslash::UnrecognizedSequence
# Status: TO DO
# Note:   Use $.suggestion instead of $!value.  You can also use $.suggestion.defined
#         to avoid NQP if you wish.
# Original Code:
#        "Unrecognized backslash sequence: '\\$.sequence'"
#        ~ (nqp::defined($!suggestion) ?? ". Did you mean $!suggestion?" !! '')

'X::Backslash::UnrecognizedSequence' => method {
        "Unrecognized backslash sequence: '\\$.sequence'"
        ~ (nqp::defined($.suggestion) ?? ". Did you mean $.suggestion?" !! '')
},


# Class:  X::Bind
# Status: TO DO
# Original Code:
#        $.target.defined
#            ?? "Cannot bind to $.target"
#            !! 'Cannot use bind operator with this left-hand side'

'X::Bind' => method {
        $.target.defined
            ?? "Cannot bind to $.target"
            !! 'Cannot use bind operator with this left-hand side'
},


# Class:  X::Bind::NativeType
# Status: TO DO
# Original Code:
#        "Cannot bind to natively typed variable '$.name'; use assignment instead"

'X::Bind::NativeType' => method {
        "Cannot bind to natively typed variable '$.name'; use assignment instead"
},


# Class:  X::Bind::Slice
# Status: TO DO
# Original Code:
#        "Cannot bind to {$.type.^name} slice";

'X::Bind::Slice' => method {
        "Cannot bind to {$.type.^name} slice";
},


# Class:  X::Bind::ZenSlice
# Status: TO DO
# Original Code:
#        "Cannot bind to {$.type.^name} zen slice";

'X::Bind::ZenSlice' => method {
        "Cannot bind to {$.type.^name} zen slice";
},


# Class:  X::Buf::AsStr
# Status: TO DO
# Original Code:
#        my $message = $.method.starts-with('Str')
#          ?? "Stringification of a {$.object.^name} is not done with '$.method'"
#          !! "A {$.object.^name} is not a Str, so using '$.method' will not work";
#        ($message ~ ". The 'decode' method should be used to convert a {$.object.^name} to a Str."
#        ).naive-word-wrapper

'X::Buf::AsStr' => method {
        my $message = $.method.starts-with('Str')
          ?? "Stringification of a {$.object.^name} is not done with '$.method'"
          !! "A {$.object.^name} is not a Str, so using '$.method' will not work";
        ($message ~ ". The 'decode' method should be used to convert a {$.object.^name} to a Str."
        ).naive-word-wrapper
},


# Class:  X::Buf::Pack
# Status: TO DO
# Original Code:
#        "Unrecognized directive '$.directive'";

'X::Buf::Pack' => method {
        "Unrecognized directive '$.directive'";
},


# Class:  X::Buf::Pack::NonASCII
# Status: TO DO
# Original Code:
#        "non-ASCII character '$.char' while processing an 'A' template in pack";

'X::Buf::Pack::NonASCII' => method {
        "non-ASCII character '$.char' while processing an 'A' template in pack";
},


# Class:  X::Caller::NotDynamic
# Status: TO DO
# Original Code:
#        "Cannot access '$.symbol' through CALLER, because it is not declared as dynamic";

'X::Caller::NotDynamic' => method {
        "Cannot access '$.symbol' through CALLER, because it is not declared as dynamic";
},


# Class:  X::Cannot::Capture
# Status: TO DO
# Original Code:
#        "Cannot unpack or Capture `$!what.gist()`.\n"
#          ~ "To create a Capture, add parentheses: \\(...)\n"
#          ~ 'If unpacking in a signature, perhaps you needlessly used'
#          ~ ' parentheses? -> ($x) {} vs. -> $x {}'
#          ~ "\nor missed `:` in signature unpacking? -> \&c:(Int) \{}";

'X::Cannot::Capture' => method {
        "Cannot unpack or Capture `$.what.gist()`.\n"
          ~ "To create a Capture, add parentheses: \\(...)\n"
          ~ 'If unpacking in a signature, perhaps you needlessly used'
          ~ ' parentheses? -> ($x) {} vs. -> $x {}'
          ~ "\nor missed `:` in signature unpacking? -> \&c:(Int) \{}";
},


# Class:  X::Cannot::Empty
# Status: TO DO
# Original Code:
#        "Cannot $.action from an empty $.what";

'X::Cannot::Empty' => method {
        "Cannot $.action from an empty $.what";
},


# Class:  X::Cannot::Junction
# Status: TO DO
# Original Code:
#        "Cannot use Junction '$.junction' $.for."

'X::Cannot::Junction' => method {
        "Cannot use Junction '$.junction' $.for."
},


# Class:  X::Cannot::Lazy
# Status: TO DO
# Original Code:
#        $.what
#          ?? "Cannot $.action a lazy list onto a $.what"
#          !! "Cannot $.action a lazy list";

'X::Cannot::Lazy' => method {
        $.what
          ?? "Cannot $.action a lazy list onto a $.what"
          !! "Cannot $.action a lazy list";
},


# Class:  X::Cannot::Map
# Status: TO DO
# Original Code:
#        my $message = "Cannot map a $.what using $.using";
#        $.suggestion ?? "$message\n$.suggestion" !! $message

'X::Cannot::Map' => method {
        my $message = "Cannot map a $.what using $.using";
        $.suggestion ?? "$message\n$.suggestion" !! $message
},


# Class:  X::Cannot::New
# Status: TO DO
# Original Code:
#        "Cannot make a {$.class.^name} object using .new";

'X::Cannot::New' => method {
        "Cannot make a {$.class.^name} object using .new";
},


# Class:  X::Comp::BeginTime
# Status: TO DO
# Note:   Make sure to use $.exception and $.use-case instead of $!exception and $!use-case
# Original Code:
#        $!exception ~~ X::MOP
#            ?? $!exception.message
#            !! "An exception occurred while $!use-case"

'X::Comp::BeginTime' => method {
        $.exception ~~ X::MOP
            ?? $.exception.message
            !! "An exception occurred while $.use-case"
},


# Class:  X::Comp::FailGoal
# Status: TO DO
# Original Code:
#        my $msg = "{ $.feature andthen "$_ not" orelse "Not" } yet implemented. Sorry.";
#        $msg ~= "\nDid you mean: {$.did-you-mean.gist}?" if $.did-you-mean;
#        $msg ~= "\nWorkaround: $.workaround" if $.workaround;
#        $msg

'X::Comp::FailGoal' => method {
        my $msg = "{ $.feature andthen "$_ not" orelse "Not" } yet implemented. Sorry.";
        $msg ~= "\nDid you mean: {$.did-you-mean.gist}?" if $.did-you-mean;
        $msg ~= "\nWorkaround: $.workaround" if $.workaround;
        $msg
},


# Class:  X::Comp::Group
# Status: TO DO
# Original Code:
#        my @m;
#        for @.sorrows {
#            @m.append(.message);
#        }
#        if $.panic {
#            @m.append($.panic.message);
#        }
#        for @.worries {
#            @m.append(.message);
#        }
#        @m.join("\n")

'X::Comp::Group' => method {
        my @m;
        for @.sorrows {
            @m.append(.message);
        }
        if $.panic {
            @m.append($.panic.message);
        }
        for @.worries {
            @m.append(.message);
        }
        @m.join("\n")
},


# Class:  X::Comp::WheneverOutOfScope
# Status: TO DO
# Original Code:
#        "Cannot have a 'whenever' block outside the scope of a 'supply' or 'react' block"

'X::Comp::WheneverOutOfScope' => method {
        "Cannot have a 'whenever' block outside the scope of a 'supply' or 'react' block"
},


# Class:  X::CompUnit::UnsatisfiedDependency
# Status: TO DO
# Original Code:
#        my $name = $.specification.short-name;
#        is-core($name)
#            ?? "{$name} is a builtin type, not an external module"
#            !! "Could not find $.specification in:\n"
#                ~ $*REPO.repo-chain.map(*.path-spec).join("\n").indent(4)
#                ~ ($.specification ~~ / $<name>=.+ '::from' $ /
#                    ?? "\n\nIf you meant to use the :from adverb, use"
#                        ~ " a single colon for it: $<name>:from<...>\n"
#                    !! self!is-missing-from-meta-file
#                        ?? "\n\nPlease note that a 'META6.json' file was found in '$*REPO.prefix.relative()',"
#                            ~ " of which the 'provides' section was used to determine if a dependency is available"
#                            ~ " or not.  Perhaps you need to add '$!specification' in the <provides> section of"
#                            ~ " that file?  Or need to specify a directory that does *not* have a 'META6.json' file?"
#                        !! ''
#                )

'X::CompUnit::UnsatisfiedDependency' => method {
        my $name = $.specification.short-name;
        is-core($name)
            ?? "{$name} is a builtin type, not an external module"
            !! "Could not find $.specification in:\n"
                ~ $*REPO.repo-chain.map(*.path-spec).join("\n").indent(4)
                ~ ($.specification ~~ / $<name>=.+ '::from' $ /
                    ?? "\n\nIf you meant to use the :from adverb, use"
                        ~ " a single colon for it: $<name>:from<...>\n"
                    !! #self!is-missing-from-meta-file
                       # ?? "\n\nPlease note that a 'META6.json' file was found in '$*REPO.prefix.relative()',"
                       #     ~ " of which the 'provides' section was used to determine if a dependency is available"
                       #     ~ " or not.  Perhaps you need to add '$.specification' in the <provides> section of"
                       #     ~ " that file?  Or need to specify a directory that does *not* have a 'META6.json' file?"
                       #`( !! ) ''
                )
},


# Class:  X::Composition::NotComposable
# Status: TO DO
# Original Code:
#        $!composer.^name ~ " is not composable, so $!target-name cannot compose it";

'X::Composition::NotComposable' => method {
        $.composer.^name ~ " is not composable, so $.target-name cannot compose it";
},


# Class:  X::Constructor::Positional
# Status: TO DO
# Original Code:
#        "Default constructor for '" ~ $.type.^name ~ "' only takes named arguments"

'X::Constructor::Positional' => method {
        "Default constructor for '" ~ $.type.^name ~ "' only takes named arguments"
},


# Class:  X::ControlFlow
# Status: TO DO
# Original Code:
#        "$.illegal without $.enclosing"

'X::ControlFlow' => method {
        "$.illegal without $.enclosing"
},


# Class:  X::ControlFlow::Return
# Status: TO DO
# Note:   Make sure to use $.out-of-dynamic-scope instead of $!out-of-dynamic-scope
# Original Code:
#        'Attempt to return outside of ' ~ (
#            $!out-of-dynamic-scope
#              ?? 'immediately-enclosing Routine (i.e. `return` execution is'
#               ~ ' outside the dynamic scope of the Routine where `return` was used)'
#              !! 'any Routine'
#        )

'X::ControlFlow::Return' => method {
        'Attempt to return outside of ' ~ (
            $.out-of-dynamic-scope
              ?? 'immediately-enclosing Routine (i.e. `return` execution is'
               ~ ' outside the dynamic scope of the Routine where `return` was used)'
              !! 'any Routine'
        )
},


# Class:  X::DateTime::InvalidDeltaUnit
# Status: TO DO
# Original Code:
#        "Cannot use unit $.unit with Date.delta";

'X::DateTime::InvalidDeltaUnit' => method {
        "Cannot use unit $.unit with Date.delta";
},


# Class:  X::DateTime::TimezoneClash
# Status: TO DO
# Original Code:
#        'DateTime.new(Str): :timezone argument not allowed with a timestamp offset';

'X::DateTime::TimezoneClash' => method {
        'DateTime.new(Str): :timezone argument not allowed with a timestamp offset';
},


# Class:  X::Declaration::OurScopeInRole
# Status: TO DO
# Original Code:
#        "Cannot declare our-scoped $.declaration inside of a role\n" ~
#        "(the scope inside of a role is generic, so there is no unambiguous\n" ~
#        "package to install the symbol in)"

'X::Declaration::OurScopeInRole' => method {
        "Cannot declare our-scoped $.declaration inside of a role\n" ~
        "(the scope inside of a role is generic, so there is no unambiguous\n" ~
        "package to install the symbol in)"
},


# Class:  X::Declaration::Scope::Multi
# Status: TO DO
# Original Code:
#        "Cannot use '$.scope' with individual multi candidates. Please declare an {$.scope}-scoped proto instead";

'X::Declaration::Scope::Multi' => method {
        "Cannot use '$.scope' with individual multi candidates. Please declare an {$.scope}-scoped proto instead";
},


# Class:  X::Dynamic::NotFound
# Status: TO DO
# Original Code:
#        "Dynamic variable $.name not found";

'X::Dynamic::NotFound' => method {
        "Dynamic variable $.name not found";
},


# Class:  X::Dynamic::Package
# Status: TO DO
# Original Code:
#        "Dynamic variables cannot have package-like names (with '::'), so '$!symbol' is not allowed.".naive-word-wrapper

'X::Dynamic::Package' => method {
        "Dynamic variables cannot have package-like names (with '::'), so '$.symbol' is not allowed.".naive-word-wrapper
},


# Class:  X::Dynamic::Postdeclaration
# Status: TO DO
# Original Code:
#        "Illegal post-declaration of dynamic variable '$.symbol'. Earlier access must be written as 'CALLERS::<$.symbol>' if that's what you meant.".naive-word-wrapper

'X::Dynamic::Postdeclaration' => method {
        "Illegal post-declaration of dynamic variable '$.symbol'. Earlier access must be written as 'CALLERS::<$.symbol>' if that's what you meant.".naive-word-wrapper
},


# Class:  X::EXPORTHOW::Conflict
# Status: TO DO
# Original Code:
#        "'EXPORTHOW::{$.directive}::{$.declarator}' conflicts with an existing meta-object imported into this lexical scope"

'X::EXPORTHOW::Conflict' => method {
        "'EXPORTHOW::{$.directive}::{$.declarator}' conflicts with an existing meta-object imported into this lexical scope"
},


# Class:  X::EXPORTHOW::InvalidDirective
# Status: TO DO
# Original Code:
#        "Unknown EXPORTHOW directive '$.directive' encountered during import"

'X::EXPORTHOW::InvalidDirective' => method {
        "Unknown EXPORTHOW directive '$.directive' encountered during import"
},


# Class:  X::EXPORTHOW::NothingToSupersede
# Status: TO DO
# Original Code:
#        "There is no package declarator '$.declarator' to supersede"

'X::EXPORTHOW::NothingToSupersede' => method {
        "There is no package declarator '$.declarator' to supersede"
},


# Class:  X::Encoding::AlreadyRegistered
# Status: TO DO
# Original Code:
#        "An encoding with name '$.name' has already been registered"

'X::Encoding::AlreadyRegistered' => method {
        "An encoding with name '$.name' has already been registered"
},


# Class:  X::Encoding::Unknown
# Status: TO DO
# Original Code:
#        "Unknown string encoding '$.name'"

'X::Encoding::Unknown' => method {
        "Unknown string encoding '$.name'"
},


# Class:  X::Eval::NoSuchLang
# Status: TO DO
# Original Code:
#        "No compiler available for language '$.lang'";

'X::Eval::NoSuchLang' => method {
        "No compiler available for language '$.lang'";
},


# Class:  X::Exhausted
# Status: TO DO
# Original Code:
#        $.reason
#          ?? "Could not create another $.what because of: $.reason"
#          !! "Could not create another $.what"

'X::Exhausted' => method {
        $.reason
          ?? "Could not create another $.what because of: $.reason"
          !! "Could not create another $.what"
},


# Class:  X::Experimental
# Status: TO DO
# Original Code:
#        "Use of $.feature is experimental; please 'use experimental :$.use'"

'X::Experimental' => method {
        "Use of $.feature is experimental; please 'use experimental :$.use'"
},


# Class:  X::Export::NameClash
# Status: TO DO
# Original Code:
#        "A symbol '$.symbol' has already been exported";

'X::Export::NameClash' => method {
        "A symbol '$.symbol' has already been exported";
},


# Class:  X::Hash::Store::OddNumber
# Status: TO DO
# Original Code:
#        my $msg =
#          "Odd number of elements found where hash initializer expected";
#        if $.found == 1 {
#            $msg ~= $.last
#              ?? ":\nOnly saw: $.last.raku()"
#              !! ":\nOnly saw 1 element"
#        }
#        else {
#            $msg ~= ":\nFound $.found (implicit) elements";
#            $msg ~= ":\nLast element seen: $.last.raku()" if $.last;
#        }

'X::Hash::Store::OddNumber' => method {
        my $msg =
          "Odd number of elements found where hash initializer expected";
        if $.found == 1 {
            $msg ~= $.last
              ?? ":\nOnly saw: $.last.raku()"
              !! ":\nOnly saw 1 element"
        }
        else {
            $msg ~= ":\nFound $.found (implicit) elements";
            $msg ~= ":\nLast element seen: $.last.raku()" if $.last;
        }
},


# Class:  X::HyperOp::Infinite
# Status: TO DO
# Original Code:
#        $.side eq "both"
#            ?? "Lists on both sides of hyperop of &.operator.name() are known to be infinite"
#            !! "List on $.side side of hyperop of &.operator.name() is known to be infinite"

'X::HyperOp::Infinite' => method {
        $.side eq "both"
            ?? "Lists on both sides of hyperop of &.operator.name() are known to be infinite"
            !! "List on $.side side of hyperop of &.operator.name() is known to be infinite"
},


# Class:  X::HyperOp::NonDWIM
# Status: TO DO
# Original Code:
#        "Lists on either side of non-dwimmy hyperop of &.operator.name() are not of the same length"
#        ~ " while recursing" x +$.recursing
#        ~ "\nleft: $.left-elems elements, right: $.right-elems elements";

'X::HyperOp::NonDWIM' => method {
        "Lists on either side of non-dwimmy hyperop of &.operator.name() are not of the same length"
        ~ " while recursing" x +$.recursing
        ~ "\nleft: $.left-elems elements, right: $.right-elems elements";
},


# Class:  X::HyperWhatever::Multiple
# Status: TO DO
# Original Code:
#        "Multiple HyperWhatevers and Whatevers may not be used together"

'X::HyperWhatever::Multiple' => method {
        "Multiple HyperWhatevers and Whatevers may not be used together"
},


# Class:  X::IO::BinaryAndEncoding
# Status: TO DO
# Original Code:
#        "Cannot open a handle in binary mode (:bin) and also specify an encoding"

'X::IO::BinaryAndEncoding' => method {
        "Cannot open a handle in binary mode (:bin) and also specify an encoding"
},


# Class:  X::IO::BinaryMode
# Status: TO DO
# Original Code:
#        "Cannot do '$.trying' on a handle in binary mode"

'X::IO::BinaryMode' => method {
        "Cannot do '$.trying' on a handle in binary mode"
},


# Class:  X::IO::Chdir
# Status: TO DO
# Original Code:
#        "Failed to change the working directory to '$.path': $.os-error"

'X::IO::Chdir' => method {
        "Failed to change the working directory to '$.path': $.os-error"
},


# Class:  X::IO::Chmod
# Status: TO DO
# Original Code:
#        "Failed to set the mode of '$.path' to '0o{$.mode.fmt("%03o")}': $.os-error"

'X::IO::Chmod' => method {
        "Failed to set the mode of '$.path' to '0o{$.mode.fmt("%03o")}': $.os-error"
},


# Class:  X::IO::Copy
# Status: TO DO
# Original Code:
#        "Failed to copy '$.from' to '$.to': $.os-error"

'X::IO::Copy' => method {
        "Failed to copy '$.from' to '$.to': $.os-error"
},


# Class:  X::IO::Cwd
# Status: TO DO
# Original Code:
#        "Failed to get the working directory: $.os-error"

'X::IO::Cwd' => method {
        "Failed to get the working directory: $.os-error"
},


# Class:  X::IO::Dir
# Status: TO DO
# Original Code:
#        "Failed to get the directory contents of '$.path': $.os-error"

'X::IO::Dir' => method {
        "Failed to get the directory contents of '$.path': $.os-error"
},


# Class:  X::IO::Directory
# Status: TO DO
# Original Code:
#        my $x = "'$.path' is a directory, cannot do '.$.trying' on a directory";
#        if $.use { $x ~= ", try '{$.use}()' instead" }
#        $x;

'X::IO::Directory' => method {
        my $x = "'$.path' is a directory, cannot do '.$.trying' on a directory";
        if $.use { $x ~= ", try '{$.use}()' instead" }
        $x;
},


# Class:  X::IO::DoesNotExist
# Status: TO DO
# Original Code:
#        "Failed to find '$.path' while trying to do '.$.trying'"

'X::IO::DoesNotExist' => method {
        "Failed to find '$.path' while trying to do '.$.trying'"
},


# Class:  X::IO::Flush
# Status: TO DO
# Original Code:
#        "Cannot flush handle: $.os-error"

'X::IO::Flush' => method {
        "Cannot flush handle: $.os-error"
},


# Class:  X::IO::Link
# Status: TO DO
# Original Code:
#        "Failed to create link called '$.name' on target '$.target': $.os-error"

'X::IO::Link' => method {
        "Failed to create link called '$.name' on target '$.target': $.os-error"
},


# Class:  X::IO::Lock
# Status: TO DO
# Note:   The lock-type is a semiarbitrary string defined as
#              '[non-]?blocking, [shared|exclusive]'
#         The OS error will likely be localized to the user's OS, or may be a numeric code.
# Original Code:
#        "Could not obtain $.lock-type lock: $.os-error"

'X::IO::Lock' => method {
        "Could not obtain $.lock-type lock: $.os-error"
},


# Class:  X::IO::Mkdir
# Status: TO DO
# Original Code:
#        "Failed to create directory '$.path' with mode '0o{$.mode.fmt("%03o")}': $.os-error"

'X::IO::Mkdir' => method {
        "Failed to create directory '$.path' with mode '0o{$.mode.fmt("%03o")}': $.os-error"
},


# Class:  X::IO::Move
# Status: TO DO
# Original Code:
#        "Failed to move '$.from' to '$.to': $.os-error"

'X::IO::Move' => method {
        "Failed to move '$.from' to '$.to': $.os-error"
},


# Class:  X::IO::NotAChild
# Status: TO DO
# Original Code:
#      "Path {$.child.raku} is not a child of path {$.path.raku}"

'X::IO::NotAChild' => method {
      "Path {$.child.raku} is not a child of path {$.path.raku}"
},


# Class:  X::IO::NotAFile
# Status: TO DO
# Original Code:
#        "'$.path' is not a regular file while trying to do '.$.trying'"

'X::IO::NotAFile' => method {
        "'$.path' is not a regular file while trying to do '.$.trying'"
},


# Class:  X::IO::Null
# Status: TO DO
# Original Code:
#        "Cannot use null character (U+0000) as part of the path"

'X::IO::Null' => method {
        "Cannot use null character (U+0000) as part of the path"
},


# Class:  X::IO::Rename
# Status: TO DO
# Original Code:
#        "Failed to rename '$.from' to '$.to': $.os-error"

'X::IO::Rename' => method {
        "Failed to rename '$.from' to '$.to': $.os-error"
},


# Class:  X::IO::Resolve
# Status: TO DO
# Original Code:
#        "Failed to completely resolve {$.path.raku}"

'X::IO::Resolve' => method {
        "Failed to completely resolve {$.path.raku}"
},


# Class:  X::IO::Rmdir
# Status: TO DO
# Original Code:
#        "Failed to remove the directory '$.path': $.os-error"

'X::IO::Rmdir' => method {
        "Failed to remove the directory '$.path': $.os-error"
},


# Class:  X::IO::Symlink
# Status: TO DO
# Original Code:
#        "Failed to create symlink called '$.name' on target '$.target': $.os-error"

'X::IO::Symlink' => method {
        "Failed to create symlink called '$.name' on target '$.target': $.os-error"
},


# Class:  X::IO::Unknown
# Status: TO DO
# Original Code:
#        "Unknown IO error trying '$.trying'"

'X::IO::Unknown' => method {
        "Unknown IO error trying '$.trying'"
},


# Class:  X::IO::Unlink
# Status: TO DO
# Original Code:
#        "Failed to remove the file '$.path': $.os-error"

'X::IO::Unlink' => method {
        "Failed to remove the file '$.path': $.os-error"
},


# Class:  X::IllegalDimensionInShape
# Status: TO DO
# Original Code:
#        "Illegal dimension in shape: $.dim. All dimensions must be integers bigger than 0"

'X::IllegalDimensionInShape' => method {
        "Illegal dimension in shape: $.dim. All dimensions must be integers bigger than 0"
},


# Class:  X::IllegalOnFixedDimensionArray
# Status: TO DO
# Original Code:
#        "Cannot $.operation a fixed-dimension array"

'X::IllegalOnFixedDimensionArray' => method {
        "Cannot $.operation a fixed-dimension array"
},


# Class:  X::Immutable
# Status: TO DO
# Original Code:
#        "Cannot call '$.method' on an immutable '$.typename'";

'X::Immutable' => method {
        "Cannot call '$.method' on an immutable '$.typename'";
},


# Class:  X::Import::MissingSymbols
# Status: TO DO
# Original Code:
#        "Trying to import from '$.from', but the following symbols are missing: "
#            ~ @.missing.join(', ');

'X::Import::MissingSymbols' => method {
        "Trying to import from '$.from', but the following symbols are missing: "
            ~ @.missing.join(', ');
},


# Class:  X::Import::NoSuchTag
# Status: TO DO
# Original Code:
#        "Error while importing from '$.source-package': no such tag '$.tag'"

'X::Import::NoSuchTag' => method {
        "Error while importing from '$.source-package': no such tag '$.tag'"
},


# Class:  X::Import::OnlystarProto
# Status: TO DO
# Original Code:
#        (@.symbols == 1
#           ?? "Cannot import symbol '@.symbols[0]' from '$.source-package-name', because only onlystar-protos ('proto foo(|) {*}') can be merged."
#           !! "Cannot import the following symbols from '$.source-package-name', only onlystar-protos ('proto foo(|) {*}') can be merged: { @.symbols.map( { "'$_'" } ).join(', ')}."
#        ).naive-word-wrapper

'X::Import::OnlystarProto' => method {
        (@.symbols == 1
           ?? "Cannot import symbol '@.symbols[0]' from '$.source-package-name', because only onlystar-protos ('proto foo(|) {*}') can be merged."
           !! "Cannot import the following symbols from '$.source-package-name', only onlystar-protos ('proto foo(|) {*}') can be merged: { @.symbols.map( { "'$_'" } ).join(', ')}."
        ).naive-word-wrapper
},


# Class:  X::Import::Positional
# Status: TO DO
# Original Code:
#        "Error while importing from '$.source-package':\n"
#        ~ "no EXPORT sub, but you provided positional argument in the 'use' statement"

'X::Import::Positional' => method {
        "Error while importing from '$.source-package':\n"
        ~ "no EXPORT sub, but you provided positional argument in the 'use' statement"
},


# Class:  X::Import::Redeclaration
# Status: TO DO
# Original Code:
#        (@.symbols == 1
#           ?? "Cannot import symbol '@.symbols[0]' from '$.source-package-name', because it already exists in this lexical scope."
#           !! "Cannot import the following symbols from '$.source-package-name', because they already exist in this lexical scope: { @.symbols.map( { "'$_'" } ).join(', ')}."
#        ).naive-word-wrapper

'X::Import::Redeclaration' => method {
        (@.symbols == 1
           ?? "Cannot import symbol '@.symbols[0]' from '$.source-package-name', because it already exists in this lexical scope."
           !! "Cannot import the following symbols from '$.source-package-name', because they already exist in this lexical scope: { @.symbols.map( { "'$_'" } ).join(', ')}."
        ).naive-word-wrapper
},


# Class:  X::Inheritance::NotComposed
# Status: TO DO
# Original Code:
#        "'$.child-name' cannot inherit from '$.parent-name' because '$.parent-name' isn't composed yet"
#            ~ ' (maybe it is stubbed)';

'X::Inheritance::NotComposed' => method {
        "'$.child-name' cannot inherit from '$.parent-name' because '$.parent-name' isn't composed yet"
            ~ ' (maybe it is stubbed)';
},


# Class:  X::Inheritance::SelfInherit
# Status: TO DO
# Original Code:
#        "'$.name' cannot inherit from itself."

'X::Inheritance::SelfInherit' => method {
        "'$.name' cannot inherit from itself."
},


# Class:  X::Inheritance::UnknownParent
# Status: TO DO
# Original Code:
#        my $message := "'" ~ $.child ~ "' cannot inherit from '" ~ $.parent ~ "' because it is unknown.";
#        if +@.suggestions > 1 {
#            $message := $message ~ "\nDid you mean one of these?\n    '" ~ @.suggestions.join("'\n    '") ~ "'\n";
#        } elsif +@.suggestions == 1 {
#            $message := $message ~ "\nDid you mean '" ~ @.suggestions[0] ~ "'?\n";
#        }
#        $message;

'X::Inheritance::UnknownParent' => method {
        my $message := "'" ~ $.child ~ "' cannot inherit from '" ~ $.parent ~ "' because it is unknown.";
        if +@.suggestions > 1 {
            $message := $message ~ "\nDid you mean one of these?\n    '" ~ @.suggestions.join("'\n    '") ~ "'\n";
        } elsif +@.suggestions == 1 {
            $message := $message ~ "\nDid you mean '" ~ @.suggestions[0] ~ "'?\n";
        }
        $message;
},


# Class:  X::Inheritance::Unsupported
# Status: TO DO
# Note:   Make sure to use $.parent and $.child-typename instead of $!parent and $!child-typename
# Original Code:
#        $!parent.^name ~ ' does not support inheritance, so '
#        ~ $!child-typename ~ ' cannot inherit from it';

'X::Inheritance::Unsupported' => method {
        $.parent.^name ~ ' does not support inheritance, so '
        ~ $.child-typename ~ ' cannot inherit from it';
},


# Class:  X::Invalid::ComputedValue
# Status: TO DO
# Original Code:
#        "$.name {"on $.method " if $.method}computed to $.value,"
#            ~ " which cannot be used"
#            ~ (" because $.reason" if $.reason);

'X::Invalid::ComputedValue' => method {
        "$.name {"on $.method " if $.method}computed to $.value,"
            ~ " which cannot be used"
            ~ (" because $.reason" if $.reason);
},


# Class:  X::Invalid::Value
# Status: TO DO
# Original Code:
#        "Invalid value '$.value' for :$.name on method $.method"

'X::Invalid::Value' => method {
        "Invalid value '$.value' for :$.name on method $.method"
},


# Class:  X::InvalidType
# Status: TO DO
# Original Code:
#        my $msg := "Invalid typename '$.typename'";
#        if +@.suggestions > 0 {
#            $msg := $msg ~ ". Did you mean '" ~ @.suggestions.join("', '") ~ "'?";
#        }
#        $msg;

'X::InvalidType' => method {
        my $msg := "Invalid typename '$.typename'";
        if +@.suggestions > 0 {
            $msg := $msg ~ ". Did you mean '" ~ @.suggestions.join("', '") ~ "'?";
        }
        $msg;
},


# Class:  X::InvalidTypeSmiley
# Status: TO DO
# Original Code:
#        "Invalid type smiley ':$.name' used, only ':D', ':U' and ':_' are allowed";

'X::InvalidTypeSmiley' => method {
        "Invalid type smiley ':$.name' used, only ':D', ':U' and ':_' are allowed";
},


# Class:  X::Item
# Status: TO DO
# Original Code:
#        "Cannot index {$.aggregate.^name} with $.index"

'X::Item' => method {
        "Cannot index {$.aggregate.^name} with $.index"
},


# Class:  X::Language::ModRequired
# Status: TO DO
# Original Code:
#        "Raku $.version requires $.modifier modifier"

'X::Language::ModRequired' => method {
        "Raku $.version requires $.modifier modifier"
},


# Class:  X::Language::TooLate
# Status: TO DO
# Original Code:
#        "Too late to switch language version. Must be used as the very first statement."

'X::Language::TooLate' => method {
        "Too late to switch language version. Must be used as the very first statement."
},


# Class:  X::Language::Unsupported
# Status: TO DO
# Original Code:
#        "No compiler available for Raku $.version"

'X::Language::Unsupported' => method {
        "No compiler available for Raku $.version"
},


# Class:  X::LibEmpty
# Status: TO DO
# Original Code:
#        q/Repository specification can not be an empty string.  Did you mean 'use lib "."' ?/

'X::LibEmpty' => method {
        q/Repository specification can not be an empty string.  Did you mean 'use lib "."' ?/
},


# Class:  X::LibNone
# Status: TO DO
# Original Code:
#        q/Must specify at least one repository.  Did you mean 'use lib "lib"' ?/

'X::LibNone' => method {
        q/Must specify at least one repository.  Did you mean 'use lib "lib"' ?/
},


# Class:  X::Localizer::NoContainer
# Status: TO DO
# Original Code:
#        "Can only use '$.localizer' on a container";

'X::Localizer::NoContainer' => method {
        "Can only use '$.localizer' on a container";
},


# Class:  X::Match::Bool
# Status: TO DO
# Original Code:
#        "Cannot use Bool as Matcher with '" ~ $.type ~ "'.  Did you mean to use \$_ inside a block?"

'X::Match::Bool' => method {
        "Cannot use Bool as Matcher with '" ~ $.type ~ "'.  Did you mean to use \$_ inside a block?"
},


# Class:  X::Method::InvalidQualifier
# Status: TO DO
# Original Code:
#          "Cannot dispatch to method $.method on {$.qualifier-type.^name} "
#        ~ "because it is not inherited or done by {$.invocant.^name}";

'X::Method::InvalidQualifier' => method {
          "Cannot dispatch to method $.method on {$.qualifier-type.^name} "
        ~ "because it is not inherited or done by {$.invocant.^name}";
},


# Class:  X::Method::Private::Permission
# Status: TO DO
# Original Code:
#        "Cannot call private method '$.method' on package '$.source-package' because it does not trust the '$.calling-package' package.".naive-word-wrapper

'X::Method::Private::Permission' => method {
        "Cannot call private method '$.method' on package '$.source-package' because it does not trust the '$.calling-package' package.".naive-word-wrapper
},


# Class:  X::Method::Private::Unqualified
# Status: TO DO
# Original Code:
#        "Calling private method '$.method' must be fully qualified with the package containing that private method.".naive-word-wrapper

'X::Method::Private::Unqualified' => method {
        "Calling private method '$.method' must be fully qualified with the package containing that private method.".naive-word-wrapper
},


# Class:  X::Mixin::NotComposable
# Status: TO DO
# Original Code:
#        "Cannot mix in non-composable type {$.rolish.^name} into object of type {$.target.^name}";

'X::Mixin::NotComposable' => method {
        "Cannot mix in non-composable type {$.rolish.^name} into object of type {$.target.^name}";
},


# Class:  X::Multi::Ambiguous
# Status: TO DO
# Original Code:
#        my @bits;
#        my @priors;
#        if $.capture {
#            for $.capture.list {
#                try @bits.push(.WHAT.raku);
#                @bits.push($_.^name) if $!;
#                when Failure {
#                    @priors.push(" " ~ .mess);
#                }
#            }
#            for $.capture.hash {
#                if .value ~~ Failure {
#                    @priors.push(" " ~ .value.mess);
#                }
#                if .value ~~ Bool {
#                    @bits.push(':' ~ ('!' x !.value) ~ .key);
#                }
#                else {
#                    try @bits.push(":$(.key)\($(.value.WHAT.raku))");
#                    @bits.push(':' ~ .value.^name) if $!;
#                }
#            }
#        }
#        else {
#            @bits.push('...');
#        }
#        if @.ambiguous[0].signature.gist.contains: ': ' {
#            my $invocant = @bits.shift;
#            my $first = @bits ?? @bits.shift !! '';
#            @bits.unshift($invocant ~ ': ' ~ $first);
#        }
#        my $cap = '(' ~ @bits.join(", ") ~ ')';
#        @priors = flat "Earlier failures:\n", @priors, "\nFinal error:\n " if @priors;
#        @priors.join ~ join "\n",
#            "Ambiguous call to '$.dispatcher.name()$cap'; these signatures all match:",
#            @.ambiguous.map: {
#                my $sig := .signature.raku.substr(1).subst(/ \s* "-->" <-[)]>+ /);
#                .?default ?? "  $sig is default" !! "  $sig"
#            }

'X::Multi::Ambiguous' => method {
        my @bits;
        my @priors;
        if $.capture {
            for $.capture.list {
                try @bits.push(.WHAT.raku);
                @bits.push($_.^name) if $!;
                when Failure {
                    @priors.push(" " ~ .mess);
                }
            }
            for $.capture.hash {
                if .value ~~ Failure {
                    @priors.push(" " ~ .value.mess);
                }
                if .value ~~ Bool {
                    @bits.push(':' ~ ('!' x !.value) ~ .key);
                }
                else {
                    try @bits.push(":$(.key)\($(.value.WHAT.raku))");
                    @bits.push(':' ~ .value.^name) if $!;
                }
            }
        }
        else {
            @bits.push('...');
        }
        if @.ambiguous[0].signature.gist.contains: ': ' {
            my $invocant = @bits.shift;
            my $first = @bits ?? @bits.shift !! '';
            @bits.unshift($invocant ~ ': ' ~ $first);
        }
        my $cap = '(' ~ @bits.join(", ") ~ ')';
        @priors = flat "Earlier failures:\n", @priors, "\nFinal error:\n " if @priors;
        @priors.join ~ join "\n",
            "Ambiguous call to '$.dispatcher.name()$cap'; these signatures all match:",
            @.ambiguous.map: {
                my $sig := .signature.raku.substr(1).subst(/ \s* "-->" <-[)]>+ /);
                .?default ?? "  $sig is default" !! "  $sig"
            }
},


# Class:  X::Multi::NoMatch
# Status: TO DO
# Note:   Make sure to use $.capture instead of $!capture
# Original Code:
#        my @cand = $.dispatcher.dispatchees.map(*.signature.gist);
#        my @un-rw-cand;
#        if first / 'is rw' /, @cand {
#            my $rw-capture = Capture.new(
#                :list( $!capture.list.map({ my $ = $_ })                  ),
#                :hash( $!capture.hash.map({ .key => my $ = .value }).hash ),
#            );
#            @un-rw-cand = $.dispatcher.dispatchees».signature.grep({
#                $rw-capture ~~ $^cand
#            })».gist;
#        }
#
#        my $where = so first / where /, @cand;
#        my @bits;
#        my @priors;
#        if $.capture {
#            for $.capture.list {
#                try @bits.push(
#                    $where ?? Rakudo::Internals.SHORT-STRING($_) !! .WHAT.raku ~ ':' ~ (.defined ?? "D" !! "U")
#                );
#                @bits.push($_.^name) if $!;
#                if nqp::istype($_,Failure) {
#                    @priors.push(" " ~ .mess);
#                }
#            }
#            for $.capture.hash {
#                if .value ~~ Failure {
#                    @priors.push(" " ~ .value.mess);
#                }
#                if .value ~~ Bool {
#                    @bits.push(':' ~ ('!' x !.value) ~ .key);
#                }
#                else {
#                    try @bits.push(":$(.key)\($($where
#                        ?? Rakudo::Internals.SHORT-STRING(.value)
#                        !! .value.WHAT.raku
#                    ))");
#                    @bits.push(':' ~ .value.^name) if $!;
#                }
#            }
#        }
#        else {
#            @bits.push('...');
#        }
#        if @cand && @cand[0] ~~ /': '/ {
#            my $invocant = @bits.shift;
#            my $first = @bits ?? @bits.shift !! '';
#            @bits.unshift($invocant ~ ': ' ~ $first);
#        }
#        my $cap = '(' ~ @bits.join(", ") ~ ')';
#        @priors = flat "Earlier failures:\n", @priors, "\nFinal error:\n " if @priors;
#        @priors.join ~ "Cannot resolve caller $.dispatcher.name()$cap; " ~ (
#            @un-rw-cand
#            ?? "the following candidates\nmatch the type but require "
#                ~ 'mutable arguments:' ~  join("\n    ", '', @un-rw-cand) ~ (
#                        "\n\nThe following do not match for other reasons:"
#                        ~  join("\n    ", '', sort keys @cand ∖ @un-rw-cand)
#                    unless @cand == @un-rw-cand
#                )
#            !! ( @cand
#                 ??  join "\n    ", 'none of these signatures match:', @cand
#                 !! "Routine does not have any candidates. Is only the proto defined?"
#               )
#        );

'X::Multi::NoMatch' => method {
        my @cand = $.dispatcher.dispatchees.map(*.signature.gist);
        my @un-rw-cand;
        if first / 'is rw' /, @cand {
            my $rw-capture = Capture.new(
                :list( $.capture.list.map({ my $ = $_ })                  ),
                :hash( $.capture.hash.map({ .key => my $ = .value }).hash ),
            );
            @un-rw-cand = $.dispatcher.dispatchees».signature.grep({
                $rw-capture ~~ $^cand
            })».gist;
        }

        my $where = so first / where /, @cand;
        my @bits;
        my @priors;
        if $.capture {
            for $.capture.list {
                try @bits.push(
                    $where ?? Rakudo::Internals.SHORT-STRING($_) !! .WHAT.raku ~ ':' ~ (.defined ?? "D" !! "U")
                );
                @bits.push($_.^name) if $!;
                if nqp::istype($_,Failure) {
                    @priors.push(" " ~ .mess);
                }
            }
            for $.capture.hash {
                if .value ~~ Failure {
                    @priors.push(" " ~ .value.mess);
                }
                if .value ~~ Bool {
                    @bits.push(':' ~ ('!' x !.value) ~ .key);
                }
                else {
                    try @bits.push(":$(.key)\($($where
                        ?? Rakudo::Internals.SHORT-STRING(.value)
                        !! .value.WHAT.raku
                    ))");
                    @bits.push(':' ~ .value.^name) if $!;
                }
            }
        }
        else {
            @bits.push('...');
        }
        if @cand && @cand[0] ~~ /': '/ {
            my $invocant = @bits.shift;
            my $first = @bits ?? @bits.shift !! '';
            @bits.unshift($invocant ~ ': ' ~ $first);
        }
        my $cap = '(' ~ @bits.join(", ") ~ ')';
        @priors = flat "Earlier failures:\n", @priors, "\nFinal error:\n " if @priors;
        @priors.join ~ "Cannot resolve caller $.dispatcher.name()$cap; " ~ (
            @un-rw-cand
            ?? "the following candidates\nmatch the type but require "
                ~ 'mutable arguments:' ~  join("\n    ", '', @un-rw-cand) ~ (
                        "\n\nThe following do not match for other reasons:"
                        ~  join("\n    ", '', sort keys @cand ∖ @un-rw-cand)
                    unless @cand == @un-rw-cand
                )
            !! ( @cand
                 ??  join "\n    ", 'none of these signatures match:', @cand
                 !! "Routine does not have any candidates. Is only the proto defined?"
               )
        );
},


# Class:  X::MultipleTypeSmiley
# Status: TO DO
# Original Code:
#        "Multiple type smileys cannot be used, did you forget a ':' somewhere?";

'X::MultipleTypeSmiley' => method {
        "Multiple type smileys cannot be used, did you forget a ':' somewhere?";
},


# Class:  X::MustBeParametric
# Status: TO DO
# Note:   Make sure to use $.type instead of $!type
# Original Code:
#        "$!type.^name() *must* be parameterized";

'X::MustBeParametric' => method {
        "$.type.^name() *must* be parameterized";
},


# Class:  X::NQP::NotFound
# Status: TO DO
# Original Code:
#        "Could not find nqp::$.op, did you forget 'use nqp;' ?"

'X::NQP::NotFound' => method {
        "Could not find nqp::$.op, did you forget 'use nqp;' ?"
},


# Class:  X::NYI::Available
# Status: TO DO
# Original Code:
#        "Please install { self.available-str } for $.feature support. "

'X::NYI::Available' => method {
        "Please install { self.available-str } for $.feature support. "
},


# Class:  X::NYI::BigInt
# Status: TO DO
# Note:   Make sure to use $.big, $.op, $.side instead of $!big, $!op, $!side
# Original Code:
#        "Big integer $!big not yet supported on {$!side}hand side of '$!op' operator"

'X::NYI::BigInt' => method {
        "Big integer $.big not yet supported on {$.side}hand side of '$.op' operator"
},


# Class:  X::NoCoreRevision
# Status: TO DO
# Note:   Make sure to use $.lang-rev instead of $!lang-rev
# Original Code:
#        "No CORE for language version 6.$!lang-rev"

'X::NoCoreRevision' => method {
        "No CORE for language version 6.$.lang-rev"
},


# Class:  X::NoDispatcher
# Status: TO DO
# Original Code:
#        "$.redispatcher is not in the dynamic scope of a dispatcher";

'X::NoDispatcher' => method {
        "$.redispatcher is not in the dynamic scope of a dispatcher";
},


# Class:  X::NoSuchSymbol
# Status: TO DO
# Original Code:
#        "No such symbol '$.symbol'"

'X::NoSuchSymbol' => method {
        "No such symbol '$.symbol'"
},


# Class:  X::NotEnoughDimensions
# Status: TO DO
# Original Code:
#        "Cannot $.operation a $.needed-dimensions dimension array with only $.got-dimensions dimensions"

'X::NotEnoughDimensions' => method {
        "Cannot $.operation a $.needed-dimensions dimension array with only $.got-dimensions dimensions"
},


# Class:  X::NotParametric
# Status: TO DO
# Note:   Make sure to use $.type instead of $!type
# Original Code:
#        "$!type.^name() cannot be parameterized";

'X::NotParametric' => method {
        "$.type.^name() cannot be parameterized";
},


# Class:  X::Numeric::CannotConvert
# Status: TO DO
# Note:   Make sure to use $.target, $.reason, $.source instead of $!target, $!reason, $!source
# Original Code:
#        "Cannot convert {$!source // $!source.raku} to {$!target // $!target.raku}: $!reason";

'X::Numeric::CannotConvert' => method {
        "Cannot convert {$.source // $.source.raku} to {$.target // $.target.raku}: $.reason";
},


# Class:  X::Numeric::Confused
# Status: TO DO
# Original Code:
#        "This call only converts base-$.base strings to numbers; value "
#        ~ "{$.num.raku} is of type {$.num.WHAT.^name}, so cannot be converted!"
#        ~ (
#            "\n(If you really wanted to convert {$.num.raku} to a base-$.base"
#                ~ " string, use {$.num.raku}.base($.base) instead.)"
#            if $.num.^can('base')
#        );

'X::Numeric::Confused' => method {
        "This call only converts base-$.base strings to numbers; value "
        ~ "{$.num.raku} is of type {$.num.WHAT.^name}, so cannot be converted!"
        ~ (
            "\n(If you really wanted to convert {$.num.raku} to a base-$.base"
                ~ " string, use {$.num.raku}.base($.base) instead.)"
            if $.num.^can('base')
        );
},


# Class:  X::Numeric::DivideByZero
# Status: TO DO
# Original Code:
#        "Attempt to divide{$.numerator ?? " $.numerator" !! ''} by zero"
#          ~ ( $.using ?? " using $.using" !! '' )
#          ~ ( " $_" with $.details );

'X::Numeric::DivideByZero' => method {
        "Attempt to divide{$.numerator ?? " $.numerator" !! ''} by zero"
          ~ ( $.using ?? " using $.using" !! '' )
          ~ ( " $_" with $.details );
},


# Class:  X::Numeric::Overflow
# Status: TO DO
# Original Code:
#        "Numeric overflow"

'X::Numeric::Overflow' => method {
        "Numeric overflow"
},


# Class:  X::Numeric::Underflow
# Status: TO DO
# Original Code:
#        "Numeric underflow"

'X::Numeric::Underflow' => method {
        "Numeric underflow"
},


# Class:  X::Obsolete
# Status: TO DO
# Original Code:
#        "Unsupported use of $.old. $.when.tc() please use: $.replacement.".naive-word-wrapper

'X::Obsolete' => method {
        "Unsupported use of $.old. $.when.tc() please use: $.replacement.".naive-word-wrapper
},


# Class:  X::OutOfRange
# Status: TO DO
# Original Code:
#        my $result = $.comment.defined
#           ?? "$.what out of range. Is: $.got.gist(), should be in $.range.gist(); $.comment"
#           !! "$.what out of range. Is: $.got.gist(), should be in $.range.gist()";
#        $result;

'X::OutOfRange' => method {
        my $result = $.comment.defined
           ?? "$.what out of range. Is: $.got.gist(), should be in $.range.gist(); $.comment"
           !! "$.what out of range. Is: $.got.gist(), should be in $.range.gist()";
        $result;
},


# Class:  X::Package::Stubbed
# Status: TO DO
# Original Code:
#        "The following packages were stubbed but not defined:\n    "
#        ~ @.packages.join("\n    ");

'X::Package::Stubbed' => method {
        "The following packages were stubbed but not defined:\n    "
        ~ @.packages.join("\n    ");
},


# Class:  X::Package::UseLib
# Status: TO DO
# Original Code:
#        "Cannot 'use lib' inside a $.what"

'X::Package::UseLib' => method {
        "Cannot 'use lib' inside a $.what"
},


# Class:  X::Pairup::OddNumber
# Status: TO DO
# Original Code:
#        "Odd number of elements found for .pairup()"

'X::Pairup::OddNumber' => method {
        "Odd number of elements found for .pairup()"
},


# Class:  X::Parameter::AfterDefault
# Status: TO DO
# Original Code:
#        "The $.type '$.modifier' came after the default value. Did you mean: ...$.modifier $.default?".naive-word-wrapper

'X::Parameter::AfterDefault' => method {
        "The $.type '$.modifier' came after the default value. Did you mean: ...$.modifier $.default?".naive-word-wrapper
},


# Class:  X::Parameter::BadType
# Status: TO DO
# Note:   Make sure to use $.type instead of $!type
# Original Code:
#        my $what = ~$!type.HOW.WHAT.^name.match(/ .* '::' <(.*)> HOW/) // 'Namespace';
#        "$what '$!type.^name()' is insufficiently type-like to qualify a parameter.  Did you mean 'class'?".naive-word-wrapper

'X::Parameter::BadType' => method {
        my $what = ~$.type.HOW.WHAT.^name.match(/ .* '::' <(.*)> HOW/) // 'Namespace';
        "$what '$.type.^name()' is insufficiently type-like to qualify a parameter.  Did you mean 'class'?".naive-word-wrapper
},


# Class:  X::Parameter::Default
# Status: TO DO
# Original Code:
#        $.parameter
#            ?? "Cannot put default on $.how parameter $.parameter"
#            !! "Cannot put default on anonymous $.how parameter";

'X::Parameter::Default' => method {
        $.parameter
            ?? "Cannot put default on $.how parameter $.parameter"
            !! "Cannot put default on anonymous $.how parameter";
},


# Class:  X::Parameter::Default::TypeCheck
# Status: TO DO
# Note:   Make sure to use $.got, $.expected instead of $!got, $!expected
# Original Code:
#        "Default value '{Rakudo::Internals.MAYBE-STRING: $!got}' will never bind to a parameter of type {$!expected.^name}"

'X::Parameter::Default::TypeCheck' => method {
        "Default value '{Rakudo::Internals.MAYBE-STRING: $.got}' will never bind to a parameter of type {$.expected.^name}"
},


# Class:  X::Parameter::InvalidConcreteness
# Status: TO DO
# Note:   Make sure to use $.routine, $.param, $.got, $.expected, $.param-is-invocant,
#         and $.should-be-concrete instead of their direct ($!) access variants.
# Original Code:
#        $!routine = '<anon>' if not $!routine.defined or $!routine eq '';
#        $!param   = '<anon>' if not $!param.defined   or $!param   eq '';
#        my $beginning  = $!param-is-invocant  ?? 'Invocant of method' !! "Parameter '$!param' of routine";
#        my $must-be    = $!should-be-concrete ?? 'an object instance' !! 'a type object';
#        my $not-a      = $!should-be-concrete ?? 'a type object'      !! 'an object instance';
#        my $suggestion = $!should-be-concrete ?? '.new'               !! 'multi';
#
#        "$beginning '$!routine' must be $must-be of type '$!expected', not $not-a of type '$!got'.  Did you forget a '$suggestion'?".naive-word-wrapper

'X::Parameter::InvalidConcreteness' => method {
        $.routine = '<anon>' if not $.routine.defined or $.routine eq '';
        $.param   = '<anon>' if not $.param.defined   or $.param   eq '';
        my $beginning  = $.param-is-invocant  ?? 'Invocant of method' !! "Parameter '$.param' of routine";
        my $must-be    = $.should-be-concrete ?? 'an object instance' !! 'a type object';
        my $not-a      = $.should-be-concrete ?? 'a type object'      !! 'an object instance';
        my $suggestion = $.should-be-concrete ?? '.new'               !! 'multi';

        "$beginning '$.routine' must be $must-be of type '$.expected', not $not-a of type '$.got'.  Did you forget a '$suggestion'?".naive-word-wrapper
},


# Class:  X::Parameter::InvalidType
# Status: TO DO
# Original Code:
#        my $msg := "Invalid typename '$.typename' in parameter declaration.";
#        if +@.suggestions > 0 {
#            $msg := $msg ~ " Did you mean '" ~ @.suggestions.join("', '") ~ "'?";
#        }
#        $msg.naive-word-wrapper

'X::Parameter::InvalidType' => method {
        my $msg := "Invalid typename '$.typename' in parameter declaration.";
        if +@.suggestions > 0 {
            $msg := $msg ~ " Did you mean '" ~ @.suggestions.join("', '") ~ "'?";
        }
        $msg.naive-word-wrapper
},


# Class:  X::Parameter::MultipleTypeConstraints
# Status: TO DO
# Original Code:
#        ($.parameter ?? "Parameter $.parameter" !! 'A parameter')
#        ~ " may only have one prefix type constraint";

'X::Parameter::MultipleTypeConstraints' => method {
        ($.parameter ?? "Parameter $.parameter" !! 'A parameter')
        ~ " may only have one prefix type constraint";
},


# Class:  X::Parameter::Placeholder
# Status: TO DO
# Original Code:
#        "$.type.tc() placeholder variables like '$.parameter' are not allowed in signatures.  Did you mean: '$.right' ?".naive-word-wrapper

'X::Parameter::Placeholder' => method {
        "$.type.tc() placeholder variables like '$.parameter' are not allowed in signatures.  Did you mean: '$.right' ?".naive-word-wrapper
},


# Class:  X::Parameter::RW
# Status: TO DO
# Original Code:
#        "Parameter '$.symbol' expects a writable container (variable) as an argument, but got '{Rakudo::Internals.MAYBE-GIST: $.got}' ($.got.^name()) as a value without a container.".naive-word-wrapper

'X::Parameter::RW' => method {
        "Parameter '$.symbol' expects a writable container (variable) as an argument, but got '{Rakudo::Internals.MAYBE-GIST: $.got}' ($.got.^name()) as a value without a container.".naive-word-wrapper
},


# Class:  X::Parameter::Twigil
# Status: TO DO
# Original Code:
#        "Parameters with a '$.twigil' twigil, like '$.parameter', are not allowed in signatures.".naive-word-wrapper

'X::Parameter::Twigil' => method {
        "Parameters with a '$.twigil' twigil, like '$.parameter', are not allowed in signatures.".naive-word-wrapper
},


# Class:  X::Parameter::TypedSlurpy
# Status: TO DO
# Original Code:
#        "Slurpy $.kind parameters with type constraints are not supported"

'X::Parameter::TypedSlurpy' => method {
        "Slurpy $.kind parameters with type constraints are not supported"
},


# Class:  X::Parameter::WrongOrder
# Status: TO DO
# Original Code:
#        "Cannot put $.misplaced parameter $.parameter after $.after parameters";

'X::Parameter::WrongOrder' => method {
        "Cannot put $.misplaced parameter $.parameter after $.after parameters";
},


# Class:  X::ParametricConstant
# Status: TO DO
# Original Code:
#        'Parameterization of constants is forbidden'

'X::ParametricConstant' => method {
        'Parameterization of constants is forbidden'
},


# Class:  X::Phaser::Multiple
# Status: TO DO
# Original Code:
#        "Only one $.block block is allowed"

'X::Phaser::Multiple' => method {
        "Only one $.block block is allowed"
},


# Class:  X::Phaser::PrePost
# Status: TO DO
# Original Code:
#        my $what = $.phaser eq 'PRE' ?? 'Precondition' !! 'Postcondition';
#        $.condition.defined
#            ?? "$what '$.condition.trim()' failed"
#            !! "$what failed";

'X::Phaser::PrePost' => method {
        my $what = $.phaser eq 'PRE' ?? 'Precondition' !! 'Postcondition';
        $.condition.defined
            ?? "$what '$.condition.trim()' failed"
            !! "$what failed";
},


# Class:  X::PhaserExceptions
# Status: TO DO
# Original Code:
#        "Multiple exceptions were thrown by LEAVE/POST phasers"

'X::PhaserExceptions' => method {
        "Multiple exceptions were thrown by LEAVE/POST phasers"
},


# Class:  X::Placeholder::Attribute
# Status: TO DO
# Original Code:
#        "Cannot use placeholder parameter $.placeholder in an attribute initializer"

'X::Placeholder::Attribute' => method {
        "Cannot use placeholder parameter $.placeholder in an attribute initializer"
},


# Class:  X::Placeholder::Block
# Status: TO DO
# Original Code:
#        "Placeholder variable '$.placeholder' may not be used here because the surrounding block does not take a signature.".naive-word-wrapper;

'X::Placeholder::Block' => method {
        "Placeholder variable '$.placeholder' may not be used here because the surrounding block does not take a signature.".naive-word-wrapper;
},


# Class:  X::Placeholder::Mainline
# Status: TO DO
# Original Code:
#        "Cannot use placeholder parameter $.placeholder outside of a sub or block"

'X::Placeholder::Mainline' => method {
        "Cannot use placeholder parameter $.placeholder outside of a sub or block"
},


# Class:  X::Placeholder::NonPlaceholder
# Status: TO DO
# Note:   Make sure to use $.decl, $.placeholder, $.variable-name instead
#         of $!decl, $!placeholder $!variable-name
# Original Code:
#        my $decl = $!decl ?? $!decl !! 'block';
#        "'$!variable_name' has already been used as a non-placeholder in the surrounding $decl, so you will confuse the reader if you suddenly declare $!placeholder here.".naive-word-wrapper

'X::Placeholder::NonPlaceholder' => method {
        my $decl = $.decl ?? $.decl !! 'block';
        "'$.variable_name' has already been used as a non-placeholder in the surrounding $decl, so you will confuse the reader if you suddenly declare $.placeholder here.".naive-word-wrapper
},


# Class:  X::PoisonedAlias
# Status: TO DO
# Note:   Make sure to use $.alias instead of $!alias.  $.package-type will
#         only return 'package' at the moment.  This message does not appear
#         anywhere in Rakudo at the present time.
# Original Code:
#        ("Cannot directly use poisoned alias '$.alias' because it was declared by several {$.package-type}s." ~
#         ($.package-name
#           ?? " Please access it via explicit package name like: '{$.package-name}::{$!alias}'"
#           !! '')
#        ).naive-word-wrapper

'X::PoisonedAlias' => method {
        ("Cannot directly use poisoned alias '$.alias' because it was declared by several {$.package-type}s." ~
         ($.package-name
           ?? " Please access it via explicit package name like: '{$.package-name}::{$.alias}'"
           !! '')
        ).naive-word-wrapper
},


# Class:  X::Pragma::CannotPrecomp
# Status: TO DO
# Original Code:
#        "$.what may not be pre-compiled"

'X::Pragma::CannotPrecomp' => method {
        "$.what may not be pre-compiled"
},


# Class:  X::Pragma::CannotWhat
# Status: TO DO
# Original Code:
#        "'$.what $.name' is not an option."

'X::Pragma::CannotWhat' => method {
        "'$.what $.name' is not an option."
},


# Class:  X::Pragma::MustOneOf
# Status: TO DO
# Original Code:
#        "'$.name' pragma expects one parameter out of $.alternatives."

'X::Pragma::MustOneOf' => method {
        "'$.name' pragma expects one parameter out of $.alternatives."
},


# Class:  X::Pragma::NoArgs
# Status: TO DO
# Original Code:
#        "The '$.name' pragma does not take any arguments."

'X::Pragma::NoArgs' => method {
        "The '$.name' pragma does not take any arguments."
},


# Class:  X::Pragma::OnlyOne
# Status: TO DO
# Original Code:
#        "The '$.name' pragma only takes one argument."

'X::Pragma::OnlyOne' => method {
        "The '$.name' pragma only takes one argument."
},


# Class:  X::Pragma::UnknownArg
# Status: TO DO
# Original Code:
#        "Unknown argument '{$.arg.raku}' specified with the '$.name' pragma."

'X::Pragma::UnknownArg' => method {
        "Unknown argument '{$.arg.raku}' specified with the '$.name' pragma."
},


# Class:  X::Proc::Unsuccessful
# Status: TO DO
# Original Code:
#        "The spawned command '{$.proc.command[0]}' exited unsuccessfully (exit code: $.proc.exitcode(), signal: $.proc.signal())"

'X::Proc::Unsuccessful' => method {
        "The spawned command '{$.proc.command[0]}' exited unsuccessfully (exit code: $.proc.exitcode(), signal: $.proc.signal())"
},


# Class:  X::PseudoPackage::InDeclaration
# Status: TO DO
# Original Code:
#        "Cannot use pseudo package $.pseudo-package in $.action";

'X::PseudoPackage::InDeclaration' => method {
        "Cannot use pseudo package $.pseudo-package in $.action";
},


# Class:  X::Range::InvalidArg
# Status: TO DO
# Original Code:
#        "{$.got.^name} objects are not valid endpoints for Ranges";

'X::Range::InvalidArg' => method {
        "{$.got.^name} objects are not valid endpoints for Ranges";
},


# Class:  X::Redeclaration
# Status: TO DO
# Original Code:
#        ("Redeclaration of $.what '$.symbol'"
#          ~ (" $.postfix" if $.postfix)
#          ~ ($.what eq 'routine'
#              ?? ". Did you mean to declare a multi-sub?"
#              !! ".")
#        ).naive-word-wrapper

'X::Redeclaration' => method {
        ("Redeclaration of $.what '$.symbol'"
          ~ (" $.postfix" if $.postfix)
          ~ ($.what eq 'routine'
              ?? ". Did you mean to declare a multi-sub?"
              !! ".")
        ).naive-word-wrapper
},


# Class:  X::Redeclaration::Outer
# Status: TO DO
# Original Code:
#        "Lexical symbol '$.symbol' is already bound to an outer symbol.  The implicit outer binding must be rewritten as 'OUTER::<$.symbol>' before you can unambiguously declare a new '$.symbol' in this scope.".naive-word-wrapper

'X::Redeclaration::Outer' => method {
        "Lexical symbol '$.symbol' is already bound to an outer symbol.  The implicit outer binding must be rewritten as 'OUTER::<$.symbol>' before you can unambiguously declare a new '$.symbol' in this scope.".naive-word-wrapper
},


# Class:  X::Role::Parametric::NoSuchCandidate
# Status: TO DO
# Original Code:
#        "No appropriate parametric role variant available for '"
#        ~ $.role.^name
#        ~ "'";

'X::Role::Parametric::NoSuchCandidate' => method {
        "No appropriate parametric role variant available for '"
        ~ $.role.^name
        ~ "'";
},


# Class:  X::Routine::Unwrap
# Status: TO DO
# Original Code:
#        "Cannot unwrap routine: invalid wrap handle"

'X::Routine::Unwrap' => method {
        "Cannot unwrap routine: invalid wrap handle"
},


# Class:  X::SecurityPolicy::Eval
# Status: TO DO
# Note:   The SlurpySentry referenced is an internal role, however it is unused.
#         Simply use $.payload.Str instead, which is what core should have.
# Original Code:
#        (($.payload ~~ SlurpySentry
#          ?? $.payload.list.join # Remove spaces die(*@msg)/fail(*@msg) forms
#          !! $.payload.Str
#         ) ~ " (use the MONKEY-SEE-NO-EVAL pragma to override this error but only if you're VERY sure your data contains no injection attacks)."
#        ).naive-word-wrapper

'X::SecurityPolicy::Eval' => method {
        ($.payload.Str ~ " (use the MONKEY-SEE-NO-EVAL pragma to override this error but only if you're VERY sure your data contains no injection attacks)."
        ).&naive-word-wrapper
},


# Class:  X::Seq::Consumed
# Status: TO DO
# Original Code:
#        "The iterator of this Seq is already in use/consumed by another Seq\n" ~
#        "(you might solve this by adding .cache on usages of the Seq, or\n" ~
#        "by assigning the Seq into an array)"

'X::Seq::Consumed' => method {
        "The iterator of this Seq is already in use/consumed by another Seq\n" ~
        "(you might solve this by adding .cache on usages of the Seq, or\n" ~
        "by assigning the Seq into an array)"
},


# Class:  X::Seq::NotIndexable
# Status: TO DO
# Original Code:
#        "Cannot index a Seq; coerce it to a list or assign it to an array first"

'X::Seq::NotIndexable' => method {
        "Cannot index a Seq; coerce it to a list or assign it to an array first"
},


# Class:  X::Sequence::Deduction
# Status: TO DO
# Note:   Make sure to use $.from instead of $!from
# Original Code:
#        $!from ?? "Unable to deduce arithmetic or geometric sequence from: $!from\nDid you really mean '..'?"
#               !! 'Unable to deduce sequence for some unfathomable reason'

'X::Sequence::Deduction' => method {
        $.from ?? "Unable to deduce arithmetic or geometric sequence from: $.from\nDid you really mean '..'?"
               !! 'Unable to deduce sequence for some unfathomable reason'
},


# Class:  X::Sequence::Endpoint
# Status: TO DO
# Note:   Make sure to use $.from and $.endpoint instead of $!from and $!endpoint
# Original Code:
#        "Incompatible endpoint for sequence: "
#          ~ $!from.raku
#          ~ " ... "
#          ~ $!endpoint.raku

'X::Sequence::Endpoint' => method {
        "Incompatible endpoint for sequence: "
          ~ $.from.raku
          ~ " ... "
          ~ $.endpoint.raku
},


# Class:  X::Set::Coerce
# Status: TO DO
# Original Code:
#        "Cannot coerce object of type {$.thing.^name} to Set. To create a one-element set, pass it to the 'set' function";

'X::Set::Coerce' => method {
        "Cannot coerce object of type {$.thing.^name} to Set. To create a one-element set, pass it to the 'set' function";
},


# Class:  X::Signature::NameClash
# Status: TO DO
# Original Code:
#        "Name $.name used for more than one named parameter";

'X::Signature::NameClash' => method {
        "Name $.name used for more than one named parameter";
},


# Class:  X::Signature::Placeholder
# Status: TO DO
# Original Code:
#        "Placeholder variable '$.placeholder' cannot override existing signature";

'X::Signature::Placeholder' => method {
        "Placeholder variable '$.placeholder' cannot override existing signature";
},


# Class:  X::Str::InvalidCharName
# Status: TO DO
# Note:   Make sure to use $.name instead of $!name
# Original Code:
#        $!name.chars ?? "Unrecognized character name [{$!name}]"
#                     !! "Cannot use empty name as character name"

'X::Str::InvalidCharName' => method {
        $.name.chars ?? "Unrecognized character name [{$.name}]"
                     !! "Cannot use empty name as character name"
},


# Class:  X::Str::Match::x
# Status: TO DO
# Original Code:
#        "in Str.match, got invalid value of type {$.got.^name} for :x, must be Int or Range"

'X::Str::Match::x' => method {
        "in Str.match, got invalid value of type {$.got.^name} for :x, must be Int or Range"
},


# Class:  X::Str::Numeric
# Status: TO DO
# Original Code:
#        "Cannot convert string to number: $.reason $.source-indicator";

'X::Str::Numeric' => method {
        "Cannot convert string to number: $.reason $.source-indicator";
},


# Class:  X::Str::Sprintf::Directives::BadType
# Status: TO DO
# Original Code:
#        $.expected
#          ??  "Directive $.directive expected a $.expected value, not a $.type ({Rakudo::Internals.SHORT-STRING: $.value[0]})"
#          !! "Directive $.directive not applicable for value of type $.type ({Rakudo::Internals.SHORT-STRING: $.value[0]})"

'X::Str::Sprintf::Directives::BadType' => method {
        $.expected
          ??  "Directive $.directive expected a $.expected value, not a $.type ({Rakudo::Internals.SHORT-STRING: $.value[0]})"
          !! "Directive $.directive not applicable for value of type $.type ({Rakudo::Internals.SHORT-STRING: $.value[0]})"
},


# Class:  X::Str::Sprintf::Directives::Count
# Status: TO DO
# Original Code:
#        my $msg = "Your printf-style directives specify ";
#
#        if $.args-used == 1 {
#            $msg ~= "1 argument, but ";
#        }
#        else {
#            $msg ~= "$.args-used arguments, but ";
#        }
#
#        if $.args-have < 1 {
#            $msg ~= "no argument was";
#        }
#        else {
#            if $.args-have == 1 {
#                $msg ~= "1 argument was";
#            }
#            else {
#                # too many args
#                $msg ~= "$.args-have arguments were";
#            }
#        }
#        $msg ~= " supplied.";
#
#        if $.args-used > $.args-have {
#            $msg ~= "\nAre you using an interpolated '\$'?";
#        }
#
#        $msg;

'X::Str::Sprintf::Directives::Count' => method {
        my $msg = "Your printf-style directives specify ";

        if $.args-used == 1 {
            $msg ~= "1 argument, but ";
        }
        else {
            $msg ~= "$.args-used arguments, but ";
        }

        if $.args-have < 1 {
            $msg ~= "no argument was";
        }
        else {
            if $.args-have == 1 {
                $msg ~= "1 argument was";
            }
            else {
                # too many args
                $msg ~= "$.args-have arguments were";
            }
        }
        $msg ~= " supplied.";

        if $.args-used > $.args-have {
            $msg ~= "\nAre you using an interpolated '\$'?";
        }

        $msg;
},


# Class:  X::Str::Sprintf::Directives::Unsupported
# Status: TO DO
# Original Code:
#        "Directive $.directive is not valid in sprintf format sequence $.sequence"

'X::Str::Sprintf::Directives::Unsupported' => method {
        "Directive $.directive is not valid in sprintf format sequence $.sequence"
},


# Class:  X::Str::Subst::Adverb
# Status: TO DO
# Original Code:
#        "Cannot use :$.name adverb in Str.subst, got $.got"

'X::Str::Subst::Adverb' => method {
        "Cannot use :$.name adverb in Str.subst, got $.got"
},


# Class:  X::Str::Trans::IllegalKey
# Status: TO DO
# Original Code:
#        "in Str.trans, got illegal substitution key of type {$.key.^name} (should be a Regex or Str)"

'X::Str::Trans::IllegalKey' => method {
        "in Str.trans, got illegal substitution key of type {$.key.^name} (should be a Regex or Str)"
},


# Class:  X::Str::Trans::InvalidArg
# Status: TO DO
# Original Code:
#        "Only Pair objects are allowed as arguments to Str.trans, got {$.got.^name}";

'X::Str::Trans::InvalidArg' => method {
        "Only Pair objects are allowed as arguments to Str.trans, got {$.got.^name}";
},


# Class:  X::Subscript::Negative
# Status: TO DO
# Original Code:
#        "Calculated index ({$.index}) is negative, but {$.type.^name} allows only 0-based indexing";

'X::Subscript::Negative' => method {
        "Calculated index ({$.index}) is negative, but {$.type.^name} allows only 0-based indexing";
},


# Class:  X::Syntax::AddCategorical::TooFewParts
# Status: TO DO
# Original Code:
#        "Not enough symbols provided for categorical of type $.category; needs $.needs"

'X::Syntax::AddCategorical::TooFewParts' => method {
        "Not enough symbols provided for categorical of type $.category; needs $.needs"
},


# Class:  X::Syntax::AddCategorical::TooManyParts
# Status: TO DO
# Original Code:
#        "Too many symbols provided for categorical of type $.category; needs only $.needs"

'X::Syntax::AddCategorical::TooManyParts' => method {
        "Too many symbols provided for categorical of type $.category; needs only $.needs"
},


# Class:  X::Syntax::Adverb
# Status: TO DO
# Original Code:
#        "You can't adverb " ~ $.what

'X::Syntax::Adverb' => method {
        "You can't adverb " ~ $.what
},


# Class:  X::Syntax::Argument::MOPMacro
# Status: TO DO
# Original Code:
#        "Can only supply an initialization value for a role if it has a single public attribute, but this is not the case for '{$.role.^name}'"

'X::Syntax::Argument::MOPMacro' => method {
        "Can only supply an initialization value for a role if it has a single public attribute, but this is not the case for '{$.role.^name}'"
},


# Class:  X::Syntax::Augment::WithoutMonkeyTyping
# Status: TO DO
# Original Code:
#        "Cannot put adverbs on a typename when augmenting"

'X::Syntax::Augment::WithoutMonkeyTyping' => method {
        "Cannot put adverbs on a typename when augmenting"
},


# Class:  X::Syntax::BlockGobbled
# Status: TO DO
# Original Code:
#        my $looks_like_type = $.what ~~ /'::' | <[A..Z]><[a..z]>+/;
#        $.what ~~ /^'is '/
#            ?? "Trait '$.what' needs whitespace before block"
#            !! "{ $.what ?? "Function '$.what'" !! 'Expression' } needs parens to avoid gobbling block" ~
#                    ($looks_like_type ?? " (or perhaps it's a class that's not declared or available in this scope?)" !! "");

'X::Syntax::BlockGobbled' => method {
        my $looks_like_type = $.what ~~ /'::' | <[A..Z]><[a..z]>+/;
        $.what ~~ /^'is '/
            ?? "Trait '$.what' needs whitespace before block"
            !! "{ $.what ?? "Function '$.what'" !! 'Expression' } needs parens to avoid gobbling block" ~
                    ($looks_like_type ?? " (or perhaps it's a class that's not declared or available in this scope?)" !! "");
},


# Class:  X::Syntax::CannotMeta
# Status: TO DO
# Original Code:
#        "Cannot $.meta $.operator because $.dba operators are $.reason";

'X::Syntax::CannotMeta' => method {
        "Cannot $.meta $.operator because $.dba operators are $.reason";
},


# Class:  X::Syntax::Coercer::TooComplex
# Status: TO DO
# Original Code:
#        'Coercer is too complex. Only type objects, with optional type'
#        ~ " smileys, or empty parentheses, implying 'Any', are supported."

'X::Syntax::Coercer::TooComplex' => method {
        'Coercer is too complex. Only type objects, with optional type'
        ~ " smileys, or empty parentheses, implying 'Any', are supported."
},


# Class:  X::Syntax::Comment::Embedded
# Status: TO DO
# Original Code:
#        "Opening bracket required for #` comment"

'X::Syntax::Comment::Embedded' => method {
        "Opening bracket required for #` comment"
},


# Class:  X::Syntax::ConditionalOperator::PrecedenceTooLoose
# Status: TO DO
# Original Code:
#        "Precedence of $.operator is too loose to use inside ?? !!; please parenthesize"

'X::Syntax::ConditionalOperator::PrecedenceTooLoose' => method {
        "Precedence of $.operator is too loose to use inside ?? !!; please parenthesize"
},


# Class:  X::Syntax::ConditionalOperator::SecondPartGobbled
# Status: TO DO
# Original Code:
#        "Your !! was gobbled by the expression in the middle; please parenthesize"

'X::Syntax::ConditionalOperator::SecondPartGobbled' => method {
        "Your !! was gobbled by the expression in the middle; please parenthesize"
},


# Class:  X::Syntax::ConditionalOperator::SecondPartInvalid
# Status: TO DO
# Original Code:
#        "Please use !! rather than $.second-part"

'X::Syntax::ConditionalOperator::SecondPartInvalid' => method {
        "Please use !! rather than $.second-part"
},


# Class:  X::Syntax::Confused
# Status: TO DO
# Original Code:
#        $.reason eq 'unknown' ?? 'Confused' !! $.reason

'X::Syntax::Confused' => method {
        $.reason eq 'unknown' ?? 'Confused' !! $.reason
},


# Class:  X::Syntax::DuplicatedPrefix
# Status: TO DO
# Original Code:
#        my $prefix = substr($.prefixes,0,1);
#        "Expected a term, but found either infix $.prefixes or redundant prefix $prefix\n"
#        ~ "  (to suppress this message, please use a space like $prefix $prefix)";

'X::Syntax::DuplicatedPrefix' => method {
        my $prefix = substr($.prefixes,0,1);
        "Expected a term, but found either infix $.prefixes or redundant prefix $prefix\n"
        ~ "  (to suppress this message, please use a space like $prefix $prefix)";
},


# Class:  X::Syntax::Extension::Category
# Status: TO DO
# Original Code:
#        "Cannot add tokens of category '$.category'";

'X::Syntax::Extension::Category' => method {
        "Cannot add tokens of category '$.category'";
},


# Class:  X::Syntax::Extension::Null
# Status: TO DO
# Original Code:
#        "Null operator is not allowed";

'X::Syntax::Extension::Null' => method {
        "Null operator is not allowed";
},


# Class:  X::Syntax::Extension::SpecialForm
# Status: TO DO
# Note:   Make sure to use $.hint instead of $!hint.
#         Currently $.hint is only provided when $.code is "~~".  The message is
#         '(consider implementing an ACCEPTS method)'.  You may consider handling
#         this specially in the method.  The $.category is generally an operator
#         type like infix/circumfix, etc.
# Original Code:
#        "Cannot override $.category operator '$.opname', as it is a special form " ~
#            "handled directly by the compiler" ~ ($!hint ?? "\n$!hint" !! "")

'X::Syntax::Extension::SpecialForm' => method {
        "Cannot override $.category operator '$.opname', as it is a special form " ~
            "handled directly by the compiler" ~ ($.hint ?? "\n$.hint" !! "")
},


# Class:  X::Syntax::Extension::TooComplex
# Status: TO DO
# Original Code:
#        "Colon pair value '$.name' too complex to use in name";

'X::Syntax::Extension::TooComplex' => method {
        "Colon pair value '$.name' too complex to use in name";
},


# Class:  X::Syntax::InfixInTermPosition
# Status: TO DO
# Note:   Make sure to use $.infix instead of $!.infix
# Original Code:
#        my $infix := $!infix.trim;
#        "Preceding context expects a term, but found infix $infix instead."
#        ~ (
#            $.post && $.post.starts-with('end ')
#                ?? "\nDid you forget '=begin $.post.substr(4)' Pod marker?"
#                !! "\nDid you make a mistake in Pod syntax?"
#            if $infix eq '='
#        )

'X::Syntax::InfixInTermPosition' => method {
        my $infix := $.infix.trim;
        "Preceding context expects a term, but found infix $infix instead."
        ~ (
            $.post && $.post.starts-with('end ')
                ?? "\nDid you forget '=begin $.post.substr(4)' Pod marker?"
                !! "\nDid you make a mistake in Pod syntax?"
            if $infix eq '='
        )
},


# Class:  X::Syntax::KeywordAsFunction
# Status: TO DO
# Original Code:
#        ("The word '$.word' is interpreted as a '{$.word}()' function call.  Please use whitespace "
#          ~ ($.needparens ?? 'around the' !! 'instead of')
#          ~ " parentheses."
#        ).naive-word-wrapper

'X::Syntax::KeywordAsFunction' => method {
        ("The word '$.word' is interpreted as a '{$.word}()' function call.  Please use whitespace "
          ~ ($.needparens ?? 'around the' !! 'instead of')
          ~ " parentheses."
        ).naive-word-wrapper
},


# Class:  X::Syntax::Malformed
# Status: TO DO
# Original Code:
#        "Malformed $.what"

'X::Syntax::Malformed' => method {
        "Malformed $.what"
},


# Class:  X::Syntax::Malformed::Elsif
# Status: TO DO
# Original Code:
#        qq{In Raku, please use "elsif' instead of "$.what"}

'X::Syntax::Malformed::Elsif' => method {
        qq{In Raku, please use "elsif' instead of "$.what"}
},


# Class:  X::Syntax::Missing
# Status: TO DO
# Original Code:
#        "Missing $.what"

'X::Syntax::Missing' => method {
        "Missing $.what"
},


# Class:  X::Syntax::Name::Null
# Status: TO DO
# Original Code:
#        'Name component may not be null';

'X::Syntax::Name::Null' => method {
        'Name component may not be null';
},


# Class:  X::Syntax::NegatedPair
# Status: TO DO
# Original Code:
#        "Argument not allowed on negated pair with key '$.key'"

'X::Syntax::NegatedPair' => method {
        "Argument not allowed on negated pair with key '$.key'"
},


# Class:  X::Syntax::NoSelf
# Status: TO DO
# Original Code:
#        "Variable $.variable used where no 'self' is available"

'X::Syntax::NoSelf' => method {
        "Variable $.variable used where no 'self' is available"
},


# Class:  X::Syntax::NonAssociative
# Status: TO DO
# Original Code:
#        "Operators '$.left' and '$.right' are non-associative and require parentheses";

'X::Syntax::NonAssociative' => method {
        "Operators '$.left' and '$.right' are non-associative and require parentheses";
},


# Class:  X::Syntax::NonListAssociative
# Status: TO DO
# Original Code:
#        "Only identical operators may be list associative; since '$.left' and '$.right' differ, they are non-associative and you need to clarify with parentheses";

'X::Syntax::NonListAssociative' => method {
        "Only identical operators may be list associative; since '$.left' and '$.right' differ, they are non-associative and you need to clarify with parentheses";
},


# Class:  X::Syntax::Number::IllegalDecimal
# Status: TO DO
# Original Code:
#        "Decimal point must be followed by digit"

'X::Syntax::Number::IllegalDecimal' => method {
        "Decimal point must be followed by digit"
},


# Class:  X::Syntax::Number::LiteralType
# Status: TO DO
# Note:   Make sure to use $.value and $var-type instead of $!value and $!var-type
# Original Code:
#        my $vartype := $!vartype.WHAT.^name;
#        my $conversionmethod := $vartype;
#        $vartype := $vartype.lc if $.native;
#        my $vt := $!value.^name;
#        my $value := $vt eq "IntStr" || $vt eq "NumStr" || $vt eq "RatStr" || $vt eq "ComplexStr"
#            ?? $!value.Str
#            !! $!value.raku;
#        my $val = "Cannot assign a literal of type {$.valuetype} ($value) to { $.native ?? "a native" !! "a" } variable of type $vartype. You can declare the variable to be of type $.suggestiontype, or try to coerce the value with { $value ~ '.' ~ $conversionmethod } or $conversionmethod\($value\)";
#        try $val ~= ", or just write the value as " ~ $!value."$vartype"().raku;
#        $val;

'X::Syntax::Number::LiteralType' => method {
        my $vartype := $.vartype.WHAT.^name;
        my $conversionmethod := $vartype;
        $vartype := $vartype.lc if $.native;
        my $vt := $.value.^name;
        my $value := $vt eq "IntStr" || $vt eq "NumStr" || $vt eq "RatStr" || $vt eq "ComplexStr"
            ?? $.value.Str
            !! $.value.raku;
        my $val = "Cannot assign a literal of type {$.valuetype} ($value) to { $.native ?? "a native" !! "a" } variable of type $vartype. You can declare the variable to be of type $.suggestiontype, or try to coerce the value with { $value ~ '.' ~ $conversionmethod } or $conversionmethod\($value\)";
        try $val ~= ", or just write the value as " ~ $.value."$vartype"().raku;
        $val;
},


# Class:  X::Syntax::Number::RadixOutOfRange
# Status: TO DO
# Original Code:
#        "Radix $.radix out of range (allowed: 2..36)"

'X::Syntax::Number::RadixOutOfRange' => method {
        "Radix $.radix out of range (allowed: 2..36)"
},


# Class:  X::Syntax::P5
# Status: TO DO
# Original Code:
#        'This appears to be Perl code'

'X::Syntax::P5' => method {
        'This appears to be Perl code'
},


# Class:  X::Syntax::ParentAsHash
# Status: TO DO
# Original Code:
#        "Parent class specification is probably missing some whitespace. Found '$.type is $.parent\{ ...', which tries to specify a parent with a '$.what'.  You probably meant '$.type is $.parent \{ ...'.".naive-word-wrapper

'X::Syntax::ParentAsHash' => method {
        "Parent class specification is probably missing some whitespace. Found '$.type is $.parent\{ ...', which tries to specify a parent with a '$.what'.  You probably meant '$.type is $.parent \{ ...'.".naive-word-wrapper
},


# Class:  X::Syntax::Perl5Var
# Status: TO DO
# Note:   Make sure to use $.name and $.identifier-name instead of $!name and $!identifier-name.
#         The $m variable is a predefined hash that we do not have access to.
#         TODO explain these
# Original Code:
#        my $name = $!name;
#        my $v    = $name ~~ m/ <[ $ @ % & ]> [ \^ <[ A..Z ]> | \W ] /;
#        my $sugg = nqp::atkey($m,~$v);
#        if $name eq '$#' {
#            # Currently only `$#` var has this identifier business handling.
#            # Should generalize the logic if we get more of stuff like this.
#            $name ~= $!identifier-name;
#            $sugg  = '@' ~ $!identifier-name ~ '.end';
#        }
#        $v
#          ?? $sugg
#            ?? "Unsupported use of $name variable; in Raku please use $sugg"
#            !! "Unsupported use of $name variable"
#          !! 'Weird unrecognized variable name: ' ~ $name;

'X::Syntax::Perl5Var' => method {
        my $name = $.name;
        my $v    = $name ~~ m/ <[ $ @ % & ]> [ \^ <[ A..Z ]> | \W ] /;
        my $sugg = ''; # nqp::atkey($m,~$v);
        if $name eq '$#' {
            # Currently only `$#` var has this identifier business handling.
            # Should generalize the logic if we get more of stuff like this.
            $name ~= $.identifier-name;
            $sugg  = '@' ~ $.identifier-name ~ '.end';
        }
        $v
          ?? $sugg
            ?? "Unsupported use of $name variable; in Raku please use $sugg"
            !! "Unsupported use of $name variable"
          !! 'Weird unrecognized variable name: ' ~ $name;
},


# Class:  X::Syntax::Pod::DeclaratorLeading
# Status: TO DO
# Original Code:
#        "Opening bracket required for #| declarator block"

'X::Syntax::Pod::DeclaratorLeading' => method {
        "Opening bracket required for #| declarator block"
},


# Class:  X::Syntax::Pod::DeclaratorTrailing
# Status: TO DO
# Original Code:
#        "Opening bracket required for #= declarator block"

'X::Syntax::Pod::DeclaratorTrailing' => method {
        "Opening bracket required for #= declarator block"
},


# Class:  X::Syntax::Regex::Adverb
# Status: TO DO
# Original Code:
#        "Adverb $.adverb not allowed on $.construct"

'X::Syntax::Regex::Adverb' => method {
        "Adverb $.adverb not allowed on $.construct"
},


# Class:  X::Syntax::Regex::Alias::LongName
# Status: TO DO
# Original Code:
#        "Can only alias to a short name (without '::')";

'X::Syntax::Regex::Alias::LongName' => method {
        "Can only alias to a short name (without '::')";
},


# Class:  X::Syntax::Regex::MalformedRange
# Status: TO DO
# Original Code:
#        'Malformed Range. If attempting to use variables for end points, '
#        ~ 'wrap the entire range in curly braces.'

'X::Syntax::Regex::MalformedRange' => method {
        'Malformed Range. If attempting to use variables for end points, '
        ~ 'wrap the entire range in curly braces.'
},


# Class:  X::Syntax::Regex::NonQuantifiable
# Status: TO DO
# Original Code:
#        'Can only quantify a construct that produces a match'

'X::Syntax::Regex::NonQuantifiable' => method {
        'Can only quantify a construct that produces a match'
},


# Class:  X::Syntax::Regex::NullRegex
# Status: TO DO
# Original Code:
#        'Null regex not allowed'

'X::Syntax::Regex::NullRegex' => method {
        'Null regex not allowed'
},


# Class:  X::Syntax::Regex::QuantifierValue
# Status: TO DO
# Note:   Make sure to use $.inf, $.non-numeric-range, $.non-numeric, $.empty-range
#         instead of their direct accessor ($!foo) equivalents.
# Original Code:
#        $!inf
#          && 'Minimum quantity to match for quantifier cannot be Inf.'
#            ~ ' Did you mean to use + or * quantifiers instead of **?'
#        || $!non-numeric-range
#          && 'Cannot use Range with non-Numeric or NaN end points as quantifier'
#        || $!non-numeric
#          && 'Cannot use non-Numeric or NaN value as quantifier'
#        || $!empty-range
#          && 'Cannot use empty Range as quantifier'
#        || 'Invalid quantifier value'

'X::Syntax::Regex::QuantifierValue' => method {
        $.inf
          && 'Minimum quantity to match for quantifier cannot be Inf.'
            ~ ' Did you mean to use + or * quantifiers instead of **?'
        || $.non-numeric-range
          && 'Cannot use Range with non-Numeric or NaN end points as quantifier'
        || $.non-numeric
          && 'Cannot use non-Numeric or NaN value as quantifier'
        || $.empty-range
          && 'Cannot use empty Range as quantifier'
        || 'Invalid quantifier value'
},


# Class:  X::Syntax::Regex::SolitaryBacktrackControl
# Status: TO DO
# Original Code:
#        "Backtrack control ':' does not seem to have a preceding atom to control"

'X::Syntax::Regex::SolitaryBacktrackControl' => method {
        "Backtrack control ':' does not seem to have a preceding atom to control"
},


# Class:  X::Syntax::Regex::SolitaryQuantifier
# Status: TO DO
# Original Code:
#        'Quantifier quantifies nothing'

'X::Syntax::Regex::SolitaryQuantifier' => method {
        'Quantifier quantifies nothing'
},


# Class:  X::Syntax::Regex::SpacesInBareRange
# Status: TO DO
# Original Code:
#        'Spaces not allowed in bare range.'

'X::Syntax::Regex::SpacesInBareRange' => method {
        'Spaces not allowed in bare range.'
},


# Class:  X::Syntax::Regex::UnrecognizedMetachar
# Status: TO DO
# Original Code:
#        "Unrecognized regex metacharacter $.metachar (must be quoted to match literally)"

'X::Syntax::Regex::UnrecognizedMetachar' => method {
        "Unrecognized regex metacharacter $.metachar (must be quoted to match literally)"
},


# Class:  X::Syntax::Regex::UnrecognizedModifier
# Status: TO DO
# Original Code:
#        "Unrecognized regex modifier :$.modifier"

'X::Syntax::Regex::UnrecognizedModifier' => method {
        "Unrecognized regex modifier :$.modifier"
},


# Class:  X::Syntax::Regex::Unspace
# Status: TO DO
# Original Code:
#        'Regex not terminated.'

'X::Syntax::Regex::Unspace' => method {
        'Regex not terminated.'
},


# Class:  X::Syntax::Reserved
# Status: TO DO
# Original Code:
#        "The $.reserved is reserved$.instead"

'X::Syntax::Reserved' => method {
        "The $.reserved is reserved$.instead"
},


# Class:  X::Syntax::Self::WithoutObject
# Status: TO DO
# Original Code:
#        "'self' used where no object is available"

'X::Syntax::Self::WithoutObject' => method {
        "'self' used where no object is available"
},


# Class:  X::Syntax::Signature::InvocantMarker
# Status: TO DO
# Original Code:
#        "Can only use : as invocant marker in a signature after the first parameter"

'X::Syntax::Signature::InvocantMarker' => method {
        "Can only use : as invocant marker in a signature after the first parameter"
},


# Class:  X::Syntax::Signature::InvocantNotAllowed
# Status: TO DO
# Original Code:
#        "Can only use the : invocant marker in the signature for a method"

'X::Syntax::Signature::InvocantNotAllowed' => method {
        "Can only use the : invocant marker in the signature for a method"
},


# Class:  X::Syntax::Term::MissingInitializer
# Status: TO DO
# Original Code:
#        'Term definition requires an initializer'

'X::Syntax::Term::MissingInitializer' => method {
        'Term definition requires an initializer'
},


# Class:  X::Syntax::Type::Adverb
# Status: TO DO
# Original Code:
#        "Cannot use adverb $.adverb on a type name (only 'ver', 'auth' and 'api' are understood)"

'X::Syntax::Type::Adverb' => method {
        "Cannot use adverb $.adverb on a type name (only 'ver', 'auth' and 'api' are understood)"
},


# Class:  X::Syntax::UnlessElse
# Status: TO DO
# Note:   Make sure to use $.keyword intsead of $!keyword
# Original Code:
#        qq|"unless" does not take "$!keyword", please rewrite using "if"|

'X::Syntax::UnlessElse' => method {
        qq|"unless" does not take "$.keyword", please rewrite using "if"|
},


# Class:  X::Syntax::Variable::BadType
# Status: TO DO
# Note:   Make sure to use $.type instead of $!type
# Original Code:
#        my $what = ~$!type.HOW.WHAT.^name.match(/ .* '::' <(.*)> HOW/) // 'Namespace';
#        "$what '$!type.^name()' is insufficiently type-like to qualify a variable.  Did you mean 'class'?".naive-word-wrapper

'X::Syntax::Variable::BadType' => method {
        my $what = ~$.type.HOW.WHAT.^name.match(/ .* '::' <(.*)> HOW/) // 'Namespace';
        "$what '$.type.^name()' is insufficiently type-like to qualify a variable.  Did you mean 'class'?".naive-word-wrapper
},


# Class:  X::Syntax::Variable::ConflictingTypes
# Status: TO DO
# Note:   Make sure to use $.inner and $.outer instead of $!inner and $!outer
# Original Code:
#        "$!inner.^name() not allowed here; variable list already declared with type $!outer.^name()"

'X::Syntax::Variable::ConflictingTypes' => method {
        "$.inner.^name() not allowed here; variable list already declared with type $.outer.^name()"
},


# Class:  X::Syntax::Variable::IndirectDeclaration
# Status: TO DO
# Original Code:
#        'Cannot declare a variable by indirect name (use a hash instead?)'

'X::Syntax::Variable::IndirectDeclaration' => method {
        'Cannot declare a variable by indirect name (use a hash instead?)'
},


# Class:  X::Syntax::Variable::Initializer
# Status: TO DO
# Note:   Make sure to use $.name instead of $!name
# Original Code:
#        "Cannot use variable $!name in declaration to initialize itself"

'X::Syntax::Variable::Initializer' => method {
        "Cannot use variable $.name in declaration to initialize itself"
},


# Class:  X::Syntax::Variable::Match
# Status: TO DO
# Original Code:
#        'Cannot declare a match variable'

'X::Syntax::Variable::Match' => method {
        'Cannot declare a match variable'
},


# Class:  X::Syntax::Variable::MissingInitializer
# Status: TO DO
# Original Code:
#        my $modality    = $.maybe ?? "may need" !! "needs";
#        my $type        = $.implicit ?? "$.type (implicit $.implicit)" !! "$.type";
#        my $requirement = $.what eq 'attribute'
#                      ?? 'to be marked as required or given an initializer'
#                      !! 'to be given an initializer';
#        "$.what.tc() definition of type $type $modality $requirement"

'X::Syntax::Variable::MissingInitializer' => method {
        my $modality    = $.maybe ?? "may need" !! "needs";
        my $type        = $.implicit ?? "$.type (implicit $.implicit)" !! "$.type";
        my $requirement = $.what eq 'attribute'
                      ?? 'to be marked as required or given an initializer'
                      !! 'to be given an initializer';
        "$.what.tc() definition of type $type $modality $requirement"
},


# Class:  X::Syntax::Variable::Numeric
# Status: TO DO
# Original Code:
#        "Cannot declare a numeric $.what"

'X::Syntax::Variable::Numeric' => method {
        "Cannot declare a numeric $.what"
},


# Class:  X::Syntax::Variable::Twigil
# Status: TO DO
# Original Code:
#        "Cannot use a '$.twigil' twigil on a '$.scope $.name' $.what$.additional.".naive-word-wrapper

'X::Syntax::Variable::Twigil' => method {
        "Cannot use a '$.twigil' twigil on a '$.scope $.name' $.what$.additional.".naive-word-wrapper
},


# Class:  X::Syntax::VirtualCall
# Status: TO DO
# Original Code:
#        "Virtual method call $.call may not be used on partially constructed object (maybe you mean {$.call.subst('.','!')} for direct attribute access here?)"

'X::Syntax::VirtualCall' => method {
        "Virtual method call $.call may not be used on partially constructed object (maybe you mean {$.call.subst('.','!')} for direct attribute access here?)"
},


# Class:  X::Syntax::WithoutElse
# Status: TO DO
# Note:   Make sure to use $.keyword instead of $!keyword
# Original Code:
#        qq|"without" does not take "$!keyword", please rewrite using "with"|

'X::Syntax::WithoutElse' => method {
        qq|"without" does not take "$.keyword", please rewrite using "with"|
},


# Class:  X::Temporal::InvalidFormat
# Status: TO DO
# Original Code:
#        "Invalid $.target string '$.invalid-str'; use $.format instead";

'X::Temporal::InvalidFormat' => method {
        "Invalid $.target string '$.invalid-str'; use $.format instead";
},


# Class:  X::TooLateForREPR
# Status: TO DO
# Note:   Make sure to use $.type instead of $!type
# Original Code:
#        "Cannot change REPR of $!type.^name() now (must be set at initial declaration)";

'X::TooLateForREPR' => method {
        "Cannot change REPR of $.type.^name() now (must be set at initial declaration)";
},


# Class:  X::TooManyDimensions
# Status: TO DO
# Original Code:
#        "Cannot $.operation a $.needed-dimensions dimension array with $.got-dimensions dimensions"

'X::TooManyDimensions' => method {
        "Cannot $.operation a $.needed-dimensions dimension array with $.got-dimensions dimensions"
},


# Class:  X::Trait::Invalid
# Status: TO DO
# Original Code:
#        "Cannot use '$.type $.subtype' on $.declaring '$.name'."

'X::Trait::Invalid' => method {
        "Cannot use '$.type $.subtype' on $.declaring '$.name'."
},


# Class:  X::Trait::NotOnNative
# Status: TO DO
# Original Code:
#        "Can't use trait '$.type $.subtype' on a native"
#          ~ ( $.native ?? " $.native." !! "." );

'X::Trait::NotOnNative' => method {
        "Can't use trait '$.type $.subtype' on a native"
          ~ ( $.native ?? " $.native." !! "." );
},


# Class:  X::Trait::Scope
# Status: TO DO
# Original Code:
#        "Can't apply trait '$.type $.subtype' on a $.scope scoped $.declaring."
#        ~ ( $.supported ?? " Only {$.supported.join(' and ')} scoped {$.declaring}s are supported." !! '' );

'X::Trait::Scope' => method {
        "Can't apply trait '$.type $.subtype' on a $.scope scoped $.declaring."
        ~ ( $.supported ?? " Only {$.supported.join(' and ')} scoped {$.declaring}s are supported." !! '' );
},


# Class:  X::Trait::Unknown
# Status: TO DO
# Original Code:
#        "Can't use unknown trait '{
#            try { $.type } // "unknown type"
#        }' -> '{
#            try { $.subtype } // "unknown subtype"
#        }' in a$.declaring declaration."

'X::Trait::Unknown' => method {
        "Can't use unknown trait '{
            try { $.type } // "unknown type"
        }' -> '{
            try { $.subtype } // "unknown subtype"
        }' in a$.declaring declaration."
},


# Class:  X::TypeCheck
# Status: TO DO
# Original Code:
#        self.priors() ~
#        "Type check failed in $.operation; expected $.expectedn but got $.gotn";

'X::TypeCheck' => method {
        self.priors() ~
        "Type check failed in $.operation; expected $.expectedn but got $.gotn";
},


# Class:  X::TypeCheck::Argument
# Status: TO DO
# Note:   Make sure to use $.signature, $.objname, $.arguments, @.arguments,
#         $.protoguilt instead of their direct access ($!foo) variants.
#         In current versions of Rakudo, protoguilt will always be empty,
#         but presumably it will be an adhoc string :-(
# Original Code:
#            my $multi = $!signature ~~ /\n/ // '';
#            "Calling {$!objname}({ join(', ', @!arguments) }) will never work with " ~ (
#                $!protoguilt ?? 'signature of the proto ' !!
#                $multi       ?? 'any of these multi signatures:' !!
#                                'declared signature '
#            ) ~ $!signature;

'X::TypeCheck::Argument' => method {
            my $multi = $.signature ~~ /\n/ // '';
            "Calling {$.objname}({ join(', ', @.arguments) }) will never work with " ~ (
                $.protoguilt ?? 'signature of the proto ' !!
                $multi       ?? 'any of these multi signatures:' !!
                                'declared signature '
            ) ~ $.signature;
},


# Class:  X::TypeCheck::Assignment
# Status: TO DO
# Original Code:
#        my $to = $.symbol.defined && $.symbol ne '$'
#            ?? " to $.symbol" !! "";
#        my $is-itself := nqp::eqaddr(self.expected, self.got);
#        my $expected = $is-itself
#            ?? "expected type $.expectedn cannot be itself"
#            !! "expected $.expectedn but got $.gotn";
#        my $maybe-Nil := $is-itself
#          || nqp::istype(self.expected.HOW, Metamodel::DefiniteHOW)
#          && nqp::eqaddr(self.expected.^base_type, self.got)
#          ?? ' (perhaps Nil was assigned to a :D which had no default?)' !! '';
#
#        self.priors() ~ "Type check failed in assignment$to; $expected$maybe-Nil"

'X::TypeCheck::Assignment' => method {
        my $to = $.symbol.defined && $.symbol ne '$'
            ?? " to $.symbol" !! "";
        my $is-itself := nqp::eqaddr(self.expected, self.got);
        my $expected = $is-itself
            ?? "expected type $.expectedn cannot be itself"
            !! "expected $.expectedn but got $.gotn";
        my $maybe-Nil := $is-itself
          || nqp::istype(self.expected.HOW, Metamodel::DefiniteHOW)
          && nqp::eqaddr(self.expected.^base_type, self.got)
          ?? ' (perhaps Nil was assigned to a :D which had no default?)' !! '';

        self.priors() ~ "Type check failed in assignment$to; $expected$maybe-Nil"
},


# Class:  X::TypeCheck::Binding
# Status: TO DO
# Original Code:
#        my $to = $.symbol.defined && $.symbol ne '$'
#            ?? " to '$.symbol'"
#            !! "";
#        my $expected = nqp::eqaddr(self.expected, self.got)
#            ?? "expected type $.expectedn cannot be itself"
#            !! "expected $.expectedn but got $.gotn";
#        self.priors() ~ "Type check failed in $.operation$to; $expected";

'X::TypeCheck::Binding' => method {
        my $to = $.symbol.defined && $.symbol ne '$'
            ?? " to '$.symbol'"
            !! "";
        my $expected = nqp::eqaddr(self.expected, self.got)
            ?? "expected type $.expectedn cannot be itself"
            !! "expected $.expectedn but got $.gotn";
        self.priors() ~ "Type check failed in $.operation$to; $expected";
},


# Class:  X::TypeCheck::Binding::Parameter
# Status: TO DO
# Original Code:
#        my $to = $.symbol.defined && $.symbol ne '$'
#            ?? " to parameter '$.symbol'"
#            !! " to anonymous parameter";
#        my $expected = nqp::eqaddr(self.expected, self.got)
#            ?? "expected type $.expectedn cannot be itself"
#            !! "expected $.expectedn but got $.gotn";
#        my $what-check = $.constraint ?? 'Constraint type' !! 'Type';
#        self.priors() ~ "$what-check check failed in $.operation$to; $expected";

'X::TypeCheck::Binding::Parameter' => method {
        my $to = $.symbol.defined && $.symbol ne '$'
            ?? " to parameter '$.symbol'"
            !! " to anonymous parameter";
        my $expected = nqp::eqaddr(self.expected, self.got)
            ?? "expected type $.expectedn cannot be itself"
            !! "expected $.expectedn but got $.gotn";
        my $what-check = $.constraint ?? 'Constraint type' !! 'Type';
        self.priors() ~ "$what-check check failed in $.operation$to; $expected";
},


# Class:  X::TypeCheck::Return
# Status: TO DO
# Original Code:
#        my $expected = nqp::eqaddr(self.expected, self.got)
#            ?? "expected return type $.expectedn cannot be itself " ~
#               "(perhaps $.operation a :D type object?)"
#            !! "expected $.expectedn but got $.gotn";
#        self.priors() ~
#        "Type check failed for return value; $expected";

'X::TypeCheck::Return' => method {
        my $expected = nqp::eqaddr(self.expected, self.got)
            ?? "expected return type $.expectedn cannot be itself " ~
               "(perhaps $.operation a :D type object?)"
            !! "expected $.expectedn but got $.gotn";
        self.priors() ~
        "Type check failed for return value; $expected";
},


# Class:  X::Undeclared
# Status: TO DO
# Original Code:
#        my $message := "$.what '$.symbol' is not declared";
#        if +@.suggestions == 1 {
#            $message := "$message. Did you mean '@.suggestions[0]'?";
#        } elsif +@.suggestions > 1 {
#            $message := "$message. Did you mean any of these: { @.suggestions.map( { "'$_'" } ).join(", ") }?";
#        }
#        $message.naive-word-wrapper

'X::Undeclared' => method {
        my $message := "$.what '$.symbol' is not declared";
        if +@.suggestions == 1 {
            $message := "$message. Did you mean '@.suggestions[0]'?";
        } elsif +@.suggestions > 1 {
            $message := "$message. Did you mean any of these: { @.suggestions.map( { "'$_'" } ).join(", ") }?";
        }
        $message.naive-word-wrapper
},


# Class:  X::Undeclared::Symbols
# Status: TO DO
# Original Code:
#        sub l(@l) {
#            my @lu = @l.map({ nqp::hllize($_) }).unique.sort;
#            'used at line' ~ (@lu == 1 ?? ' ' !! 's ') ~ @lu.join(', ')
#        }
#        sub s(@s) {
#            "Did you mean '{ @s.join("', '") }'?";
#        }
#        my $r = "";
#        if %.post_types {
#            $r ~= "Illegally post-declared type" ~ (%.post_types.elems == 1 ?? "" !! "s") ~ ":\n";
#            for %.post_types.sort(*.key) {
#                $r ~= "    $_.key() &l($_.value)\n";
#            }
#        }
#        if %.unk_types {
#            $r ~= "Undeclared name" ~ (%.unk_types.elems == 1 ?? "" !! "s") ~ ":\n";
#            for %.unk_types.sort(*.key) {
#                $r ~= "    $_.key() &l($_.value)";
#                if +%.type_suggestion{$_.key()} {
#                    $r ~= ". " ~ s(%.type_suggestion{$_.key()});
#                }
#                $r ~= "\n";
#            }
#        }
#        if %.unk_routines {
#            my $obs = {
#                y => "tr",
#                qr => "rx",
#                local => "temp (or dynamic var)",
#                new => "method call syntax",
#                foreach => "for",
#                use => '"v" prefix for pragma (e.g., "use v6;", "use v6.c;")',
#                need => '"v" prefix and "use" for pragma (e.g., "use v6;", "use v6.c;")',
#            }
#            $r ~= "Undeclared routine" ~ (%.unk_routines.elems == 1 ?? "" !! "s") ~ ":\n";
#            for %.unk_routines.sort(*.key) {
#                $r ~= "    $_.key() &l($_.value)";
#                $r ~= " (in Raku please use " ~ $obs{$_.key()} ~ " instead)" if $obs{$_.key()};
#                if +%.routine_suggestion{$_.key()}.list {
#                    $r ~= ". " ~ s(%.routine_suggestion{$_.key()}.list);
#                }
#                $r ~= "\n";
#            }
#        }
#        $r

'X::Undeclared::Symbols' => method {
        sub l(@l) {
            my @lu = @l.map({ nqp::hllize($_) }).unique.sort;
            'used at line' ~ (@lu == 1 ?? ' ' !! 's ') ~ @lu.join(', ')
        }
        sub s(@s) {
            "Did you mean '{ @s.join("', '") }'?";
        }
        my $r = "";
        if %.post_types {
            $r ~= "Illegally post-declared type" ~ (%.post_types.elems == 1 ?? "" !! "s") ~ ":\n";
            for %.post_types.sort(*.key) {
                $r ~= "    $_.key() &l($_.value)\n";
            }
        }
        if %.unk_types {
            $r ~= "Undeclared name" ~ (%.unk_types.elems == 1 ?? "" !! "s") ~ ":\n";
            for %.unk_types.sort(*.key) {
                $r ~= "    $_.key() &l($_.value)";
                if +%.type_suggestion{$_.key()} {
                    $r ~= ". " ~ s(%.type_suggestion{$_.key()});
                }
                $r ~= "\n";
            }
        }
        if %.unk_routines {
            my $obs = {
                y => "tr",
                qr => "rx",
                local => "temp (or dynamic var)",
                new => "method call syntax",
                foreach => "for",
                use => '"v" prefix for pragma (e.g., "use v6;", "use v6.c;")',
                need => '"v" prefix and "use" for pragma (e.g., "use v6;", "use v6.c;")',
            }
            $r ~= "Undeclared routine" ~ (%.unk_routines.elems == 1 ?? "" !! "s") ~ ":\n";
            for %.unk_routines.sort(*.key) {
                $r ~= "    $_.key() &l($_.value)";
                $r ~= " (in Raku please use " ~ $obs{$_.key()} ~ " instead)" if $obs{$_.key()};
                if +%.routine_suggestion{$_.key()}.list {
                    $r ~= ". " ~ s(%.routine_suggestion{$_.key()}.list);
                }
                $r ~= "\n";
            }
        }
        $r
},


# Class:  X::UnitScope::Invalid
# Status: TO DO
# Note:   Make sure to use $.what, $.where and $.suggestion. Currently,
#         $.where and $.suggestion are adhoc and not necessarily easy to
#         localize using Intl::X
# Original Code:
#        "A unit-scoped $.what definition is not allowed $.where;\n$!suggestion"

'X::UnitScope::Invalid' => method {
        "A unit-scoped $.what definition is not allowed $.where;\n$.suggestion"
},


# Class:  X::UnitScope::TooLate
# Status: TO DO
# Original Code:
#        "Too late for unit-scoped $.what definition;\n"
#        ~ "Please use the block form."

'X::UnitScope::TooLate' => method {
        "Too late for unit-scoped $.what definition;\n"
        ~ "Please use the block form."
},


# Class:  X::Value::Dynamic
# Status: TO DO
# Original Code:
#        "$.what value must be known at compile time"

'X::Value::Dynamic' => method {
        "$.what value must be known at compile time"
},


# Class:  X::WheneverOutOfScope
# Status: TO DO
# Original Code:
#        "Cannot have a 'whenever' block outside the scope of a 'supply' or 'react' block"

'X::WheneverOutOfScope' => method {
        "Cannot have a 'whenever' block outside the scope of a 'supply' or 'react' block"
},


# Class:  X::Worry::P5::BackReference
# Status: TO DO
# Original Code:
#q/To refer to a positional match capture, just use $0 (numbering starts at 0).
#Parenthesize as \\(...) if you intended a capture of a single numeric value./

'X::Worry::P5::BackReference' => method {
q/To refer to a positional match capture, just use $0 (numbering starts at 0).
Parenthesize as \\(...) if you intended a capture of a single numeric value./
},


# Class:  X::Worry::P5::LeadingZero
# Status: TO DO
# Note:   To handle the virtual machine pragmas, check $*VM eq 'jvm' to detect
#         the Java backend (fyi: 'moar' and 'js' are the others).  This code
#         block is formatted ugly as sin, so you'll likely need to rewrite it.
#         Here's how I'd recommend (pardon my informality):
#             'Makes no sense, for an octal'
#             ~ ", use prefix '0o'"
#             ~ (
#                 (if $*JV.name eq 'jvm' {
#                     $.value ~~ /<[89]>/
#                 }else{
#                     $.value.comb.grep(*.unival > 7)
#                 })
#                     ?? ", but $.value ain't no octal"
#                     !! "; like, '0o$.value'"
#             )
#             ~ '. For a string, add quotes.'
# Original Code:
#        'Leading 0 has no meaning. If you meant to create an octal number'
#        ~ ", use '0o' prefix" ~ (
##?if jvm
#            $!value ~~ /<[89]>/
##?endif
##?if !jvm
#            $!value.comb.grep(*.unival > 7)
##?endif
#                ?? ", but note that $!value is not a valid octal number"
#                !! "; like, '0o$!value'"
#        ) ~ '. If you meant to create a string, please add quotation marks.'

'X::Worry::P5::LeadingZero' => method {
        'Leading 0 has no meaning. If you meant to create an octal number'
        ~ ", use '0o' prefix"
        ~ (
            (if $*JV.name eq 'jvm' {
                $.value ~~ /<[89]>/
            }else{
                $.value.comb.grep(*.unival > 7)
            })
                ?? ", but note that $.value is not a valid octal number"
                !! "; like, '0o$.value'"
        ) ~ '. If you meant to create a string, please add quotation marks.'
},


# Class:  X::Worry::P5::Reference
# Status: TO DO
# Original Code:
#q/To pass an array, hash or sub to a function in Raku, just pass it as is.
#For other uses of Perl's ref operator consider binding with ::= instead.
#Parenthesize as \\(...) if you intended a capture of a single variable./

'X::Worry::P5::Reference' => method {
q/To pass an array, hash or sub to a function in Raku, just pass it as is.
For other uses of Perl's ref operator consider binding with ::= instead.
Parenthesize as \\(...) if you intended a capture of a single variable./
},


# Class:  X::Worry::Precedence::Range
# Status: TO DO
# Note:   Use $.action instead of $!action.  Note, however, that $.action is
#         an adhoc value that isn't easily translatable at the moment.
# Original Code:
#"To $!action a range, parenthesize the whole range.
#(Or parenthesize the whole endpoint expression, if you meant that.)"

'X::Worry::Precedence::Range' => method {
"To $.action a range, parenthesize the whole range.
(Or parenthesize the whole endpoint expression, if you meant that.)"
},


;
