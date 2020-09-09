# Intl::X

Raku can be a very welcoming language. 
One of its strongest features has nothing to do with the language itself, but the fact that 
confusing error messages are considered a bug in Rakudo, its primary compiler.
  
Nonetheless, not everyone speaks English exceptionally well, and sometimes it can be nice to get errors and warnings reported back in someone's native language.
If a user wants to report the message on an international forum where English is generally spoken, in the future the `.message` will (unlike in English) report the name of the exception type.

## How to help localize Rakudo

Localization does require some basic knowledge of the Raku language, although deep knowledge is not required.
Take the `template.rakumod` file from the `resources` directory, open it up on a good IDE like Comma and follow the instructions.
An IDE or other syntax-highlighting program is particularly helpful, as the template file makes extensive use of commenting.

In the event that exceptions messages are changed, the `update-translation.raku` script will change the status of a translation to `UPDATE`.
If new exceptions are added, the script will autopopulate the translation with the new ones and an initial status of `TO DO`.

Eventually, a localization roast will be made, but at the moment is not available.

### Example (.message)

You will see in the file


## Translation notes

Because exception messages are generated using code, sometimes there are difficulties because of private methods or rigidity of available values.
In these cases, a translation note will be provided to aid translation.
For example, private subs/methods are provided through `Intl::X::Support`, but may require a slightly different syntax which is illustrated in the notes.

To provide language-specific guidance (for reference by future translators), simply use comments in the method block, as these are preserved throughout processing.

## Questions?

Find me (guifa) on #raku

## To do
  - Add hooks for other modules
  - Create a better fallback system
  - Add more translations.  
    Want to help?  File an issue and let's get started.