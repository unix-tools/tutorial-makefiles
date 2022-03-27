Phony Targets
================
Gaston Sanchez

> ### Learning Objectives
> 
>   - Understand Phony targets
>   - Declaring phony targets
>   - Introducing the phony target `clean`

-----

### Phony Targets

By default, Makefile targets are **file targets**, that is, targets are
used to build files from other files—the dependencies. This implies that
*Make* assumes the target of a rule is a file.

There are occasions, however, when a given target is not really a file,
but simply the name of a recipe (i.e. an action to be performed). One
example is the `all` target like the one in `03-various-targets/`. The
associate `Makefile` is:

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

The first target `all` is not the name of a file; it is simply a
convenient “label” to indicate a series of dependencies. This type of
target is known in *Make* terminology as a **phony** target.

In fact, *Make* has several special targets. One special class of
targets are **Phony** targets: *phony* meaning “not real” or “fake.”

A phony target is “not real” in the sense that it’s not really the name
of a file; rather it is just a name for a recipe to be executed when you
make an explicit request.

### Declaring phony targets

To declare a phony target, you have to explicitly declare the target to
be phony by making it a prerequisite of the special target `.PHONY` as
follows:

``` make
# declaring phony target
.PHONY: all

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

Declaration of phony targets is important because of two main reasons:

1.  to avoid a conflict with a file of the same name, and

2.  to improve performance

Confusion may be caused when the name of an existing file is used as the
name of a phony target. In such a case *Make* will be confused because
the target would be associated with this file, and *Make* will only run
it when the file doesn’t appear to be up-to-date with regards to its
dependencies.

### The `clean` phony target

One very common phony target is the so-called `clean` target. This
target appears in many makefiles to indicate a recipe for “cleaning” a
directory from secondary files typically generated after some
compilation process.

Likewise, the `clean` target is also commonly used to remove output
files. A related example can be found in `06-phony-targets`. It is
essentially the same example as in `03-various-targets`, but this time
we are explicitly declaring phony targets:

``` make
# phony targets
.PHONY: all clean

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

# remove output files
clean:
    rm -f output.*
```

Besides the `all` target, there is now another phony target: `clean`.
Note that the `rm -f` command does not create a file named `clean`. The
`-f` flag is used to avoid displaying a diagnostic or error message if
the `output.*` files do not exists.

Also note that `clean` has no dependencies. Therefore, the target
`clean` will be always out-of-date. So whenever you run `make clean`, it
will run independent from the state of the file system.

-----

### Make Documentation

[Phony
Targets](https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html#Phony-Targets)

-----
