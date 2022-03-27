Multiple Dependencies
================
Gaston Sanchez

> ### Learning Objectives
> 
>   - Rules with multiple dependencies
>   - Write a rule that takes various dependencies

-----

### Dependencies

In the introduction, we talked about the concept of Make rules, and we
described the conceptual structure of a rule:

``` make
target: dependencies ...
    commands
    ...
```

A **rule** tells Make how to execute a series of commands in order to
build a **target** file from source files (i.e. the **dependencies**)

Our first example was very simple, formed with one rule consisting of a
target file `output.html` and one dependency `input.md`

``` bash
output.html: input.md
    pandoc input.md -s -o output.html
```

### More than one dependency

Often, a target file will depend on several input files. For instance,
consider the example `02-various-dependencies/` in the folder
`examples/`

This example is about a banana bread recipe. There is one target
`output.html`, but now there are three dependencies: `first.md`,
`second.md`, and `third.md`.

We’ll use [pandoc](http://pandoc.org/) again to generate the html output
file. One of the nice things about pandoc is that you can pass any
number of input files and it will concatenate them to produce the
output:

    output.html: first.md second.md third.md
        pandoc first.md second.md third.md -s -o output.html

The pandoc command can actually be shorten using the asterisk wildcard
to indicate all the input files with extension `.md`:

    output.html: first.md second.md third.md
        pandoc *.md -s -o output.html

### How does it work?

When you have multiple dependencies in a rule, everytime there is a
change in any of the input files, running `make` will execute the
commands.

If all the dependency files are up-to-date, running `make` will do
nothing.

-----
