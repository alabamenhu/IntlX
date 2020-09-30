# Intl::X

Raku can be a very welcoming language. 
One of its strongest features has nothing to do with the language itself, but the fact that 
confusing error messages are considered a bug in Rakudo, its primary compiler.
  
Nonetheless, not everyone speaks English exceptionally well, and sometimes it can be nice to get errors and warnings reported back in someone's native language.
If a user wants to report the message on an international forum where English is generally spoken, in the future the `.message` will (unlike in English) report the name of the exception type.

[//]: # "[Unrendered_BEGIN_LOCALIZATION_LIST"

The following localization is currently available:

  * Asturian (25% complete, by Matthew Stuckwisch)
  * Spanish (1% complete, by Matthew Stuckwisch)
  * Mandarin (Taiwan) (1% complete, by Perry Thompson)
  
There are other localizations in progress:

  * Portuguese (European)
  
[//]: # "[Unrendered_END_LOCALIZATION_LIST"


## How to help localize Rakudo

Localization does require some basic knowledge of the Raku language, although deep knowledge is not required.
Take the `template.rakumod` file from the `resources` directory, open it up on a good IDE like Comma and follow the instructions.
An IDE or other syntax-highlighting program is particularly helpful, as the template file makes extensive use of commenting.

In the event that exceptions messages are changed, the `update-translation.raku` script will change the status of a translation to `UPDATE`.
If new exceptions are added, the script will autopopulate the translation with the new ones and an initial status of `TO DO`.

Eventually, a localization roast will be made, but at the moment is not available.

### Example (.message)

You will see in the file something like 

```raku
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
```

This lets us know what the class is and the original Raku code.  
In most cases, the code is very simple, other times, it may be more complex.
All you need to do is adjust bits that contain text, but don't be afraid to move stuff around if it makes sense for your language.
After translating the above for Asturian, the above looked like:

```raku
# Class:  X::Parameter::InvalidType
# Status: COMPLETE
# Original Code:
#        my $msg := "Invalid typename '$.typename' in parameter declaration.";
#        if +@.suggestions > 0 {
#            $msg := $msg ~ " Did you mean '" ~ @.suggestions.join("', '") ~ "'?";
#        }
#        $msg.naive-word-wrapper

'X::Parameter::InvalidType' => method {
        my $msg := "Nome de tipu inválidu '$.typename' nuna declaración de parámetru.";
        if +@.suggestions > 0 {
            $msg := $msg ~ " ¿Quixisti dicir '" ~ @.suggestions.join("', '") ~ "'?";
        }
        $msg.naive-word-wrapper
},
```

The status can really be anything you want.
This enables you to say, e.g., `COMPLETE (but dobule check)` or similar.
For stats purposes, it will count as translated, and the updater script will preserve it.
Don't adjust the contents of `Original Code`, however, because that is used to compare with newer copies of `Exceptions.pm6` and alert you to potential changes.
Only change the contents of the method -- **I'm lazy** and various scripts depend on the `'X::Type' => method {` header and `},` footer being exactly as they are.

Every method that uses a private variable (`$!foo`) *must* be handled according to the translation notes or else your file will not compile.
As a result, if you use the template file directly, you will likely get the following error:

    Cannot find method 'EXISTS-KEY' on 'BOOTHash': no method cache and no .^find_method

When in doubt, simply try to use `raku xx.pm6` (where xx is your language code). 
Fix anything it says. 
Probably the translation notes near the error line number will explain what you need to do. 

Lastly, wherever `naive-word-wrapper` is used, you may experience errors if your version of Rakudo does not include it.
I am working to include a stable workaround for earlier versions.

## Translation notes

Because exception messages are generated using code, sometimes there are difficulties because of private methods or rigidity of available values.
In these cases, a translation note will be provided to aid translation.
For example, private subs/methods are provided through `Intl::X::Support`, but may require a slightly different syntax which is illustrated in the notes.

To provide language-specific guidance (for reference by future translators), simply use comments in the method block, as these are preserved throughout processing.

## Resource scripts

In the resources folder there are several scripts which are potentially useful:

  - **generate-template.raku**  
  Parses `Exception.pm6` and translation notes to create `template.rakumod`
  - **template.rakumod**  
  This is the initial template that all languages should work from.
  - **update-X-file.raku**  
  Detects all exceptions in `Exception.pm6` and creates the wrap code in `X.pm6` for them.
  - **update-translation.raku**
  Updates a translation file by integrating new translation notes and noting where the content of `Exception.pm6` has changed and thus requires revision.
  - **translation-stats.raku**  
  For the curious, provides statistics on translation progress.  Use `-d` for details.
  - **clean-up-translation-notes.raku**  
  Just alphabetizes the translation notes and normalizes spacing.

## Questions?

Find me (guifa) on #raku

## To do
  - Add hooks for other modules
  - Create a better fallback system
  - Add more translations.  
    Want to help?  File an issue and let's get started.
    
## Licenses and credit

See the CREDITS file for a detailed list of translators.
The module code was written by Matthew Stephen Stuckwisch and is licensed under the Artistic License 2.0.
The support files include a executable version of webperl (Artistic License, by Hauke Daempfling) which itself includes a version of Rakudo (Artistic License 2.0, The Perl Foundation, the JS version being thanks in large part to Paweł Murias).
