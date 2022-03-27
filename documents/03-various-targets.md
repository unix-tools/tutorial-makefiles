Multiple Targets
================
Gaston Sanchez

> ### Learning Objectives
> 
>   - Defining multiple targets
>   - Get to know the `all` target
>   - Write a Makefile with various targets

-----

### More than one target

So far we’ve been working with makefiles containing only one target:

``` make
target: dependencies ...
    commands
    ...
```

However, we can have multiple rules, each one with its own target:

``` make
target1: dependencies ...
    commands
    ...

target2: dependencies ...
    commands
    ...
```

### Example

Consider any of the first two examples (e.g. `01-minimal/` or
`02-various-dependencies/`). In these examples, there’s only one
generated output file: `output.html`.

We can use pandoc to create files in other formats rather than just
html. For example, here are three rules that take the same input file,
but produce outputs in different formats (html, latex, reStructuredText)

``` make
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

If you open the command line and run `make`, Make will execute just the
first target (this is the default behavior of Make).

To run a specific target, call the `make` command followed by the name
of the target you want to be generated. So, if you want to create the
latex file, here’s how to call `make`

``` bash
make output.tex
```

If you want to generate the *reStructuredText*:

``` bash
make output.txt
```

### The `all` target

When you have several output files (like in the example above),
sometimes you may want Make to execute them all without having to call
`make` on each single output.

To tell Make to run several rules, you can use the **all** target. This
is one of the special target names that Make recognizes and treats it in
a very specific way.

Here’s the content of a `Makefile` that includes an `all:` target as the
first rule. Because the target `all` is the first target, calling `make`
will execute this rule by default:

``` coffee
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

Note that the target `all` has three dependencies (i.e. the output
files), but has no associated command.

So how does Make know what to do with this rule? Well, Make takes the
dependencies, and then look at the rest of targets to see if they are
part of the `all`’s dependencies.

`all` is one of the standard targets in Make, and most users use it to
compile the entire program. When you use `all`, it should be the default
target.
