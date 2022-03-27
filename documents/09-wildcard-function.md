Wildcards in Make
================
Gaston Sanchez

> ### Learning Objectives
> 
>   - Meet Make’s wildcards
>   - Use the `wildcard` function
>   - Declare variables using wildcards

-----

### Motivation

A typical situation occurs when you have several files with similar
names and/or similar extensions, and you need to refer to them in a
makefile. More precisely, you need to get a list with all their names.

Say you have a directory `scripts/` with a bunch of R script files:

    scripts/ 
        script1.R
        script2.R
        script3.R
        script4.R

If you are working in the shell, you can easily refer to the R script
files using some wildcard like: `script*.R` or `script*` or simply
`*.R`.

You can also use the wildcard `*` in *Make*. For instance, you could
have the following dummy `Makefile` inside the folder `scripts/` that
would list the `.R` files every time you execute it:

``` make
list:
    ls *.R
```

In this case, the asterisk `*` is used in the recipe of the rule.

But what if you want to define a *Make* variable containing all these R
files? A natural impulse would be to do something like this:

``` make
# variable for R scripts
rfiles = *.R

list:
    ls $(rfiles)
```

This works fine because the command `ls` accepts wildcards. But there is
a catch.

Remember that a *Make* variable represents a string of text. This
implies that the variable `rfiles` defined above has the value `*.R`.
You can even tell *Make* to display the value of `rfiles` using `echo`:

``` make
# variable for R scripts
rfiles = *.R

list:
    echo $(rfiles)
```

**Caution:** the value of `rfiles` is NOT a list with the names
`script1.R, ..., script4.R`. Instead, its value is just the string `*.R`

## `wildcard` function

To create a variable `rfiles` that actually gathers the names of the R
files, you need to use a special function in *Make* called the
`wildcard` function:

``` make
rfiles = $(wildcard *.R)

list:
    echo $(rfiles)
```

To use the `wildcard` function you need to call it as a variable:

    $(wildcard pattern)

where `pattern` is any pattern that you want *wildcard* to match.

### Example

Let’s go back to the `02-various-dependencies/` example that has these
files:

    02-various-dependencies/
        first.md
        second.md
        third.md
        Makefile

All the markdown files—`first.md second.md third.md`— are used to
generate the file `output.html` via `pandoc`, and the *Makefile* looks
like this:

``` make
output.html: first.md second.md third.md
    pandoc first.md second.md third.md -s -o output.html
```

This is a perfect example to put in practice the use of the *wildcard*
function. You can write a `Makefile` with a variable `mds` whose value
is the list of `.md` files:

``` make
mds = $(wildcard *.md)

output.html: $(mds)
    pandoc $(mds) -s -o output.html
```

In this case, `mds` is actually a string with the list of names:
`first.md second.md third.md`. And we can use it in both the dependency
of the rule, as well as in the recipe (i.e. the command).

Notice that `pandoc` can also take wildcards. This means that you could
also have the following makefile, and it would work okay:

``` make
mds = *.md

output.html: $(mds)
    pandoc $(mds) -s -o output.html
```

But it’s important to note that the variable `mds`, defined without
using the *wildcard* function, has a value of `*.md` (not the names of
the `.md` files).

-----
