Variables in Make
================
Gaston Sanchez

> ### Learning Objectives
> 
>   - Introduction to Make’s variables
>   - Naming variables
>   - Using variables

-----

### Motivation

Consider the `Makefile` in example `03-various-targets/`:

``` make
# all
all: output.html output.tex output.txt

# from markdown to html
output.html: input.md
    pandoc input.md -s -o output.html

# from markdown to latex
output.tex: input.md
    pandoc input.md -s -o output.tex

# from markdown to reStructuredText
output.txt: input.md
    pandoc input.md -t rst -s -o output.txt
```

All of the target files share the same name `output` but with different
extensions. Likewise, all the rules require the same dependency
`input.md`.

One issue with this makefile is that it has a lot of repetition
(i.e. repeated names). And repetition is something you want to avoid
following the **DRY** motto: “Don’t Repeat Yourself.”

What if you decide that the name `output` is not really a good idea, and
instead you want to name the target files `report`? You would then need
to replace all the occurrences of `output` by `report`, right?

Or you could use *Make*’s variables.

### Make Variables

*Make* allows you to define variables, which are very convenient for
dealing with the type of “problem” considered above. And for many other
tasks.

A **variable** is a name defined in a makefile to represent a string of
text, called the variable’s **value**.

Variables can represent:

  - lists of file names
  - options to pass to compilers
  - programs to run
  - directories to look in for source files
  - directories to write output in
  - or anything else you can imagine

Variables are defined at the beginning of the `Makefile` by specifying
the name of the variable, followed by an assignment operator (`=` or
`:=`), and the variable’s value. Here’s an example of how you could
define a couple of variables:

``` make
# variables
data = dataset.csv
script = analysis.R
IMG = histogram.png
```

#### Naming variables

A variable name may be any sequence of characters not containing `:`,
`#`, `=`, or leading or trailing whitespace. However, variable names
containing characters other than letters, numbers, and underscores
should be avoided, as they may be given special meanings in the future.

**OK names:**

    objects
    var
    DIR
    SUBDIR

**Should be avoided:**

    objs1
    my_var
    123

**Invalid names:**

    objs#
    my=var
    SUB:DIR

It is traditional to use upper case letters in variable names, and most
users tend to define variables in this way. However, the documention of
the *Make* manual recommends “using lower case letters for variable
names that serve internal purposes in the makefile, and reserving upper
case for parameters that control implicit rules or for parameters that
the user should override with command options (see section Overriding
Variables).”

#### Using variables

After a variable has been defined, you can use it in the rest of the
makefile by writing a dollar sign followed by the name of the variable
in parentheses or braces: `$(data)` or `${data}` will reference
`dataset.csv`.

In other words, `$(data)` will be substituted with `dataset.csv` by
explicit request into targets, prerequisites, commands, and other parts
of the makefile.

### Example

Below is the content of the `Makefile` using two variables `IN` and
`OUT`. `IN` holds the value of the input file `input.md`, while `OUT`
holds the new name `report` of output file (with no extension).

``` make
# variables
IN = input.md
OUT = report

# phony targets
.PHONY: all clean

# all
all: $(OUT).html $(OUT).tex $(OUT).txt

# from markdown to html
$(OUT).html: $(IN)
    pandoc $(IN) -s -o $(OUT).html

# from markdown to latex
$(OUT).tex: $(IN)
    pandoc $(IN) -s -o $(OUT).tex

# from markdown to reStructuredText
$(OUT).txt: $(IN)
    pandoc $(IN) -t rst -s -o $(OUT).txt

# clean outputs
clean:
    rm -rf $(OUT).*
```

There is still some amount of repetition in the makefile, but by using
variables we have gained a little bit of efficiency. Next time we decide
to rename `report` with a different name, we only need to make one
change: modify the variable `OUT` at the top of the `Makefile`.

Likewise, if we decide to rename `input.md` with a new name, we just
need to modify the value of the variable `IN`.

-----

### Make Documentation

[Variables
Simplify](https://www.gnu.org/software/make/manual/html_node/Variables-Simplify.html#Variables-Simplify)

-----
