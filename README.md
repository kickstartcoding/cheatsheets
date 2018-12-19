![Logo](./templates/letterhead.png)

# Kickstart Cheatsheets


A variety of Cheatsheets, optimized to look good when printed, but usable on a screen also.

These were originally designed for Kickstart Coding, the affordable, inclusive,
and intensive coding course teaching cutting-edge Python / Django and
JavaScript / React web development in Oakland, CA.
[Learn more and enroll here.](http://kickstartcoding.com/?utm_source=github&utm_campaign=cheatsheets)


## Download

Click on one of the following to download. These are all 1 page long, and look
great when printed. Consider printing to hang up near your computer as you code
or learn a new programming language!


### Modern HTML/CSS (2018)

A cheat-sheet containing just the most commonly used stuff in modern HTML &
CSS, including CSS Grid and pseudo-selectors.

[![modern-html-css PDF thumbnail](./build/topical/modern-html-css.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/modern-html-css.pdf)

### CLI: Bash & Git

Learning CLI and Git usage on macOS or Linux? This cheatsheet has the most
commonly used commands in Bash, Git, and more.

[![cli-bash PDF thumbnail](./build/topical/cli-bash.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/cli-bash.pdf)


### Python

A cheatsheet with common tasks in Python. Designed for Python 3.x, but will
mostly work with 2, also.

[![python PDF thumbnail](./build/topical/python.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/python.pdf)



### Javascript for Pythonistas

Already know Python, and want to learn JavaScript (ES6+)?  Print up the
following cheatsheet to use as a reference.

[![javascript-for-pythonistas PDF thumbnail](./build/topical/javascript-for-pythonistas.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/javascript-for-pythonistas.pdf)


### Python for JS Developers

Already know JavaScript, and want to learn Python 3?  Print up the
following cheatsheet to use as a reference.

[![python-for-js-developers PDF thumbnail](./build/topical/python-for-js-developers.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/python-for-js-developers.pdf)


# Contributing

* **How it's built**: These cheatsheets are written in Markdown, converted into
<style>.latex sub,.latex sup,.tex sub{text-transform:uppercase}.latex sub,.tex sub{vertical-align:-.5ex;margin-left:-.1667em;margin-right:-.125em}.latex,.latex sub,.tex,.tex sub{font-size:1em}.latex sup{font-size:.85em;vertical-align:.15em;margin-left:-.36em;margin-right:-.15em}</style>
<span class="latex">L<sup>a</sup>T<sub>e</sub>X</span> using [pandoc](https://pandoc.org/), which then generates attractive
  PDFs from the LaTeX using the (very messy) template found in
  `templates/template.tex`. All this is tied together using the Bash script
  [build.sh](./build.sh).

* **Writing your own**: Want to write your own? It's easy, as long as you know
  Markdown! Look at the existing `.md` source files for ideas, then follow the
  [DEVELOPMENT.md](./DEVELOPMENT.md) for instructions on how to re-build the
  PDFs yourself.

* **License**: These cheatsheets and the scripts involved with their build
  process are (C) Kickstart Coding and released under the GPL 3.0

