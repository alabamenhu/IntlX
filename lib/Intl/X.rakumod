#unit module Intl::X;
# The above WOULD be the module name

# We only need these two variables to handle everything
my $language; # The preferred language (only one for now, positional in the future)
my %x;        # The exceptions (keys are type names, values are methods)

#| Loads the exceptions for a given language.
sub load-language($code) {
    my $module = "Intl::X::$code";
    try require ::($module);
    if ::($module) ~~ Failure {
        # TODO: error handling
    } else {
        %x{$code} := ::($module ~ "::%exceptions");
    }
}

# Easy cheap fallback for now
my \ENGLISH = method ($self:) { callsame }

#| Loads the selected language for use in exception handling
sub EXPORT (
        $code = 'en' #The language
) {
    $language = $code;
    return if $language eq 'en'; # nothing to do here;
    OUTER::<$language> = $language;

    load-language $language;

    Map.new();
}

#######################################
#       SPECIAL METHOD HANDLING       #
# Some exceptions  do things  outside #
# of their message handler,  and thus #
# require special handling.   All the #
# stuff here requires periodic review #
# to  ensure  they still  behave like #
# the English-language core.          #
#######################################
#
# It's ugly, but the way to call the method strings found in the special translations
# is to use self.&(%x<Foo.bar>).  In reality, it probably means I should turn everything
# into subs instead and manually pass self.  I'll hold off on that for the time being.
#
# I should eventually rewrite it to not need it, but many Exceptions use NQP so…


# Because $!ex and $!bt are defined without accessors, I have rewritten this slightly.
# $!bt can be obtained (more or less) using .backtrace, and $!ex will just use 'self'.
# Both may backfire somewhere, but if that happens, maybe core would be willing to
# make them public.
#
# Changes: nqp::isconcrete is removed -- at best we can use self, which is guaranteed
# defined because of Exception:D: in the signature.
Exception.^find_method('gist').wrap: method (Exception:D:) {
    return callsame;
    my $str;
    #if nqp::isconcrete($!ex) {
    #     my str $message = nqp::getmessage(self); # was nqp::getmessage($!ex)
    #     $str = nqp::isnull_s($message)
    #             ?? (try self.message) // (%x<Exception.died-with> // self.&("Died with {self.^name}"))
    #             !! nqp::p6box_s($message);
    $str = (try self.message) // (%x<Exception.died-with> // self.&("Died with {self.^name}"));
    $str ~= "\n";
    try $str ~= self.backtrace
        || Backtrace.new()
        || (self.&(%x<Exception.no-backtrace>) // '  (no backtrace available)');
    #}
    #else {
    #    $str = (try self.message) // self.&(%x<Exception.unknown>) // "Unthrown {self.^name} with no message";
    #}
    $str;
};


# The variable $!ex basically refers to an exception itself.
# We should be able to simply use 'self', and thus the initial conditional
# is redundant, since the signature guarantees a defined object.
Exception.^find_method('Str').wrap: method (Exception:D:) {
    return callsame;
    my $str;
    #if nqp::isconcrete($!ex) {
    #    my str $message = nqp::getmessage(self); # was nqp::getmessage($!ex)
    #    $str = nqp::isnull_s($message) ?? '' !! nqp::p6box_s($message);
    #}
    $str ||= (try self.message);
    $str = ~$str if defined $str;
    $str // ( self.&(%x<Exception.something-wrong>) // "Something went wrong in {self.WHAT.gist}");
}

# need to do anything special for multi?
X::Comp::Group.^find_method('gist').wrap: method (\self:D:) {
    my $r = "";
    my $sorry = 'SORRY!';
    with %x{$language}<X::Comp::Group.sorry> { $sorry = self.&($_)};

    if $.panic || @.sorrows {
        my ($red, $clear) = Rakudo::Internals.error-rcgye;
        $r ~= "$red==={$clear}$sorry$red===$clear\n";
        for @.sorrows {
            $r ~= .gist(:!sorry, :!expect) ~ "\n";
        }
        if $.panic {
            $r ~= $.panic.gist(:!sorry) ~ "\n";
        }
    }
    if @.worries {
        my $potential = "Potential difficulties:";
        my $others    = "Other potential difficulties";
        with %x{$language}<X::Comp::Group.difficulties> { $potential = self.&($_)};
        with %x{$language}<X::Comp::Group.other-diff>   { $others    = self.&($_)};

        $r ~= $.panic || @.sorrows
                ?? "$others:\n"
                !! "$potential:\n";
        for @.worries {
            $r ~= .gist(:!sorry, :!expect).indent(4) ~ "\n";
        }
    }
    $r
}


X::AdHoc.^find_method('payload').wrap: method {
    # The payload is technically a default string, so to wrap this,
    # we check if the payload is the default, and if it is, then call the wrapped
    # otherwise, the value is passed through.
    my $adhoc = callsame;
    if $adhoc eq 'Unexplained error' { # the original default
        with %x{$language}<X::Adhoc::Eval.payload> { $adhoc = self.&($_) }
    }
    $adhoc
}


X::SecurityPolicy::Eval.^find_method('payload').wrap: method {
    with %x{$language}<X::SecurityPolicy::Eval.payload> { self.&($_)} else { callsame }
}



#| The sub that will eventually handle language fallback logic
sub intl-x($type) {
    %x{$language}{$type}
}

X::SecurityPolicy::Eval.^find_method('message').wrap: method {with %x{$language}<X::SecurityPolicy::Eval> {self.&($_)} else {callsame}};

#####################################################
### AUTOGENERATED ! AUTOGENERATED ! AUTOGENERATED ###
#####################################################
###  DO NOT EDIT THIS BOX OR ANYTHING BENEATH IT  ###
#####################################################

CX::Done.^find_method('message').wrap: method {with %x{$language}<CX::Done> {self.&($_)} else {callsame}};
CX::Emit.^find_method('message').wrap: method {with %x{$language}<CX::Emit> {self.&($_)} else {callsame}};
CX::Last.^find_method('message').wrap: method {with %x{$language}<CX::Last> {self.&($_)} else {callsame}};
CX::Next.^find_method('message').wrap: method {with %x{$language}<CX::Next> {self.&($_)} else {callsame}};
CX::Proceed.^find_method('message').wrap: method {with %x{$language}<CX::Proceed> {self.&($_)} else {callsame}};
CX::Redo.^find_method('message').wrap: method {with %x{$language}<CX::Redo> {self.&($_)} else {callsame}};
CX::Return.^find_method('message').wrap: method {with %x{$language}<CX::Return> {self.&($_)} else {callsame}};
CX::Succeed.^find_method('message').wrap: method {with %x{$language}<CX::Succeed> {self.&($_)} else {callsame}};
CX::Take.^find_method('message').wrap: method {with %x{$language}<CX::Take> {self.&($_)} else {callsame}};
X::AdHoc.^find_method('message').wrap: method {with %x{$language}<X::AdHoc> {self.&($_)} else {callsame}};
X::Adverb.^find_method('message').wrap: method {with %x{$language}<X::Adverb> {self.&($_)} else {callsame}};
X::Anon::Augment.^find_method('message').wrap: method {with %x{$language}<X::Anon::Augment> {self.&($_)} else {callsame}};
X::Anon::Multi.^find_method('message').wrap: method {with %x{$language}<X::Anon::Multi> {self.&($_)} else {callsame}};
X::ArrayShapeMismatch.^find_method('message').wrap: method {with %x{$language}<X::ArrayShapeMismatch> {self.&($_)} else {callsame}};
X::Assignment::ArrayShapeMismatch.^find_method('message').wrap: method {with %x{$language}<X::Assignment::ArrayShapeMismatch> {self.&($_)} else {callsame}};
X::Assignment::RO.^find_method('message').wrap: method {with %x{$language}<X::Assignment::RO> {self.&($_)} else {callsame}};
X::Assignment::RO::Comp.^find_method('message').wrap: method {with %x{$language}<X::Assignment::RO::Comp> {self.&($_)} else {callsame}};
X::Attribute::NoPackage.^find_method('message').wrap: method {with %x{$language}<X::Attribute::NoPackage> {self.&($_)} else {callsame}};
X::Attribute::Package.^find_method('message').wrap: method {with %x{$language}<X::Attribute::Package> {self.&($_)} else {callsame}};
X::Attribute::Regex.^find_method('message').wrap: method {with %x{$language}<X::Attribute::Regex> {self.&($_)} else {callsame}};
X::Attribute::Required.^find_method('message').wrap: method {with %x{$language}<X::Attribute::Required> {self.&($_)} else {callsame}};
X::Attribute::Scope::Package.^find_method('message').wrap: method {with %x{$language}<X::Attribute::Scope::Package> {self.&($_)} else {callsame}};
X::Attribute::Undeclared.^find_method('message').wrap: method {with %x{$language}<X::Attribute::Undeclared> {self.&($_)} else {callsame}};
X::Augment::NoSuchType.^find_method('message').wrap: method {with %x{$language}<X::Augment::NoSuchType> {self.&($_)} else {callsame}};
X::Backslash::NonVariableDollar.^find_method('message').wrap: method {with %x{$language}<X::Backslash::NonVariableDollar> {self.&($_)} else {callsame}};
X::Backslash::UnrecognizedSequence.^find_method('message').wrap: method {with %x{$language}<X::Backslash::UnrecognizedSequence> {self.&($_)} else {callsame}};
X::Bind.^find_method('message').wrap: method {with %x{$language}<X::Bind> {self.&($_)} else {callsame}};
X::Bind::NativeType.^find_method('message').wrap: method {with %x{$language}<X::Bind::NativeType> {self.&($_)} else {callsame}};
X::Bind::Slice.^find_method('message').wrap: method {with %x{$language}<X::Bind::Slice> {self.&($_)} else {callsame}};
X::Bind::ZenSlice.^find_method('message').wrap: method {with %x{$language}<X::Bind::ZenSlice> {self.&($_)} else {callsame}};
X::Buf::AsStr.^find_method('message').wrap: method {with %x{$language}<X::Buf::AsStr> {self.&($_)} else {callsame}};
X::Buf::Pack.^find_method('message').wrap: method {with %x{$language}<X::Buf::Pack> {self.&($_)} else {callsame}};
X::Buf::Pack::NonASCII.^find_method('message').wrap: method {with %x{$language}<X::Buf::Pack::NonASCII> {self.&($_)} else {callsame}};
X::Caller::NotDynamic.^find_method('message').wrap: method {with %x{$language}<X::Caller::NotDynamic> {self.&($_)} else {callsame}};
X::Cannot::Capture.^find_method('message').wrap: method {with %x{$language}<X::Cannot::Capture> {self.&($_)} else {callsame}};
X::Cannot::Empty.^find_method('message').wrap: method {with %x{$language}<X::Cannot::Empty> {self.&($_)} else {callsame}};
X::Cannot::Junction.^find_method('message').wrap: method {with %x{$language}<X::Cannot::Junction> {self.&($_)} else {callsame}};
X::Cannot::Lazy.^find_method('message').wrap: method {with %x{$language}<X::Cannot::Lazy> {self.&($_)} else {callsame}};
X::Cannot::Map.^find_method('message').wrap: method {with %x{$language}<X::Cannot::Map> {self.&($_)} else {callsame}};
X::Cannot::New.^find_method('message').wrap: method {with %x{$language}<X::Cannot::New> {self.&($_)} else {callsame}};
X::Comp::BeginTime.^find_method('message').wrap: method {with %x{$language}<X::Comp::BeginTime> {self.&($_)} else {callsame}};
X::Comp::FailGoal.^find_method('message').wrap: method {with %x{$language}<X::Comp::FailGoal> {self.&($_)} else {callsame}};
X::Comp::Group.^find_method('message').wrap: method {with %x{$language}<X::Comp::Group> {self.&($_)} else {callsame}};
X::Comp::WheneverOutOfScope.^find_method('message').wrap: method {with %x{$language}<X::Comp::WheneverOutOfScope> {self.&($_)} else {callsame}};
X::CompUnit::UnsatisfiedDependency.^find_method('message').wrap: method {with %x{$language}<X::CompUnit::UnsatisfiedDependency> {self.&($_)} else {callsame}};
X::Composition::NotComposable.^find_method('message').wrap: method {with %x{$language}<X::Composition::NotComposable> {self.&($_)} else {callsame}};
X::Constructor::Positional.^find_method('message').wrap: method {with %x{$language}<X::Constructor::Positional> {self.&($_)} else {callsame}};
X::ControlFlow.^find_method('message').wrap: method {with %x{$language}<X::ControlFlow> {self.&($_)} else {callsame}};
X::ControlFlow::Return.^find_method('message').wrap: method {with %x{$language}<X::ControlFlow::Return> {self.&($_)} else {callsame}};
X::DateTime::InvalidDeltaUnit.^find_method('message').wrap: method {with %x{$language}<X::DateTime::InvalidDeltaUnit> {self.&($_)} else {callsame}};
X::DateTime::TimezoneClash.^find_method('message').wrap: method {with %x{$language}<X::DateTime::TimezoneClash> {self.&($_)} else {callsame}};
X::Declaration::OurScopeInRole.^find_method('message').wrap: method {with %x{$language}<X::Declaration::OurScopeInRole> {self.&($_)} else {callsame}};
X::Declaration::Scope::Multi.^find_method('message').wrap: method {with %x{$language}<X::Declaration::Scope::Multi> {self.&($_)} else {callsame}};
X::Dynamic::NotFound.^find_method('message').wrap: method {with %x{$language}<X::Dynamic::NotFound> {self.&($_)} else {callsame}};
X::Dynamic::Package.^find_method('message').wrap: method {with %x{$language}<X::Dynamic::Package> {self.&($_)} else {callsame}};
X::Dynamic::Postdeclaration.^find_method('message').wrap: method {with %x{$language}<X::Dynamic::Postdeclaration> {self.&($_)} else {callsame}};
X::EXPORTHOW::Conflict.^find_method('message').wrap: method {with %x{$language}<X::EXPORTHOW::Conflict> {self.&($_)} else {callsame}};
X::EXPORTHOW::InvalidDirective.^find_method('message').wrap: method {with %x{$language}<X::EXPORTHOW::InvalidDirective> {self.&($_)} else {callsame}};
X::EXPORTHOW::NothingToSupersede.^find_method('message').wrap: method {with %x{$language}<X::EXPORTHOW::NothingToSupersede> {self.&($_)} else {callsame}};
X::Encoding::AlreadyRegistered.^find_method('message').wrap: method {with %x{$language}<X::Encoding::AlreadyRegistered> {self.&($_)} else {callsame}};
X::Encoding::Unknown.^find_method('message').wrap: method {with %x{$language}<X::Encoding::Unknown> {self.&($_)} else {callsame}};
X::Eval::NoSuchLang.^find_method('message').wrap: method {with %x{$language}<X::Eval::NoSuchLang> {self.&($_)} else {callsame}};
X::Exhausted.^find_method('message').wrap: method {with %x{$language}<X::Exhausted> {self.&($_)} else {callsame}};
X::Experimental.^find_method('message').wrap: method {with %x{$language}<X::Experimental> {self.&($_)} else {callsame}};
X::Export::NameClash.^find_method('message').wrap: method {with %x{$language}<X::Export::NameClash> {self.&($_)} else {callsame}};
X::Hash::Store::OddNumber.^find_method('message').wrap: method {with %x{$language}<X::Hash::Store::OddNumber> {self.&($_)} else {callsame}};
X::HyperOp::Infinite.^find_method('message').wrap: method {with %x{$language}<X::HyperOp::Infinite> {self.&($_)} else {callsame}};
X::HyperOp::NonDWIM.^find_method('message').wrap: method {with %x{$language}<X::HyperOp::NonDWIM> {self.&($_)} else {callsame}};
X::HyperWhatever::Multiple.^find_method('message').wrap: method {with %x{$language}<X::HyperWhatever::Multiple> {self.&($_)} else {callsame}};
X::IO::BinaryAndEncoding.^find_method('message').wrap: method {with %x{$language}<X::IO::BinaryAndEncoding> {self.&($_)} else {callsame}};
X::IO::BinaryMode.^find_method('message').wrap: method {with %x{$language}<X::IO::BinaryMode> {self.&($_)} else {callsame}};
X::IO::Chdir.^find_method('message').wrap: method {with %x{$language}<X::IO::Chdir> {self.&($_)} else {callsame}};
X::IO::Chmod.^find_method('message').wrap: method {with %x{$language}<X::IO::Chmod> {self.&($_)} else {callsame}};
X::IO::Copy.^find_method('message').wrap: method {with %x{$language}<X::IO::Copy> {self.&($_)} else {callsame}};
X::IO::Cwd.^find_method('message').wrap: method {with %x{$language}<X::IO::Cwd> {self.&($_)} else {callsame}};
X::IO::Dir.^find_method('message').wrap: method {with %x{$language}<X::IO::Dir> {self.&($_)} else {callsame}};
X::IO::Directory.^find_method('message').wrap: method {with %x{$language}<X::IO::Directory> {self.&($_)} else {callsame}};
X::IO::DoesNotExist.^find_method('message').wrap: method {with %x{$language}<X::IO::DoesNotExist> {self.&($_)} else {callsame}};
X::IO::Flush.^find_method('message').wrap: method {with %x{$language}<X::IO::Flush> {self.&($_)} else {callsame}};
X::IO::Link.^find_method('message').wrap: method {with %x{$language}<X::IO::Link> {self.&($_)} else {callsame}};
X::IO::Lock.^find_method('message').wrap: method {with %x{$language}<X::IO::Lock> {self.&($_)} else {callsame}};
X::IO::Mkdir.^find_method('message').wrap: method {with %x{$language}<X::IO::Mkdir> {self.&($_)} else {callsame}};
X::IO::Move.^find_method('message').wrap: method {with %x{$language}<X::IO::Move> {self.&($_)} else {callsame}};
X::IO::NotAChild.^find_method('message').wrap: method {with %x{$language}<X::IO::NotAChild> {self.&($_)} else {callsame}};
X::IO::NotAFile.^find_method('message').wrap: method {with %x{$language}<X::IO::NotAFile> {self.&($_)} else {callsame}};
X::IO::Null.^find_method('message').wrap: method {with %x{$language}<X::IO::Null> {self.&($_)} else {callsame}};
X::IO::Rename.^find_method('message').wrap: method {with %x{$language}<X::IO::Rename> {self.&($_)} else {callsame}};
X::IO::Resolve.^find_method('message').wrap: method {with %x{$language}<X::IO::Resolve> {self.&($_)} else {callsame}};
X::IO::Rmdir.^find_method('message').wrap: method {with %x{$language}<X::IO::Rmdir> {self.&($_)} else {callsame}};
X::IO::Symlink.^find_method('message').wrap: method {with %x{$language}<X::IO::Symlink> {self.&($_)} else {callsame}};
X::IO::Unknown.^find_method('message').wrap: method {with %x{$language}<X::IO::Unknown> {self.&($_)} else {callsame}};
X::IO::Unlink.^find_method('message').wrap: method {with %x{$language}<X::IO::Unlink> {self.&($_)} else {callsame}};
X::IllegalDimensionInShape.^find_method('message').wrap: method {with %x{$language}<X::IllegalDimensionInShape> {self.&($_)} else {callsame}};
X::IllegalOnFixedDimensionArray.^find_method('message').wrap: method {with %x{$language}<X::IllegalOnFixedDimensionArray> {self.&($_)} else {callsame}};
X::Immutable.^find_method('message').wrap: method {with %x{$language}<X::Immutable> {self.&($_)} else {callsame}};
X::Import::MissingSymbols.^find_method('message').wrap: method {with %x{$language}<X::Import::MissingSymbols> {self.&($_)} else {callsame}};
X::Import::NoSuchTag.^find_method('message').wrap: method {with %x{$language}<X::Import::NoSuchTag> {self.&($_)} else {callsame}};
X::Import::OnlystarProto.^find_method('message').wrap: method {with %x{$language}<X::Import::OnlystarProto> {self.&($_)} else {callsame}};
X::Import::Positional.^find_method('message').wrap: method {with %x{$language}<X::Import::Positional> {self.&($_)} else {callsame}};
X::Import::Redeclaration.^find_method('message').wrap: method {with %x{$language}<X::Import::Redeclaration> {self.&($_)} else {callsame}};
X::Inheritance::NotComposed.^find_method('message').wrap: method {with %x{$language}<X::Inheritance::NotComposed> {self.&($_)} else {callsame}};
X::Inheritance::SelfInherit.^find_method('message').wrap: method {with %x{$language}<X::Inheritance::SelfInherit> {self.&($_)} else {callsame}};
X::Inheritance::UnknownParent.^find_method('message').wrap: method {with %x{$language}<X::Inheritance::UnknownParent> {self.&($_)} else {callsame}};
X::Inheritance::Unsupported.^find_method('message').wrap: method {with %x{$language}<X::Inheritance::Unsupported> {self.&($_)} else {callsame}};
X::Invalid::ComputedValue.^find_method('message').wrap: method {with %x{$language}<X::Invalid::ComputedValue> {self.&($_)} else {callsame}};
X::Invalid::Value.^find_method('message').wrap: method {with %x{$language}<X::Invalid::Value> {self.&($_)} else {callsame}};
X::InvalidType.^find_method('message').wrap: method {with %x{$language}<X::InvalidType> {self.&($_)} else {callsame}};
X::InvalidTypeSmiley.^find_method('message').wrap: method {with %x{$language}<X::InvalidTypeSmiley> {self.&($_)} else {callsame}};
X::Item.^find_method('message').wrap: method {with %x{$language}<X::Item> {self.&($_)} else {callsame}};
X::Language::ModRequired.^find_method('message').wrap: method {with %x{$language}<X::Language::ModRequired> {self.&($_)} else {callsame}};
X::Language::TooLate.^find_method('message').wrap: method {with %x{$language}<X::Language::TooLate> {self.&($_)} else {callsame}};
X::Language::Unsupported.^find_method('message').wrap: method {with %x{$language}<X::Language::Unsupported> {self.&($_)} else {callsame}};
X::LibEmpty.^find_method('message').wrap: method {with %x{$language}<X::LibEmpty> {self.&($_)} else {callsame}};
X::LibNone.^find_method('message').wrap: method {with %x{$language}<X::LibNone> {self.&($_)} else {callsame}};
X::Localizer::NoContainer.^find_method('message').wrap: method {with %x{$language}<X::Localizer::NoContainer> {self.&($_)} else {callsame}};
X::Match::Bool.^find_method('message').wrap: method {with %x{$language}<X::Match::Bool> {self.&($_)} else {callsame}};
X::Method::InvalidQualifier.^find_method('message').wrap: method {with %x{$language}<X::Method::InvalidQualifier> {self.&($_)} else {callsame}};
X::Method::Private::Permission.^find_method('message').wrap: method {with %x{$language}<X::Method::Private::Permission> {self.&($_)} else {callsame}};
X::Method::Private::Unqualified.^find_method('message').wrap: method {with %x{$language}<X::Method::Private::Unqualified> {self.&($_)} else {callsame}};
X::Mixin::NotComposable.^find_method('message').wrap: method {with %x{$language}<X::Mixin::NotComposable> {self.&($_)} else {callsame}};
X::Multi::Ambiguous.^find_method('message').wrap: method {with %x{$language}<X::Multi::Ambiguous> {self.&($_)} else {callsame}};
X::Multi::NoMatch.^find_method('message').wrap: method {with %x{$language}<X::Multi::NoMatch> {self.&($_)} else {callsame}};
X::MultipleTypeSmiley.^find_method('message').wrap: method {with %x{$language}<X::MultipleTypeSmiley> {self.&($_)} else {callsame}};
X::MustBeParametric.^find_method('message').wrap: method {with %x{$language}<X::MustBeParametric> {self.&($_)} else {callsame}};
X::NQP::NotFound.^find_method('message').wrap: method {with %x{$language}<X::NQP::NotFound> {self.&($_)} else {callsame}};
X::NYI::Available.^find_method('message').wrap: method {with %x{$language}<X::NYI::Available> {self.&($_)} else {callsame}};
X::NYI::BigInt.^find_method('message').wrap: method {with %x{$language}<X::NYI::BigInt> {self.&($_)} else {callsame}};
X::NoCoreRevision.^find_method('message').wrap: method {with %x{$language}<X::NoCoreRevision> {self.&($_)} else {callsame}};
X::NoDispatcher.^find_method('message').wrap: method {with %x{$language}<X::NoDispatcher> {self.&($_)} else {callsame}};
X::NoSuchSymbol.^find_method('message').wrap: method {with %x{$language}<X::NoSuchSymbol> {self.&($_)} else {callsame}};
X::NotEnoughDimensions.^find_method('message').wrap: method {with %x{$language}<X::NotEnoughDimensions> {self.&($_)} else {callsame}};
X::NotParametric.^find_method('message').wrap: method {with %x{$language}<X::NotParametric> {self.&($_)} else {callsame}};
X::Numeric::CannotConvert.^find_method('message').wrap: method {with %x{$language}<X::Numeric::CannotConvert> {self.&($_)} else {callsame}};
X::Numeric::Confused.^find_method('message').wrap: method {with %x{$language}<X::Numeric::Confused> {self.&($_)} else {callsame}};
X::Numeric::DivideByZero.^find_method('message').wrap: method {with %x{$language}<X::Numeric::DivideByZero> {self.&($_)} else {callsame}};
X::Numeric::Overflow.^find_method('message').wrap: method {with %x{$language}<X::Numeric::Overflow> {self.&($_)} else {callsame}};
X::Numeric::Underflow.^find_method('message').wrap: method {with %x{$language}<X::Numeric::Underflow> {self.&($_)} else {callsame}};
X::Obsolete.^find_method('message').wrap: method {with %x{$language}<X::Obsolete> {self.&($_)} else {callsame}};
X::OutOfRange.^find_method('message').wrap: method {with %x{$language}<X::OutOfRange> {self.&($_)} else {callsame}};
X::Package::Stubbed.^find_method('message').wrap: method {with %x{$language}<X::Package::Stubbed> {self.&($_)} else {callsame}};
X::Package::UseLib.^find_method('message').wrap: method {with %x{$language}<X::Package::UseLib> {self.&($_)} else {callsame}};
X::Pairup::OddNumber.^find_method('message').wrap: method {with %x{$language}<X::Pairup::OddNumber> {self.&($_)} else {callsame}};
X::Parameter::AfterDefault.^find_method('message').wrap: method {with %x{$language}<X::Parameter::AfterDefault> {self.&($_)} else {callsame}};
X::Parameter::BadType.^find_method('message').wrap: method {with %x{$language}<X::Parameter::BadType> {self.&($_)} else {callsame}};
X::Parameter::Default.^find_method('message').wrap: method {with %x{$language}<X::Parameter::Default> {self.&($_)} else {callsame}};
X::Parameter::Default::TypeCheck.^find_method('message').wrap: method {with %x{$language}<X::Parameter::Default::TypeCheck> {self.&($_)} else {callsame}};
X::Parameter::InvalidConcreteness.^find_method('message').wrap: method {with %x{$language}<X::Parameter::InvalidConcreteness> {self.&($_)} else {callsame}};
X::Parameter::InvalidType.^find_method('message').wrap: method {with %x{$language}<X::Parameter::InvalidType> {self.&($_)} else {callsame}};
X::Parameter::MultipleTypeConstraints.^find_method('message').wrap: method {with %x{$language}<X::Parameter::MultipleTypeConstraints> {self.&($_)} else {callsame}};
X::Parameter::Placeholder.^find_method('message').wrap: method {with %x{$language}<X::Parameter::Placeholder> {self.&($_)} else {callsame}};
X::Parameter::RW.^find_method('message').wrap: method {with %x{$language}<X::Parameter::RW> {self.&($_)} else {callsame}};
X::Parameter::Twigil.^find_method('message').wrap: method {with %x{$language}<X::Parameter::Twigil> {self.&($_)} else {callsame}};
X::Parameter::TypedSlurpy.^find_method('message').wrap: method {with %x{$language}<X::Parameter::TypedSlurpy> {self.&($_)} else {callsame}};
X::Parameter::WrongOrder.^find_method('message').wrap: method {with %x{$language}<X::Parameter::WrongOrder> {self.&($_)} else {callsame}};
X::ParametricConstant.^find_method('message').wrap: method {with %x{$language}<X::ParametricConstant> {self.&($_)} else {callsame}};
X::Phaser::Multiple.^find_method('message').wrap: method {with %x{$language}<X::Phaser::Multiple> {self.&($_)} else {callsame}};
X::Phaser::PrePost.^find_method('message').wrap: method {with %x{$language}<X::Phaser::PrePost> {self.&($_)} else {callsame}};
X::PhaserExceptions.^find_method('message').wrap: method {with %x{$language}<X::PhaserExceptions> {self.&($_)} else {callsame}};
X::Placeholder::Attribute.^find_method('message').wrap: method {with %x{$language}<X::Placeholder::Attribute> {self.&($_)} else {callsame}};
X::Placeholder::Block.^find_method('message').wrap: method {with %x{$language}<X::Placeholder::Block> {self.&($_)} else {callsame}};
X::Placeholder::Mainline.^find_method('message').wrap: method {with %x{$language}<X::Placeholder::Mainline> {self.&($_)} else {callsame}};
X::Placeholder::NonPlaceholder.^find_method('message').wrap: method {with %x{$language}<X::Placeholder::NonPlaceholder> {self.&($_)} else {callsame}};
X::PoisonedAlias.^find_method('message').wrap: method {with %x{$language}<X::PoisonedAlias> {self.&($_)} else {callsame}};
X::Pragma::CannotPrecomp.^find_method('message').wrap: method {with %x{$language}<X::Pragma::CannotPrecomp> {self.&($_)} else {callsame}};
X::Pragma::CannotWhat.^find_method('message').wrap: method {with %x{$language}<X::Pragma::CannotWhat> {self.&($_)} else {callsame}};
X::Pragma::MustOneOf.^find_method('message').wrap: method {with %x{$language}<X::Pragma::MustOneOf> {self.&($_)} else {callsame}};
X::Pragma::NoArgs.^find_method('message').wrap: method {with %x{$language}<X::Pragma::NoArgs> {self.&($_)} else {callsame}};
X::Pragma::OnlyOne.^find_method('message').wrap: method {with %x{$language}<X::Pragma::OnlyOne> {self.&($_)} else {callsame}};
X::Pragma::UnknownArg.^find_method('message').wrap: method {with %x{$language}<X::Pragma::UnknownArg> {self.&($_)} else {callsame}};
X::Proc::Unsuccessful.^find_method('message').wrap: method {with %x{$language}<X::Proc::Unsuccessful> {self.&($_)} else {callsame}};
X::PseudoPackage::InDeclaration.^find_method('message').wrap: method {with %x{$language}<X::PseudoPackage::InDeclaration> {self.&($_)} else {callsame}};
X::Range::InvalidArg.^find_method('message').wrap: method {with %x{$language}<X::Range::InvalidArg> {self.&($_)} else {callsame}};
X::Redeclaration::Outer.^find_method('message').wrap: method {with %x{$language}<X::Redeclaration::Outer> {self.&($_)} else {callsame}};
X::Role::Parametric::NoSuchCandidate.^find_method('message').wrap: method {with %x{$language}<X::Role::Parametric::NoSuchCandidate> {self.&($_)} else {callsame}};
X::Routine::Unwrap.^find_method('message').wrap: method {with %x{$language}<X::Routine::Unwrap> {self.&($_)} else {callsame}};
X::SecurityPolicy::Eval.^find_method('message').wrap: method {with %x{$language}<X::SecurityPolicy::Eval> {self.&($_)} else {callsame}};
X::Seq::Consumed.^find_method('message').wrap: method {with %x{$language}<X::Seq::Consumed> {self.&($_)} else {callsame}};
X::Seq::NotIndexable.^find_method('message').wrap: method {with %x{$language}<X::Seq::NotIndexable> {self.&($_)} else {callsame}};
X::Sequence::Deduction.^find_method('message').wrap: method {with %x{$language}<X::Sequence::Deduction> {self.&($_)} else {callsame}};
#X::Sequence::Endpoint.^find_method('message').wrap: method {with %x{$language}<X::Sequence::Endpoint> {self.&($_)} else {callsame}};
X::Set::Coerce.^find_method('message').wrap: method {with %x{$language}<X::Set::Coerce> {self.&($_)} else {callsame}};
X::Signature::NameClash.^find_method('message').wrap: method {with %x{$language}<X::Signature::NameClash> {self.&($_)} else {callsame}};
X::Signature::Placeholder.^find_method('message').wrap: method {with %x{$language}<X::Signature::Placeholder> {self.&($_)} else {callsame}};
X::Str::InvalidCharName.^find_method('message').wrap: method {with %x{$language}<X::Str::InvalidCharName> {self.&($_)} else {callsame}};
X::Str::Match::x.^find_method('message').wrap: method {with %x{$language}<X::Str::Match::x> {self.&($_)} else {callsame}};
X::Str::Numeric.^find_method('message').wrap: method {with %x{$language}<X::Str::Numeric> {self.&($_)} else {callsame}};
X::Str::Sprintf::Directives::BadType.^find_method('message').wrap: method {with %x{$language}<X::Str::Sprintf::Directives::BadType> {self.&($_)} else {callsame}};
X::Str::Sprintf::Directives::Count.^find_method('message').wrap: method {with %x{$language}<X::Str::Sprintf::Directives::Count> {self.&($_)} else {callsame}};
X::Str::Sprintf::Directives::Unsupported.^find_method('message').wrap: method {with %x{$language}<X::Str::Sprintf::Directives::Unsupported> {self.&($_)} else {callsame}};
X::Str::Subst::Adverb.^find_method('message').wrap: method {with %x{$language}<X::Str::Subst::Adverb> {self.&($_)} else {callsame}};
X::Str::Trans::IllegalKey.^find_method('message').wrap: method {with %x{$language}<X::Str::Trans::IllegalKey> {self.&($_)} else {callsame}};
X::Str::Trans::InvalidArg.^find_method('message').wrap: method {with %x{$language}<X::Str::Trans::InvalidArg> {self.&($_)} else {callsame}};
X::Subscript::Negative.^find_method('message').wrap: method {with %x{$language}<X::Subscript::Negative> {self.&($_)} else {callsame}};
X::Syntax::AddCategorical::TooFewParts.^find_method('message').wrap: method {with %x{$language}<X::Syntax::AddCategorical::TooFewParts> {self.&($_)} else {callsame}};
X::Syntax::AddCategorical::TooManyParts.^find_method('message').wrap: method {with %x{$language}<X::Syntax::AddCategorical::TooManyParts> {self.&($_)} else {callsame}};
X::Syntax::Adverb.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Adverb> {self.&($_)} else {callsame}};
X::Syntax::Argument::MOPMacro.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Argument::MOPMacro> {self.&($_)} else {callsame}};
X::Syntax::Augment::WithoutMonkeyTyping.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Augment::WithoutMonkeyTyping> {self.&($_)} else {callsame}};
X::Syntax::BlockGobbled.^find_method('message').wrap: method {with %x{$language}<X::Syntax::BlockGobbled> {self.&($_)} else {callsame}};
X::Syntax::CannotMeta.^find_method('message').wrap: method {with %x{$language}<X::Syntax::CannotMeta> {self.&($_)} else {callsame}};
X::Syntax::Coercer::TooComplex.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Coercer::TooComplex> {self.&($_)} else {callsame}};
X::Syntax::Comment::Embedded.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Comment::Embedded> {self.&($_)} else {callsame}};
X::Syntax::ConditionalOperator::PrecedenceTooLoose.^find_method('message').wrap: method {with %x{$language}<X::Syntax::ConditionalOperator::PrecedenceTooLoose> {self.&($_)} else {callsame}};
X::Syntax::ConditionalOperator::SecondPartGobbled.^find_method('message').wrap: method {with %x{$language}<X::Syntax::ConditionalOperator::SecondPartGobbled> {self.&($_)} else {callsame}};
X::Syntax::ConditionalOperator::SecondPartInvalid.^find_method('message').wrap: method {with %x{$language}<X::Syntax::ConditionalOperator::SecondPartInvalid> {self.&($_)} else {callsame}};
X::Syntax::Confused.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Confused> {self.&($_)} else {callsame}};
X::Syntax::DuplicatedPrefix.^find_method('message').wrap: method {with %x{$language}<X::Syntax::DuplicatedPrefix> {self.&($_)} else {callsame}};
X::Syntax::Extension::Category.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Extension::Category> {self.&($_)} else {callsame}};
X::Syntax::Extension::Null.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Extension::Null> {self.&($_)} else {callsame}};
X::Syntax::Extension::SpecialForm.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Extension::SpecialForm> {self.&($_)} else {callsame}};
X::Syntax::Extension::TooComplex.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Extension::TooComplex> {self.&($_)} else {callsame}};
X::Syntax::InfixInTermPosition.^find_method('message').wrap: method {with %x{$language}<X::Syntax::InfixInTermPosition> {self.&($_)} else {callsame}};
X::Syntax::KeywordAsFunction.^find_method('message').wrap: method {with %x{$language}<X::Syntax::KeywordAsFunction> {self.&($_)} else {callsame}};
X::Syntax::Malformed.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Malformed> {self.&($_)} else {callsame}};
X::Syntax::Malformed::Elsif.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Malformed::Elsif> {self.&($_)} else {callsame}};
X::Syntax::Missing.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Missing> {self.&($_)} else {callsame}};
X::Syntax::Name::Null.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Name::Null> {self.&($_)} else {callsame}};
X::Syntax::NegatedPair.^find_method('message').wrap: method {with %x{$language}<X::Syntax::NegatedPair> {self.&($_)} else {callsame}};
X::Syntax::NoSelf.^find_method('message').wrap: method {with %x{$language}<X::Syntax::NoSelf> {self.&($_)} else {callsame}};
X::Syntax::NonAssociative.^find_method('message').wrap: method {with %x{$language}<X::Syntax::NonAssociative> {self.&($_)} else {callsame}};
X::Syntax::NonListAssociative.^find_method('message').wrap: method {with %x{$language}<X::Syntax::NonListAssociative> {self.&($_)} else {callsame}};
X::Syntax::Number::IllegalDecimal.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Number::IllegalDecimal> {self.&($_)} else {callsame}};
X::Syntax::Number::LiteralType.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Number::LiteralType> {self.&($_)} else {callsame}};
X::Syntax::Number::RadixOutOfRange.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Number::RadixOutOfRange> {self.&($_)} else {callsame}};
X::Syntax::P5.^find_method('message').wrap: method {with %x{$language}<X::Syntax::P5> {self.&($_)} else {callsame}};
X::Syntax::ParentAsHash.^find_method('message').wrap: method {with %x{$language}<X::Syntax::ParentAsHash> {self.&($_)} else {callsame}};
X::Syntax::Perl5Var.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Perl5Var> {self.&($_)} else {callsame}};
X::Syntax::Pod::DeclaratorLeading.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Pod::DeclaratorLeading> {self.&($_)} else {callsame}};
X::Syntax::Pod::DeclaratorTrailing.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Pod::DeclaratorTrailing> {self.&($_)} else {callsame}};
X::Syntax::Regex::Adverb.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::Adverb> {self.&($_)} else {callsame}};
X::Syntax::Regex::Alias::LongName.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::Alias::LongName> {self.&($_)} else {callsame}};
X::Syntax::Regex::MalformedRange.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::MalformedRange> {self.&($_)} else {callsame}};
X::Syntax::Regex::NonQuantifiable.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::NonQuantifiable> {self.&($_)} else {callsame}};
X::Syntax::Regex::NullRegex.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::NullRegex> {self.&($_)} else {callsame}};
X::Syntax::Regex::QuantifierValue.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::QuantifierValue> {self.&($_)} else {callsame}};
X::Syntax::Regex::SolitaryBacktrackControl.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::SolitaryBacktrackControl> {self.&($_)} else {callsame}};
X::Syntax::Regex::SolitaryQuantifier.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::SolitaryQuantifier> {self.&($_)} else {callsame}};
X::Syntax::Regex::SpacesInBareRange.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::SpacesInBareRange> {self.&($_)} else {callsame}};
X::Syntax::Regex::UnrecognizedMetachar.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::UnrecognizedMetachar> {self.&($_)} else {callsame}};
X::Syntax::Regex::UnrecognizedModifier.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::UnrecognizedModifier> {self.&($_)} else {callsame}};
X::Syntax::Regex::Unspace.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Regex::Unspace> {self.&($_)} else {callsame}};
X::Syntax::Reserved.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Reserved> {self.&($_)} else {callsame}};
X::Syntax::Self::WithoutObject.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Self::WithoutObject> {self.&($_)} else {callsame}};
X::Syntax::Signature::InvocantMarker.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Signature::InvocantMarker> {self.&($_)} else {callsame}};
X::Syntax::Signature::InvocantNotAllowed.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Signature::InvocantNotAllowed> {self.&($_)} else {callsame}};
X::Syntax::Term::MissingInitializer.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Term::MissingInitializer> {self.&($_)} else {callsame}};
X::Syntax::Type::Adverb.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Type::Adverb> {self.&($_)} else {callsame}};
X::Syntax::UnlessElse.^find_method('message').wrap: method {with %x{$language}<X::Syntax::UnlessElse> {self.&($_)} else {callsame}};
X::Syntax::Variable::BadType.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Variable::BadType> {self.&($_)} else {callsame}};
X::Syntax::Variable::ConflictingTypes.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Variable::ConflictingTypes> {self.&($_)} else {callsame}};
X::Syntax::Variable::IndirectDeclaration.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Variable::IndirectDeclaration> {self.&($_)} else {callsame}};
X::Syntax::Variable::Initializer.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Variable::Initializer> {self.&($_)} else {callsame}};
X::Syntax::Variable::Match.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Variable::Match> {self.&($_)} else {callsame}};
X::Syntax::Variable::MissingInitializer.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Variable::MissingInitializer> {self.&($_)} else {callsame}};
X::Syntax::Variable::Numeric.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Variable::Numeric> {self.&($_)} else {callsame}};
X::Syntax::Variable::Twigil.^find_method('message').wrap: method {with %x{$language}<X::Syntax::Variable::Twigil> {self.&($_)} else {callsame}};
X::Syntax::VirtualCall.^find_method('message').wrap: method {with %x{$language}<X::Syntax::VirtualCall> {self.&($_)} else {callsame}};
X::Syntax::WithoutElse.^find_method('message').wrap: method {with %x{$language}<X::Syntax::WithoutElse> {self.&($_)} else {callsame}};
X::Temporal::InvalidFormat.^find_method('message').wrap: method {with %x{$language}<X::Temporal::InvalidFormat> {self.&($_)} else {callsame}};
X::TooLateForREPR.^find_method('message').wrap: method {with %x{$language}<X::TooLateForREPR> {self.&($_)} else {callsame}};
X::TooManyDimensions.^find_method('message').wrap: method {with %x{$language}<X::TooManyDimensions> {self.&($_)} else {callsame}};
X::Trait::Invalid.^find_method('message').wrap: method {with %x{$language}<X::Trait::Invalid> {self.&($_)} else {callsame}};
X::Trait::NotOnNative.^find_method('message').wrap: method {with %x{$language}<X::Trait::NotOnNative> {self.&($_)} else {callsame}};
X::Trait::Scope.^find_method('message').wrap: method {with %x{$language}<X::Trait::Scope> {self.&($_)} else {callsame}};
X::Trait::Unknown.^find_method('message').wrap: method {with %x{$language}<X::Trait::Unknown> {self.&($_)} else {callsame}};
X::TypeCheck.^find_method('message').wrap: method {with %x{$language}<X::TypeCheck> {self.&($_)} else {callsame}};
X::TypeCheck::Argument.^find_method('message').wrap: method {with %x{$language}<X::TypeCheck::Argument> {self.&($_)} else {callsame}};
X::TypeCheck::Assignment.^find_method('message').wrap: method {with %x{$language}<X::TypeCheck::Assignment> {self.&($_)} else {callsame}};
X::TypeCheck::Binding.^find_method('message').wrap: method {with %x{$language}<X::TypeCheck::Binding> {self.&($_)} else {callsame}};
X::TypeCheck::Binding::Parameter.^find_method('message').wrap: method {with %x{$language}<X::TypeCheck::Binding::Parameter> {self.&($_)} else {callsame}};
X::TypeCheck::Return.^find_method('message').wrap: method {with %x{$language}<X::TypeCheck::Return> {self.&($_)} else {callsame}};
X::Undeclared.^find_method('message').wrap: method {with %x{$language}<X::Undeclared> {self.&($_)} else {callsame}};
X::Undeclared::Symbols.^find_method('message').wrap: method {with %x{$language}<X::Undeclared::Symbols> {self.&($_)} else {callsame}};
X::UnitScope::Invalid.^find_method('message').wrap: method {with %x{$language}<X::UnitScope::Invalid> {self.&($_)} else {callsame}};
X::UnitScope::TooLate.^find_method('message').wrap: method {with %x{$language}<X::UnitScope::TooLate> {self.&($_)} else {callsame}};
X::Value::Dynamic.^find_method('message').wrap: method {with %x{$language}<X::Value::Dynamic> {self.&($_)} else {callsame}};
X::WheneverOutOfScope.^find_method('message').wrap: method {with %x{$language}<X::WheneverOutOfScope> {self.&($_)} else {callsame}};
X::Worry::P5::BackReference.^find_method('message').wrap: method {with %x{$language}<X::Worry::P5::BackReference> {self.&($_)} else {callsame}};
X::Worry::P5::LeadingZero.^find_method('message').wrap: method {with %x{$language}<X::Worry::P5::LeadingZero> {self.&($_)} else {callsame}};
X::Worry::P5::Reference.^find_method('message').wrap: method {with %x{$language}<X::Worry::P5::Reference> {self.&($_)} else {callsame}};
X::Worry::Precedence::Range.^find_method('message').wrap: method {with %x{$language}<X::Worry::Precedence::Range> {self.&($_)} else {callsame}};