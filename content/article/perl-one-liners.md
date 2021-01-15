
  {
    "title"       : "Perl One-Liners",
    "authors"     : ["sundeep-agarwal"],
    "date"        : "2020-11-30T20:54:23",
<<<<<<< HEAD
    "tags"        : [one-liners],
=======
    "tags"        : [],
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
    "draft"       : true,
    "image"       : "",
    "thumbnail"   : "",
    "description" : "",
    "categories"  : "tutorials"
  }

<<<<<<< HEAD
A shell (like Bash) provides built-in commands and scripting features to easily solve and automate various tasks. External commands like grep, sed, Awk, sort, find, or parallel can be combined to work with each other. Sometimes you can use Perl either as a single replacement or a complement to them for specific use cases.

Perl is the most robust portable option for text processing needs. Perl has a feature rich regular expression engine, built-in functions, an extensive ecosystem, and is quite portable. However, Perl may have slower performance compared to specialized tools and can be more verbose.

## One-liners or scripts?

For assembly level testing of a DSP chip, I had to replicate the same scenario for multiple address ranges. My working knowledge of Linux command line was limited at that time and I didn't know how to use sed or Awk. I used Vim and Perl for all sorts of text processing needs.

I didn't know about Perl's options for one-liners, so I used to modify a script whenever I had to do search and replace for multiple files. Once, I even opened the files as Vim buffers and used `bufdo` to apply a command to all buffers to see if that would make my workflow simpler. If I had known about Perl one-liners, I could have easily combined find and Bash globs to make my life easier.

I can pass an argument to `-i` to create a backup of the original file
For example, `-i.bkp` will create *ip.txt.bkp* as the backup:

```bash
$ perl -i -pe 's/0xABCD;/0x1234;/; s/0xDEAD;/0xBEEF;/;' *.tests
```

I can also put the backups in another existing directory. The `*` gets expanded to original filename:

```bash
=======
This article discusses `perl` one-liner usage and where it shines compared to similar text processing tools.

## Why use Perl for one-liners?

I assume you are already familiar with use cases where command line is more productive compared to GUI. See also this series of articles titled [Unix as IDE](https://sanctum.geek.nz/arabesque/series/unix-as-ide/).

A shell utility like `bash` provides built-in commands and scripting features to easily solve and automate various tasks. External \*nix commands like `grep`, `sed`, `awk`, `sort`, `find`, `parallel`, etc can be combined to work with each other. Depending upon your familiarity with those tools, you can either use `perl` as a single replacement or complement them for specific use cases.

The selling point of `perl` over tools like `grep`, `sed` and `awk` includes feature rich regular expression engine, built-in functions, extensive ecosystem and portability. Disadvantages include slower performance for most features that are supported out of the box by those tools and verbosity.

See also [unix.stackexchange: when to use grep, sed, awk, perl, etc](https://unix.stackexchange.com/questions/303044/when-to-use-grep-less-awk-sed).

## Why use one-liners instead of scripts?

Some tasks need just a few lines of code. For assembly level testing of a DSP chip, I had to replicate same scenario for multiple address ranges. My working knowledge of Linux command line was limited at that time and I didn't know how to use `sed` or `awk`. I used `vim` and `perl` for all sorts of text processing needs. I didn't know about `perl` options for one-liners, so I used to modify a script whenever I had to do search and replace for multiple files. Once, I even opened the files as `vim` buffers and used `bufdo` to see if that'd make my workflow simpler. If I had known about `sed` or `perl` one-liners, I could have easily combined `find` and/or `bash` globs and made my life easier.

```bash
$ perl -i -pe 's/0xABCD;/0x1234;/; s/0xDEAD;/0xBEEF;/;' *.tests

# you can pass an argument to -i to create backup of the original file
# for ex: -i.bkp for a filename ip.txt will create ip.txt.bkp as the backup
# you can also put the backups in another existing directory
# * gets expanded to original filename
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
$ mkdir backups
$ perl -i'backups/*' -pe 's/SEARCH/REPLACE/g' *.txt
```

<<<<<<< HEAD
## Powerful regexp features

Perl regexps are much more powerful than either basic or extended regular expressions used by utilities. The common features I often use are non-greedy and possessive quantifiers, lookarounds, the `e` flag, subexpression calls, and `(*SKIP)(*FAIL)`. Here are some examples from StackOverflow threads that I have answered over the years.

### Skip some matches

This question needed [to convert avr-asm to arm-gnu comments](https://stackoverflow.com/questions/64368280/sed-script-to-convert-avr-asm-to-arm-gnu-comments). The starting file looks like this:

```bash
ABC r1,';'
ABC r1,";" ; comment
  ;;;
```

I need to change `;` to `@`, but don't change `;` within single or double quotes. I match those in the first branch of the alternation and use `(*SKIP)(*F)` to not replace those (I wish it had a shorter syntax, like `(*SF)`):

```
=======
See [Perl Command-Line Options](https://www.perl.com/pub/2004/08/09/commandline.html/) article by Dave Cross for an introduction to Perl cli options.

## Powerful regexp features

Perl regexp is much more powerful compared to Basic/Extended regular expressions that are used by utilities like `grep/sed/awk`. There's just too many differences to list here. The common features I often use are non-greedy and possessive quantifiers, lookarounds, `e` flag, subexpression call, `(*SKIP)(*FAIL)`, etc. Here's some examples from stackoverflow threads that I have answered over the years.

* [convert avr-asm to arm-gnu comments](https://stackoverflow.com/questions/64368280/sed-script-to-convert-avr-asm-to-arm-gnu-comments)

```bash
$ cat ip.txt
ABC r1,';'
ABC r1,";" ; comment
  ;;;

# change ; to @ but dont change ; within single or double quotes
# I wish (*SKIP)(*F) had a shorter syntax, for example (*SF)
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
$ perl -pe 's/(?:\x27;\x27|";")(*SKIP)(*F)|;/@/' ip.txt
ABC r1,';'
ABC r1,";" @ comment
  @;;
```

<<<<<<< HEAD
### Replace a string with an incrementing value

I can [replace string with incrementing value](https://stackoverflow.com/questions/42554684/shell-replace-string-with-incrementing-value). The `/e` on a substitution allows me to make the replacement side Perl code. Whatever the code evaluates to is the replacement. The can be a variable that I increment:

```bash
$ echo 'a | a | a | a | a | a | a | a' | perl -pe 's/ *\| */$i++/ge'
a0a1a2a3a4a5a6a
```

### Do some arithmetic

Add another `/e` to get `/ee` means there are two rounds of Perl code.
In [Arithmetic replacement in a text file](https://stackoverflow.com/questions/62241101/arithmetic-replacement-in-a-text-file), I need to find simple arithmetic, like `25100+10`, and replace that with its arithmetic result:

```
=======
* [replace string with incrementing value](https://stackoverflow.com/questions/42554684/shell-replace-string-with-incrementing-value)
* [arithmetic replacement in a text file](https://stackoverflow.com/questions/62241101/arithmetic-replacement-in-a-text-file)
* [reverse matched pattern](https://stackoverflow.com/questions/63681983/sed-reverse-matched-pattern)

```bash
# e flag allows Perl code in replacement section
$ echo 'a | a | a | a | a | a | a | a' | perl -pe 's/ *\| */$i++/ge'
a0a1a2a3a4a5a6a

$ cat ip.txt
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
id=25100+10
xyz=1+
abc=123456
conf_string=LMN,J,IP,25100+1,0,3,1
<<<<<<< HEAD
```

I can do that with one `/e` by matching the numbers and doing some Perl on the replacement side:

```
=======
# can also use: perl -pe 's/\d+\+\d+/$&/gee' ip.txt
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
$ perl -pe 's/(\d+)\+(\d+)/$1+$2/ge' ip.txt
id=25110
xyz=1+
abc=123456
conf_string=LMN,J,IP,25101,0,3,1
<<<<<<< HEAD
```

But instead of matching the number, I can match the whole expression. The match is in `$&`, so the first `/e` interpolates that to `25100+10`. The second round runs that as Perl, which is addition:

```
$ perl -pe 's/\d+\+\d+/$&/gee' ip.txt
```

## Handling the newline

Here's how you can perform multiline fixed string substitution with `perl`. Don't save contents of *search.txt* and *replace.txt* in shell variables—trailing newlines and ASCII NUL characters will cause issues. I want to un-hypenate this text:

```bash
=======

$ echo 'romarana:qwerty12543' | perl -pe 's/\d+$/reverse $&/e'
romarana:qwerty34521
```

Another common issue with BRE/ERE is escaping metacharacters. Here's how you can perform multiline fixed string substitution with `perl`. Don't save contents of `search.txt` and `replace.txt` in shell variables. Trailing newlines and ASCII NUL characters will cause issues. See [stackoverflow: pitfalls of reading file into shell variable](https://stackoverflow.com/questions/7427262/how-to-read-a-file-into-a-variable-in-shell/22607352#22607352) for details.

```bash
perl -0777 -ne '$#ARGV==1 ? $s=$_ : $#ARGV==0 ? $r=$_ :
                print s/\Q$s/$r/gr' search.txt replace.txt ip.txt
```

Unlike `grep/sed/awk`, the input record separator isn't removed by default.

```bash
$ cat msg.txt
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
Hello there.
It will rain to-
day. Have a safe
and pleasant jou-
rney.
<<<<<<< HEAD
```

In Awk this is easy. Set the record separator `RS` to nothing, then make all the substitutions:

```bash
$ awk 'BEGIN {RS=""}{gsub(/-\n/,"",$0); print $0}' test.txt
Hello there.
It will rain today. Have a safe
and pleasant journey.
```

In Perl, `-0777` does the same thing:

```
=======

# same as: awk -v RS='-\n' -v ORS= '1' msg.txt
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
$ perl -pe 's/-\n//' msg.txt
Hello there.
It will rain today. Have a safe
and pleasant journey.
```

<<<<<<< HEAD


#######################

```bash
perl -0777 -ne '$#ARGV==1 ? $s=$_ : $#ARGV==0 ? $r=$_ :
                print s/\Q$s/$r/gr' search.txt replace.txt ip.txt
```

Unlike grep, sed, or Awk, Perl doesn't remove the input record by default, so the last item has the newline. I have this
#######################


## Better regex support

Some other regex libraries have problems tied to whatever they use to implement them. GNU verions, for example, may have some bugs that other implementations may have. Which version you use can give different results. Perl, however, has the same bugs everywhere.

### Back references

There's a [problem with backreferences in glibc](https://sourceware.org/bugzilla/show_bug.cgi?id=25322) that I found and [reported for grep](https://debbugs.gnu.org/cgi/bugreport.cgi?bug=26864). This bug is seen in at least GNU implementations of grep and sed. As far as I know, no implementation of Awk supports backreferences within regexp definition.

I wanted to get words having two occurrences of repeated characters.
This example takes some time and results in no output

```bash
$ grep -m2 -xiE '([a-z]*([a-z])\2[a-z]*){2}' /usr/share/dict/words
```

It does work when nesting is unrolled or PCRE is used:

```bash
$ grep -m2 -xiE '[a-z]*([a-z])\1[a-z]*([a-z])\2[a-z]*' /usr/share/dict/words
Abbott
Annabelle
...
$ grep -m2 -xiP '([a-z]*([a-z])\2[a-z]*){2}' /usr/share/dict/words
Abbott
Annabelle
...
```

Here's the Perl, which is the original regex:

```bash
$ perl -ne 'print if /([a-z]*([a-z])\2[a-z]*){2}/' /usr/share/dict/words
Abbott
Annabelle
...
```

### Word boundaries

[Why doesn't this sed command replace the 3rd-to-last "and"?](https://unix.stackexchange.com/questions/579889/why-doesnt-this-sed-command-replace-the-3rd-to-last-and) shows another interesting bug when word boundaries and group repetition are involved. This bug is seen in anything using the regex stuff from glibc (as you would on Linux):

This incorrectly matches because there is no word boundary in the middle of "cocoa":

```bash
$ sed --version
sed (GNU sed) 4.4
$ echo 'cocoa' | sed -nE '/(\bco){2}/p'
cocoa
```

Without the quantifier, there's no problem and no matches:

```bash
$ echo 'cocoa' | sed -nE '/\bco\bco/p'
$ echo 'cocoa' | perl -ne 'print if /(\bco){2}/'
```

On the sed on macOS (which doesn't have a `--version`), there's no output, which is correct and differen:

```bash
$ echo 'cocoa' | sed -nE '/(\bco){2}/p'
```

This means that again you can't rely on sed across platforms.

Here's another example from Gnu sed. This modifies the line because it thinks it finds "it" as a separate word two times, but the second is really in the middle of "sit":

```bash
$ echo 'it line with it here sit too' | sed -E 's/with(.*\bit\b){2}/XYZ/'
it line XYZ too
```

Change the pattern to get rid of the quantifier and it works correctly:

```
=======
From [GNU grep manual](https://www.gnu.org/software/grep/manual/grep.html#Known-Bugs):

>many regular expression implementations have back-reference bugs that can cause programs to return incorrect answers or even crash, and fixing these bugs has often been low-priority: for example, as of 2020 the GNU C library bug database contained back-reference bugs [52](https://sourceware.org/bugzilla/show_bug.cgi?id=52), [10844](https://sourceware.org/bugzilla/show_bug.cgi?id=10844), [11053](https://sourceware.org/bugzilla/show_bug.cgi?id=11053), [24269](https://sourceware.org/bugzilla/show_bug.cgi?id=24269) and [25322](https://sourceware.org/bugzilla/show_bug.cgi?id=25322), with little sign of forthcoming fixes

Here's is a [backreferences and quantifier issue](https://debbugs.gnu.org/cgi/bugreport.cgi?bug=26864) that I found. This bug is seen `GNU` implementations of `grep/sed` (I don't know about other implementations). As far as I know, no implementation of `awk` supports backreferences within regexp definition.

```bash
# takes some time and results in no output
# aim is to get words having two occurrences of repeated characters
$ grep -m2 -xiE '([a-z]*([a-z])\2[a-z]*){2}' /usr/share/dict/words

# works when nesting is unrolled or PCRE is used
$ grep -m2 -xiE '[a-z]*([a-z])\1[a-z]*([a-z])\2[a-z]*' /usr/share/dict/words
Abbott
Annabelle
$ grep -m2 -xiP '([a-z]*([a-z])\2[a-z]*){2}' /usr/share/dict/words
Abbott
Annabelle
```

[unix.stackexchange: Why doesn't this sed command replace the 3rd-to-last "and"?](https://unix.stackexchange.com/questions/579889/why-doesnt-this-sed-command-replace-the-3rd-to-last-and) shows another interesting bug when word boundaries and group repetition are involved. This bug is seen all the `GNU` implementations of `grep/sed/awk`.

```bash
# wrong output
$ echo 'cocoa' | sed -nE '/(\bco){2}/p'
cocoa
# correct behavior, no output
$ echo 'cocoa' | sed -nE '/\bco\bco/p'
$ echo 'cocoa' | perl -ne 'print if /(\bco){2}/'

# wrong output, there's only 1 whole word 'it' after 'with'
$ echo 'it line with it here sit too' | sed -E 's/with(.*\bit\b){2}/XYZ/'
it line XYZ too
# correct behavior, input isn't modified
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
$ echo 'it line with it here sit too' | sed -E 's/with.*\bit\b.*\bit\b/XYZ/'
it line with it here sit too
$ echo 'it line with it here sit too' | perl -pe 's/with(.*\bit\b){2}/XYZ/'
it line with it here sit too
```

<<<<<<< HEAD
## Bigger library

Perl has a much bigger collection of built-in functions compared to Awk. For command-line usage, I often need `tr`, `join`, `map` and `grep`. Also, `sort` is much simpler to use in Perl compared to Awk, along with array/hash distinction. Here are some examples.

### Append items to a list

This problem wants to append columns to rows that have too few, like this where the `c` and `d` rows:

```bash
=======
## Standard library

Perl has a much bigger collection of built-in functions compared to `awk`. For cli usage, I often need `tr`, `join`, `map` and `grep`. Also, `sort` is much simpler to use in `perl` compared to `awk`, along with array/hash distinction. Here's some examples.

* [append zeros to list](https://stackoverflow.com/questions/49765879/append-zeros-to-list)

```bash
$ cat ip.txt
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
a,10,12,13
b,20,22
c,30
d,33
<<<<<<< HEAD
```

[This appends zeros to list](https://stackoverflow.com/questions/49765879/append-zeros-to-list) by using the `/e` again. This time, the Perl in the replacement counts the number of commas, and subtracts that from 3 to find out how many more columns it needs. The `x` is the string replication operator:

```
=======

>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
$ perl -pe 's|$|",0" x (3 - tr/,//)|e' ip.txt
a,10,12,13
b,20,22,0
c,30,0,0
d,33,0,0
```

<<<<<<< HEAD
### Reversing things

In [reverse complement DNA sequence for a specific field](https://stackoverflow.com/questions/45571828/execute-bash-command-inside-awk-and-print-command-output), I need to select part of the string, complement it, and turn it around:

```bash
ABC DEF GATTAG GHK
ABC DEF GGCGTC GHK
ABC DEF AATTCC GHK
```

Use the `tr` and `reverse` in the replacement side (with `/e` again):

```bash
=======
* [reverse complement DNA sequence for a specific field](https://stackoverflow.com/questions/45571828/execute-bash-command-inside-awk-and-print-command-output)

```bash
$ cat test.txt
ABC DEF GATTAG GHK
ABC DEF GGCGTC GHK
ABC DEF AATTCC GHK

# can also use: perl -lane '$F[2]=reverse $F[2]=~tr/ATGC/TACG/r; print "@F"'
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
$ perl -pe 's/^(\H+\h+){2}\K\H+/reverse $&=~tr|ATGC|TACG|r/e' test.txt
ABC DEF CTAATC GHK
ABC DEF GACGCC GHK
ABC DEF GGAATT GHK
```

<<<<<<< HEAD
With `-a`, it automatically splits on whitespace and puts the result in `@F`. Do the work on the right element then output `@F` again:

```bash
$ perl -lane '$F[2]=reverse $F[2]=~tr/ATGC/TACG/r; print "@F"'
ABC DEF CTAATC GHK
ABC DEF GACGCC GHK
ABC DEF GGAATT GHK
```

### Sort a CSV row

How about [sorting rows in csv file without header & first column](https://stackoverflow.com/questions/48920626/sort-rows-in-csv-file-without-header-first-column)? Assuming this is simple CSV like this:

```bash
id,h1,h2,h3,h4,h5,h6,h7
101,zebra,1,papa,4,dog,3,apple
102,2,yahoo,5,kangaroo,7,ape
```

This uses `-a` again, but also `-F` to make the record separator the comma:

```
=======
* [sort rows in csv file without header & first column](https://stackoverflow.com/questions/48920626/sort-rows-in-csv-file-without-header-first-column)

```bash
$ cat ip.txt
id,h1,h2,h3,h4,h5,h6,h7
101,zebra,1,papa,4,dog,3,apple
102,2,yahoo,5,kangaroo,7,ape

>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
$ perl -F, -lane 'print join ",", $.==1 ? @F : (shift @F, sort @F)' ip.txt
id,h1,h2,h3,h4,h5,h6,h7
101,1,3,4,apple,dog,papa,zebra
102,2,5,7,ape,kangaroo,yahoo
```

<<<<<<< HEAD
I use the `$.`, the input line number, to skip the first line (the header). In all other lines, I make a list of the first element of `@F` and the sorted list of the rest of the elements.

## Using Perl modules

Apart from built-in functions, Standard or CPAN modules come in handy too. Load those with `-M` and put the import list after a `=`:
=======
Apart from built-in functions, standard modules come in handy too.
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451

```bash
$ s='floor bat to dubious four'
$ echo "$s" | perl -MList::Util=shuffle -lanE 'say join ":", shuffle @F'
bat:four:dubious:floor:to

$ s='3,b,a,3,c,d,1,d,c,2,2,2,3,1,b'
$ echo "$s" | perl -MList::Util=uniq -F, -lanE 'say join ",", uniq @F'
3,b,a,c,d,1,2

$ s='123 aGVsbG8gd29ybGQK'
$ echo "$s" | perl -MMIME::Base64 -ane 'print decode_base64 $F[1]'
hello world
```

## CPAN

<<<<<<< HEAD
The Comprehensive Perl Archive Network ([CPAN](https://www.cpan.org)) has a huge collection of modules for various use cases.  Here are some examples.

### Extract IPv4 addresses

The [Regexp::Common](https://metacpan.org/pod/Regexp::Common) has shortcuts for common things you want to match. Here's some text with dotted-decimal IP addresses:

```bash
3.5.52.243 5.4.3 34242534.23.42.42
foo 234.233.54.123 baz 4.4.4.3
```

It's easy to extract the IPv4 addresses:

```
=======
The **Comprehensive Perl Archive Network** ([https://www.cpan.org](https://www.cpan.org)) has a huge collection of modules for various use cases. See also [Awesome Perl](https://github.com/hachiojipm/awesome-perl) for a curated list of awesome Perl5 frameworks, libraries and software. Here's some examples.

* Extract IPv4 addresses

```bash
$ cat ipv4.txt
3.5.52.243 5.4.3 34242534.23.42.42
foo 234.233.54.123 baz 4.4.4.3

>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
$ perl -MRegexp::Common=net -nE 'say $& while /$RE{net}{IPv4}/g' ipv4.txt
3.5.52.243
34.23.42.42
234.233.54.123
4.4.4.3
```

<<<<<<< HEAD
### Real CSV processing

Earlier I did some simple CSV procesing, but if I want to do it for real I can use [Text::CSV_XS](https://metacpan.org/pod/Text::CSV_XS) to make sure everything happens correctly. This one handles the quoted field `fox,42`:
=======
* Processing `csv` files
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451

```bash
$ s='eagle,"fox,42",bee,frog\n1,2,3,4'

# note that -n or -p option isn't used here
$ printf '%b' "$s" | perl -MText::CSV_XS -E 'say $row->[1]
                     while $row = Text::CSV_XS->new->getline(*ARGV)'
fox,42
2
```

<<<<<<< HEAD
### Processing XML

Processing XML files is another format that's easy to mess up. Many people try to do this with regex, but that can easily go wrong. Here's an example file:

```bash
=======
* Processing `xml` files. See also [grantm: Perl XML::LibXML by example](https://grantm.github.io/perl-libxml-by-example/) for a detailed book on `XML::LibXML` module.

```bash
$ cat sample.xml
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
<doc>
    <greeting type="ask">Hi there. How are you?</greeting>
    <greeting type="reply">I am good.</greeting>
    <color>
        <blue>flower</blue>
        <blue>sand stone</blue>
        <light-blue>sky</light-blue>
        <light-blue>water</light-blue>
    </color>
</doc>
<<<<<<< HEAD
```

The `xpath` (a Perl program) and `xmllint` but their output is annoying and hard to change:

```bash
$ xmllint --xpath '//blue/text()' test.xml
flowersand stone
brian@otter Desktop [3570]
$ xpath test.xml '//blue/text()'
Found 2 nodes:
-- NODE --
flower-- NODE --
sand stone
```

The [XML::LibXML](https://metacpan.org/pod/XML::LibXML) module can handle this easily because I'm in control:

```bash
$ perl -MXML::LibXML -E '
	$ip = XML::LibXML->load_xml(location => $ARGV[0]);
    say $_->to_literal() for $ip->findnodes("//blue")' sample.xml
=======

$ perl -MXML::LibXML -E '$ip = XML::LibXML->load_xml(location => $ARGV[0]);
        say $_->to_literal() for $ip->findnodes("//blue")' sample.xml
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
flower
sand stone
```

<<<<<<< HEAD

### Processing JSON

JSON files have the same issue. You don't want to do regexes on this:

```bash
$ s='{"greeting":"hi","marks":[78,62,93],"fruit":"apple"}'
```

Various JSON modules, such as [Cpanel::JSON::XS](http://metacpan.org/pod/Cpanel::JSON::XS) can handle this:

```
$ echo "$s" | perl -MCpanel::JSON::XS -0777 -E '$ip=decode_json <>;
              say join ":", @{$ip->{marks}}'
78:62:93
```

Sometimes it's easier to put that in a script (although that's not really a one-liner anymore):

```
=======
* Processing `json` files

```bash
$ s='{"greeting":"hi","marks":[78,62,93],"fruit":"apple"}'

$ echo "$s" | perl -MCpanel::JSON::XS -0777 -E '$ip=decode_json <>;
              say join ":", @{$ip->{marks}}'
78:62:93

>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
$ echo "$s" | cpanel_json_xs
{
   "fruit" : "apple",
   "greeting" : "hi",
   "marks" : [
      78,
      62,
      93
   ]
}
```

<<<<<<< HEAD
A non-Perl example of the same thing is [jq](https://stedolan.github.io/jq/), but that's something you have to install separately and might not be available:

```bash
$ echo $s | jq '.marks | join(":")'
"78:62:93"
```

## Other things to read

* [When to use grep, sed, Awk, Perl, etc](https://unix.stackexchange.com/questions/303044/when-to-use-grep-less-awk-sed)

* [Pitfalls of reading file into shell variable](https://stackoverflow.com/questions/7427262/how-to-read-a-file-into-a-variable-in-shell/22607352#22607352)

* Dave Cross's [Perl Command-Line Options](https://www.perl.com/pub/2004/08/09/commandline.html/)

* Known bugs in the [GNU grep manual](https://www.gnu.org/software/grep/manual/grep.html#Known-Bugs)

* [Awesome Perl](https://github.com/hachiojipm/awesome-perl) has a curated list of awesome Perl5 frameworks, libraries and software

* [Perl XML::LibXML by example](https://grantm.github.io/perl-libxml-by-example/) for a detailed book on `XML::LibXML` module

* [BSD/macOS sed vs GNU sed vs the POSIX sed specification](https://stackoverflow.com/questions/24275070/sed-not-giving-me-correct-substitute-operation-for-newline-with-mac-difference/24276470#24276470)

* [Differences between sed on Mac OSX and other standard sed](https://unix.stackexchange.com/questions/13711/differences-between-sed-on-mac-osx-and-other-standard-sed)

=======
## Portability

If Perl is available, it is the most robust portable option for text processing needs. POSIX specification can be used as a guide to write portable scripts that'd work well across platforms. Restricting to POSIX would mean forgoing handy extensions like `-i` option for `sed`. If you know an extension would be available, you may still have to deal with differences between implementations. For example, in-place modification without backups requires `-i` for `GNU sed` and `-i ''` for `BSD sed`. Visit the below links for a more detailed discussion about `sed` differences across platforms.

* [stackoverflow: BSD/macOS sed vs GNU sed vs the POSIX sed specification](https://stackoverflow.com/questions/24275070/sed-not-giving-me-correct-substitute-operation-for-newline-with-mac-difference/24276470#24276470)
* [unix.stackexchange: Differences between sed on Mac OSX and other standard sed](https://unix.stackexchange.com/questions/13711/differences-between-sed-on-mac-osx-and-other-standard-sed)

## Speed

Perl is usually slower, but performs better for certain cases of backreferences and quantifiers.

```bash
$ time LC_ALL=C grep -xE '([a-z]..)\1' /usr/share/dict/words > f1
real    0m0.135s

$ time perl -ne 'print if /^([a-z]..)\1$/' /usr/share/dict/words > f2
real    0m0.039s

$ time LC_ALL=C grep -xP '([a-z]..)\1' /usr/share/dict/words > f3
real    0m0.012s
```

Perl's hash implementation performs better compared to `awk` associative array. The `SCOWL-wl.txt` file used below was created using [app.aspell.net](http://app.aspell.net/create). `words.txt` is from `/usr/share/dict/words`.

```bash
$ wc -l words.txt SCOWL-wl.txt
  99171 words.txt
 662349 SCOWL-wl.txt
 761520 total

# finding common lines between two files
# shorter file passed as first argument here
$ time awk 'NR==FNR{a[$0]; next} $0 in a' words.txt SCOWL-wl.txt > t1
real    0m0.376s
$ time perl -ne 'if(!$#ARGV){$h{$_}=1; next}
                 print if exists $h{$_}' words.txt SCOWL-wl.txt > t2
real    0m0.284s

# longer file passed as first argument here
$ time awk 'NR==FNR{a[$0]; next} $0 in a' SCOWL-wl.txt words.txt > f1
real    0m0.603s
$ time perl -ne 'if(!$#ARGV){$h{$_}=1; next}
                 print if exists $h{$_}' SCOWL-wl.txt words.txt > f2
real    0m0.536s
```
>>>>>>> 0b7ed881e9bb3bac2e7636e859e74542d76ae451
