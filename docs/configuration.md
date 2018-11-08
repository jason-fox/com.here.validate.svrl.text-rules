Internationalization
--------------------

The spelling and grammar checker currently supports three languages:

* `en` - English
* `de` - German
* `fr` - French

The language checked is based on the `default.language` setting of the DITA Open toolkit. This can be modified in the `lib/configuration.properties` file.

> Please note that error messages have **not** been internationalized into French and currently all error messages will be displayed in English.

Sample lists of duplicated and mis-spelt words are available in all three languages.
Grammar and punctuation lists have only been supplied for `en`.

Additional languages can be added by creating a new language folder and files under `cfg/dictionary`

Adding new mis-spellings to the plug-in
---------------------------------------

The list of misspelt words to check when spell-checking can be altered by amending entries in the xml files under `cfg/dictionary`. The plug-in recognizes four types of errors:

* **duplicates.xml** - Duplicated words.
* **grammar.xml** - Grammar errors (includes a ban on the use of contractions in formal text )
* **punctuation.xml** - Punctuation marks (includes a ban on smart quotes).
* **spelling.xml** - Spelling mistakes

Each entry takes the form of a pair


```xml
<entry>
    <mistake>accessable</mistake>
    <corrected>accessible</corrected>
</entry>
<entry>
    <mistake>acident</mistake>
    <corrected>accident</corrected>
</entry>
<entry>
    <mistake>accidentaly</mistake>
    <corrected>accidentally</corrected>
</entry>
```


Altering the severity of a validator rule
-----------------------------------------

The severity of a validator rule can be altered by amending entries in the `cfg/ruleset/default.xml`  file The plug-in supports four severity levels:

* **FATAL** - Fatal rules will fail validation and cannot be overridden.
* **ERROR** - Error rules will fail validation. Errors can be overridden as described above.
* **WARNING** - Warning rules will display a warning on validation, but do not fail the validation. Warnings can also be individually overridden.
* **INACTIVE** - Inactive rules are not applied.

A custom ruleset file can be passed into the plug-in using the `text-rules.ruleset.file` parameter


```console
PATH_TO_DITA_OT/bin/dita -f text-rules-echo -i document.ditamap --text-rules.ruleset.file=PATH_TO_CUSTOM/ruleset.xml
```

Ignoring Validator Rules
------------------------

### Removing a rule globally

Rules can be made inactive by altering the severity (see above).  Alternatively a rule can be commented out in the XSL configuration file.

### Ignoring a rule throughout a document

Individual rules can be ignored by passing the `args.validate.ignore.rules` parameter to the command line. The value of the parameter should be a comma-delimited list of each `rule-id` to ignore.

For example to ignore the `latin-abbreviation` validation rule within a document you would run:

```console
PATH_TO_DITA_OT/dita -f text-rules-echo -i document.ditamap -Dargs.validate.ignore.rules=latin-abbreviation
```

### Ignoring a specific instance of a rule

Specific instances of a rule can be ignored by adding a comment within the `*.dita` file. The comment should start with `ignore-rule` and needs to be added at the location where the error is flagged.

```xml
<!--
    This is an example of a spelling mistake
-->
<p>
    <!-- ignore-rule:incorrect-spelling -->
    I have deliberately misspelt the word accidentaly (sic) - it should be written with a double l.
</p>
```

### Ignoring all warnings/errors within a block of text

* A block of DITA can be excluded from firing all rules at **WARNING** level by adding the comment `ignore-all-warnings` to the block.

* A block of DITA can be excluded from firing all rules at **ERROR** level by adding the comment `ignore-all-errors` to the block.

* Rules set at **FATAL** level cannot be ignored.