Introduction
================
Gaston Sanchez

> ### Learning Objectives
> 
>   - Introduction to GNU Make
>   - Understand: target, dependency, and rule concepts
>   - Write simple makefile scripts
>   - Makefile for markdown with pandoc

-----

### GNU Make

[GNU Make](https://www.gnu.org/software/make/), commonly known as
**make**, is a Unix tool that is part of the [GNU
Project](https://www.gnu.org/software/).

Make is a “tool which controls the generation of executables and other
non-source files of a program from the program’s source files.”

To work with Make you write a text file with the name `Makefile`,
typically referred to as the *makefile*.

A makefile is formed with **rules** that have the following structure:

``` make
target: dependencies ...
    commands
    ...
```

A **rule** tells Make how to execute a series of commands in order to
build a **target** file from source files (i.e. the **dependencies**).
Notice that the recipe line(s) must be indented with a TAB and not with
any spaces.

Under its most basic form, a rule usually has this structure:

``` make
target: dependency
    command
```

For instance, let’s say you want to generate an html document
`output.html` from a source markdown file `input.md`, generated with
[pandoc](http://pandoc.org/). The Make rule in this case would be:

``` make
# from markdown to html
output.html: input.md
    pandoc input.md -s -o output.html
```

  - the first line is a comment (comments are defined with `#`)

  - `output.html` is the target file

  - `input.md` is the dependency

  - `pandoc input.md -s -o output.html` is the command to build the
    target

You can have a directory `make-test/` containing the source file
`input.md` and the makefile `Makefile`:

    make-test/
        input.md
        Makefile

Assuming that you are inside the directory `make-test`, in order to
build the target file `output.html`, you simply call `make` from the
command line:

``` bash
make
```

The very first time you run `make`, you should be able to see in the
command line the command that was executed:

    pandoc input.md -s -o output.html

If everything went okay, you should be able to see the generated output
file `output.html`.

Every time you make changes to the input file, you can run `make` again
to build a new version of `output.html`.

Once `output.html` is built, if you run `make` again—without new changes
made in `input.md`—Make will display a message like this one:

    make: `output.html' is up to date.

This indicates that the timestamps of `input.md` and `output.html` are
the same; which means there’s nothing new to be built. In other words,
Make will do nothing if nothing needs to be done.

See the files in `01-minimal/` inside the `examples/` folder to play
with a minimal makefile.

-----

### Make documentation:

[What a rule looks
like](https://www.gnu.org/software/make/manual/html_node/Rule-Introduction.html#Rule-Introduction)

-----
