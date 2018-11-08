Spell-checking a document from the command line
-----------------------------------------------

A test document can be found within the plug-in at: `PATH_TO_DITA_OT/plugins/com.here.validate.svrl.text-rules/sample`

### Creating an SVRL file

To create an SVRL file with the spell-checker plug-in use the `text-rules` transform  with the `--args.validate.mode=report` parameter.

-  From a terminal prompt move to the directory holding the document to validate


-  SVRL file creation can be run like any other DITA-OT transform:

```console
PATH_TO_DITA_OT/bin/dita -f text-rules -o out -i document.ditamap --args.validate.mode=report
```

Once the command has run, an `SVRL` file is created:

```xml
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<svrl:schematron-output>
  <active-pattern role="dita" name="/incorrect-spelling.dita"/>
  <fired-rule context="common" role="grammar"/>
  <fired-rule context="default-lang" role="spelling"/>
  <failed-assert role="error" location="/topic/body[1]/section[2]/p[1]">
    <diagnostic-reference diagnostic="incorrect-spelling">
      Line 17: p - [incorrect-spelling]
      The word 'separate' is spelt incorrectly ('seperate') in the following text:

      Seperate accommodation can be found within the main building...
    </diagnostic-reference>
  </failed-assert>
  <fired-rule context="default-lang" role="grammar"/>
  <fired-rule context="english" role="grammar"/>
</svrl:schematron-output>
```

### Echoing results to the command line

To echo results to the command line with the spell-checker plug-in use the `text-rules` transform without specifying a `report`

-  Spell-checking (`text-rules`) can be run like any other DITA-OT transform:

```console
PATH_TO_DITA_OT/bin/dita -f text-rules -i document.ditamap
```

Once the command has run, all errors and warnings are echoed to the command line:

```console
[ERROR]  [/topics/incorrect-spelling.dita]
 Line 17: p - [incorrect-spelling]
The word 'separate' is spelt incorrectly ('seperate') in the following text:
Seperate accommodation can be found within the main building.
```

Additionally, if an error occurs, the command will fail

```console
[ERROR]  [/topics/incorrect-spelling.dita]
 Line 17: p - [incorrect-spelling]
The word 'separate' is spelt incorrectly ('seperate') in the following text:
Seperate accommodation can be found within the main building.
Found 1 Errors 0 Warnings
Error: [SVRL001F][FATAL] Error: Errors detected during validation
```

### Auto-correction from the command line

To auto-correct spelling mistakes with the spell-checker plug-in use the `auto-correct` transform.

-  Auto-correction (`auto-correct`) can be run like any other DITA-OT transform:

```console
PATH_TO_DITA_OT/bin/dita -f auto-correct -i document.ditamap
```

Once the command has run spelling mistakes will have been removed from the document.

> *Note:* The auto-correct `transtype` only removes spelling, duplicate and grammar errors specified in the dictionary files

### Parameter Reference


- `args.validate.ignore.rules` - Comma separated list of rule IDs to be ignored
- `args.validate.blacklist` - Comma separated list of words that should not be present in the running text
- `args.validate.cachefile` - Specifies the location of cache file to be used. Validation will only run across altered files if this parameter is present
- `args.validate.check.case` - Comma separated list of words which have a specified capitalization
- `args.validate.color` - When set, errors and warnings are Output highlighted using ANSI color codes
- `args.validate.mode` - Validation reporting mode. The following values are supported:
  - `strict`  - Outputs both warnings and errors. Fails on errors and warnings.
  - `default` - Outputs both warnings and errors. Fails on errors only
  - `lax`   - Ignores all warnings and outputs errors only. Fails on Errors only
  - `report`  - Creates an SVRL file
- `svrl.customization.dir` - Specifies the customization directory
- `svrl.filter.file` - Specifies the location of the XSL file used to filter the echo output. If this parameter is not present, the default echo output format will be used.
- `text-rules.ruleset.file` - Specifies severity of the rules to apply. If this parameter is not present, default severity levels will be used.


Spell-checking a document from the using ANT
--------------------------------------------

An ANT build file is supplied in the same directory as the sample document. The main target can be seen below:

```xml
<dirname property="dita.dir" file="PATH_TO_DITA_OT"/>
<property name="dita.exec" value="${dita.dir}/bin/dita"/>
<property name="args.input" value="PATH_TO_DITA_DOCUMENT/document.ditamap"/>

<target name="spell-check" description="spell-check a document">
  <!-- For Unix run the DITA executable-->
  <exec executable="${dita.exec}" osfamily="unix" failonerror="true">
    <arg value="-input"/>
    <arg value="${args.input}"/>
    <arg value="-output"/>
    <arg value="${dita.dir}/out/svrl"/>
    <arg value="-format"/>
    <arg value="text-rules-echo"/>
    <!-- validation transform specific parameters -->
    <arg value="--args.validate.blacklist=(kilo)?metre|colour|teh|seperate"/>
    <arg value="--args.validate.check.case=Bluetooth|HTTP[S]? |IoT|JSON|Java|Javadoc|JavaScript|XML"/>
    <arg value="--args.validate.color=true"/>
  </exec>
  <!-- For Windows run from a DOS command -->
  <exec dir="${dita.dir}/bin" executable="cmd" osfamily="windows" failonerror="true">
    <arg value="/C"/>
    <arg value="dita -input ${args.input} -output ${dita.dir}/out/svrl -format text-rules-echo --args.validate.blacklist=&quot;(kilo)?metre|colour|teh|seperate&quot; --args.validate.check.case=&quot;Bluetooth|HTTP[S]? |IoT|JSON|Java|Javadoc|JavaScript|XML&quot;"/>
  </exec>
</target>
```
