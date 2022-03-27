Automatic Variables in Make
================
Gaston Sanchez

> ### Learning Objectives
> 
>   - Make’s automatic variables
>   - Naming variables
>   - Using variables

-----

### Motivation

Let’s go back to the first example in `01-minimal/` where we have one
single source file `input.md` that `pandoc` converts into the html file
`output.html`:

``` make
# from markdown to html
output.html: input.md
    pandoc input.md -s -o output.html
```

The makefile contains one rule with one target file, one dependency, and
a recipe formed by one command.

This is a very simple example but it serves perfectly to illustrate the
use of a special type of *Make* variables called **automatic
variables**.

Notice that the string `output.html` appears in both the target, and
also in the command of the recipe. Likewise, the string `input.md`
appears in the prerequisite as well as in the command of the recipe.

To saving typing and start avoiding repetition, *Make* provides a
handful of special variables that you can use in a recipe. Here’s how we
can rewrite the rule in a more compact—but cryptic—way:

``` make
# from markdown to html
output.html: input.md
    pandoc $< -s -o $@
```

**What is happening?**. We replaced `input.md` with the variable `$<`,
and `output.html` with the variable `$@`. These weird looking variables
have the following meanings:

  - `$<` is the automatic variable whose value is the name of the first
    prerequisite.

  - `$@` is the automatic variable whose value is the name of the
    target.

### Automatic Variables

Automatic variables are variables that can only be used within the
recipe. These variables have values computed afresh for each rule that
is executed, based on the target and prerequisites of the rule.

Because they are variables, they all start with the dollar symbol `$`
followed by another character. Here’s a list with some of the most
common types of automatic variables:

  - `$@` the file name of the **target**

  - `$%` the target member name

  - `$<` the name of the **first prerequisite**

  - `$?` the names of all the prerequisites that are newer than the
    target

  - `$^` the names of all the prerequisites, with spaces between them.

As mentioned in *Make* manual, you cannot use automatic variables
“anywhere within the target list of a rule; they have no value there
and will expand to the empty string.”

### Example

Let’s check the `Makefile` of `04-dependent-targets/`. In this example
we create an html report of a regression analysis in R. There is one
main target `regression.html` that depends on a series of prerequisite
files:

``` make
all: regression.html

regression.html: report.md regression-model.md scatterplot.png
    pandoc report.md regression-model.md -s -o regression.html

scatterplot.png: regression-plot.R regression.RData
    Rscript regression-plot.R

regression-model.md: regression-model.R regression.RData
    Rscript regression-model.R

regression.RData: regression-data.R
    Rscript regression-data.R
```

How can we use automatic variables in this case? We can use `$<` to
replace the name of the first prerequisite in most rules. We can also
use `$@` in the rule that generates the html file. To make things more
interesting, we can also create a variable `reg` that takes the string
“regression”:

``` make
reg = regression

all: $(reg).html

$(reg).html: report.md $(reg)-model.md scatterplot.png
    pandoc report.md $(reg)-model.md -s -o $@

scatterplot.png: $(reg)-plot.R $(reg).RData
    Rscript $<

$(reg)-model.md: $(reg)-model.R $(reg).RData
    Rscript $<

$(reg).RData: $(reg)-data.R
    Rscript $<
```

-----

### Make documentation

[Automatic
Variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)

-----
