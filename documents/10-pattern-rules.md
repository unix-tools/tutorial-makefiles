Pattern Rules
================
Gaston Sanchez

> ### Learning Objectives
> 
>   - Basics of pattern rules
>   - Using the `%` symbol
>   - Define targets and prerequisites with patterns

-----

### Motivation

In the previous lesson we considered the typical situation of having
several input files with the same extension: e.g. `script1.R`,
`script2.R`, `script3.R`, `script4.R`.

We are going to expand that example by going one step further. All the R
script files are in the folder example `10-pattern-rules/`. Now the goal
is to execute each of those files individually, by using the command `R
CMD BATCH --no-save`. For instance:

``` bash
R CMD BATCH --no-save script1.R
```

When you use `R CMD BATCH`, it creates by default an output file with
the same name of the input file, but with extension `.Rout`. So in this
case an output file `script1.Rout` will be generated.

So, how do you tell *Make* to run all the R files?

One naive option would be to do something like this:

``` make
.PHONY: all clean

all: script1.Rout script2.Rout script3.Rout script4.Rout

script1.Rout: script1.R
    R CMD BATCH --no-save script1.R

script2.Rout: script2.R
    R CMD BATCH --no-save script2.R

script3.Rout: script3.R
    R CMD BATCH --no-save script3.R

script4.Rout: script4.R
    R CMD BATCH --no-save script4.R

clean:
    rm -r *.Rout
```

Again, there’s a lot of repetition. We can start creating a variable
that holds the value for the R command `R CMD BATCH --no-save`. In
addition, we can use the automatic variable `$<` for the name of the
prerequisite in each recipe:

``` make
rcmd = R CMD BATCH --no-save

.PHONY: all clean

all: script1.Rout script2.Rout script3.Rout script4.Rout

script1.Rout: script1.R
    $(rcmd) $<

script2.Rout: script2.R
    $(rcmd) $<

script3.Rout: script3.R
    $(rcmd) $<

script4.Rout: script4.R
    $(rcmd) $<

clean:
    rm -f *.Rout
```

The variables `rcmd` and `$<` have helped us save some typing but still
there’s more that can be done.

## Using Pattern Rules

If you look at the rules, they all have a similar structure. Consider
the rule for the first script:

``` make
script1.Rout: script1.R
    R CMD BATCH --no-save script1.R
```

The target file has the same name of the input file, except for the
extension which is `.Rout`. In turn, the recipe consists of the command
`R CMD BATCH --no-save` applied to the prerequisite.

Wouldn’t be nice if you could write a generic rule based on such
pattern? Well, it turns out that you can\!

*Make* allows you to create pattern rules using the character `%`.
Here’s an example:

``` make
%.Rout: %.R
    $(rcmd) $<
```

The target file is expressed as `%.Rout`, while the prerequisite file is
expressed as `%.R`.

`%.R` is a **pattern**, and it matches any file name that ends in `.R`.
The substring that the `%` matches is called the **stem**.

`%` in a prerequisite of a pattern rule stands for the same stem that
was matched by the `%` in the target.

**How does the pattern rule work?** In order for the pattern rule to
apply, its target pattern must match the file name under consideration
and all of its prerequisites (after pattern substitution) must name
files that exist or can be made. These files become prerequisites of the
target.

Using pattern rules, we can rewrite the `Makefile` and get a compact
version like the following one:

``` make
rcmd = R CMD BATCH --no-save

.PHONY: all clean

all: script1.Rout script2.Rout script3.Rout script4.Rout

%.Rout: %.R
    $(rcmd) $<

clean:
    rm -f *.Rout
```

By writing just one single rule with the pattern `%.Rout: %.R`, *Make*
is able to apply this rule to all the R scripts.

Moreover, you can add more scripts—e.g. `script5.R`, `script6.R`, etc—
and the pattern rule will still apply for any number of R files.

As you can tell, pattern rules are very convenient, and are one of
*Make*’s features that saves you from defining some kind of loop that
iterates over many files.

-----

### Make Documentation

[Introduction to Pattern
Rules](https://www.gnu.org/software/make/manual/html_node/Pattern-Intro.html#Pattern-Intro)

-----
