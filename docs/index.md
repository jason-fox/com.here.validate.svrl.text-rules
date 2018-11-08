The Spelling and Grammar Checker plug-in for DITA OT  is an  **extension**  of the base [DITA Validator](https://github.com/jason-fox/com.here.validate.svrl) which adds simple rule-based **spelling and grammar** validation for the text elements within DITA documents.

The plug-in supports three `transtypes`:

 - `auto-correct` - remove reported spelling and grammar errors from  a DITA document
 - `text-rules`  - create an error report in **Schematron Validation Report Language** (`SVRL`) format
 - `text-rules-echo` - display the results of an `SVRL` error report in a human-readable format

More information about `SVRL` can be found at [www.schematron.com](http://www.schematron.com/validators.html)

Most of the spell-checking rules are based on a list of [known typographical errors and faults](https://en.wikipedia.org/wiki/Wikipedia:Lists_of_common_misspellings), and the ruleset can be easily altered to include new constraints. Checking against a list of known errors means that no false positives should occur, but the existing list will never be fully comprehensive.