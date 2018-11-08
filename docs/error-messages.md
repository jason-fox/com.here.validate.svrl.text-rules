
Sample Document
===============

A sample document can be found within the plug-in which can used to test plug-in rules. The document covers both positive and negative test cases. The sample document contains valid DITA which can be built as an HTML or as a PDF document - please use the `html` or `pdf` transform to read the contents or examine the `*.dita` files directly.

A complete list of rules covered by the plug-in can be found below. The final `<chapters>` of the sample document contain a set of test DITA `<topics>`, each demonstrating a broken validation rule.

The `<topic>` files are sorted as follows:

- The base validation DITA-OT plugin (`com.here.validate.svrl`) -  this  `<chapter>` contains two common textual validation rules.
- The text-rules DITA-OT plugin (`com.here.validate.svrl.text-rules`) - This  `<chapter>` contains a set of English language spelling and grammar rules.


Spell-checker Error Messages
============================

The following table list the spell-checker error messages by message ID.


|Message ID|Message|Corrective Action/Comment|
|----------|-------|-------------------------|
|a-followed-by-vowel|In the following text, change 'a' to 'an' where appropriate:|  In English, the general guideline is that the indefinite article in front of count nouns that begin with a vowel sound should be 'an'.|
|an-followed-by-consonant|In the following text, change 'an' to 'a' where appropriate:|In English, the general guideline is that the indefinite article in front of count nouns that begin with a consonant sound should be 'a'. |
|blacklisted-word|The word '\{word\}' is not allowed in the following text:|The indicated word has been banned from use. Rewrite the phrase using alternatives.|
|duplicated-punctuation|The punctuation mark '{char}' is duplicated in the following text:|The indicated punctuation mark is duplicated. Delete the duplicated punctuation mark.|
|duplicated-words|The word '\{word\}' is duplicated in the following text:|The indicated word is duplicated. Delete the duplicated word..|
|incorrect-capitalization|The word '\{word\}' is incorrectly capitalized in the following text:|The indicated word is not capitalized correctly. Fix the capitalization.|
|incorrect-grammar|The phrase '\{phrase\}' is grammatically incorrect in the following text:|The indicated phrase does not make sense. Rewrite the phrase using the correct grammar.|
|incorrect-punctuation|The punctuation mark '\{char\}' has been used incorrectly in the following text:|The indicated punctuation mark is non-standard. Replace with a corrected punctuation mark. |
|incorrect-spelling|The word '\{word\}' is a spelling mistake in the following text:|The indicated word is not spelled correctly. Fix the spelling. It is assumed that documentation follows US English spelling conventions. |
|latin-abbreviation|The accronym i.e or e.g has been used in the following text:|Latin accronyms are difficult to understand. Consider rewriting the phrase using alternatives, such as "for example"|
|sentence-capitalization|The run on sentence in the following text does not start with a capital letter|The indicated sentence is not punctuated correctly. Fix the punctuation.|
|split-inifinitive|The phrase '\{phrase\}' is written using a split-infinitive in the following text:|The indicated sentence includes a split-infinitive, which is considered poor grammatical style - consider rephrasing the sentence. |
|where-not-were|The word 'were' has been used to start a subordinate clause in the following text:|The indicated sentence does not make sense. Rewrite the phrase using the correct grammar.|

