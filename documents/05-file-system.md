File System
================
Gaston Sanchez

> ### Learning Objectives
> 
>   - Working with files in various directories
>   - Identify relative path names
>   - Writing Makefiles with

-----

### Files in several directories

The examples covered so far have all the input and output files located
in one single directory. But this is rarely how most real projects are
structured.

In this lesson, we are going to discuss a toy example of an “article”
about the [R project](https://www.r-project.org/). All the directories
and files are in the example folder `05-file-system/` which has the
following structure:

    05-file-system/
        Makefile
        sections/
            01-intro.md
            02-environment.md
            03-logo.md
        images/
            Rlogo-old.png
            Rlogo-new.png

The idea is to generate an html file `R-project.html` (containing some
text about the R project), that is built with the `.md` files in
`sections/`.

To make things a bit more interesting, the generated output file will be
placed at the level of the parent directory (i.e. `05-file-system/`)

### Generating the html document

To generate the output `R-project.html` file from the 3 `.md` files, you
would have to `cd` into `sections/` and then run **pandoc** like so:

``` bash
pandoc *.md -s -o R-project.html
```

But remember that we want `R-project.html` to be at the parent level.
Assuming that you are inside `sections/`, you would need to `mv` the
output file `R-project.html` one level up:

``` bash
mv R-project.html ../
```

### The Makefile

How do you tell Make to switch between sub-directories and move files to
different locations? Very easy: using shell commands to navigate the
file system.

Here’s how the `Makefile` looks like:

``` make
all: R-project.html

R-project.html: sections/01-intro.md sections/02-environment.md sections/03-logo.md
    cd sections; pandoc *.md -s -o R-project.html
    cd sections; mv R-project.html ../
```

Important things to keep in mind: the `Makefile` lives at the top level.
All dependencies are in the `sections/` sub-directory.

  - `R-project.html` is the target file

  - The dependencies are the markdown files inside the `sections/`
    folder

  - The recipe involves two commands:
    
      - first we `cd` into `sections/` and then call `pandoc`
      - then we `cd` again into `sections/` and `mv` the target file one
        level up

All the commands for each rule have as a starting point the location
where the `Makefile` is. This is why we need to `cd` into `sections/` in
order to run pandoc.

Note the use of the semicolon in the command:

``` bash
cd sections; pandoc *.md -s -o R-project.html
```

the semicolon lets us group several related instructions in one single
line.

### Relative paths of image files

There is one last important detail that we need to mention. As you can
tell from the file structure, there is an `images/` folder. This is
where the PNG files of the R logos are located.

Those logos are used inside the file `03-logo.md`. If you take a look at
this file, you will see a couple of lines like these:

    ### Old and New Logos
    
    ![R old logo](images/Rlogo-old.png)
    
    ### New Logo
    
    ![R new logo](images/Rlogo-new.png)

Pay attention to the path names of each image file. They are paths
relative to the location of `R-project.html`. The output file is located
at the top level, and this is exactly where `images/` is located too. In
this way `R-project.html` can load correctly the R logos.

-----
