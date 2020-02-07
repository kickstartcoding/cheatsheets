![Kickstart Coding Logo](./templates/logo.png)

# Kickstart Cheatsheets

**A selection of printable, one-page cheatsheets.**

These were originally designed for Kickstart Coding, the affordable, inclusive,
and intensive coding course teaching cutting-edge Python / Django and
JavaScript / React web development in Oakland, CA.
[Learn more and enroll here.](http://kickstartcoding.com/?utm_source=github&utm_campaign=cheatsheets)


## Download

Click on one of the following to download. These are all 1 page long, and look
great when printed. Consider printing to hang up near your computer as you code
or learn a new programming language!


### Modern HTML/CSS (2020)

A cheat-sheet containing just the most commonly used stuff in modern HTML &
CSS, including CSS Grid and pseudo-selectors.

[![modern-html-css PDF thumbnail](./build/topical/modern-html-css.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/modern-html-css.pdf)

### CLI: Bash & Git

Learning CLI and Git usage on macOS or Linux? This cheatsheet has the most
commonly used commands in Bash and Git. It also contains more advanced
usage, such as using `grep`, `find`, piping, redirection, job and process
control, and interacting with the bash history.

[![cli-bash PDF thumbnail](./build/topical/cli-bash.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/cli-bash.pdf)


### Python

A cheatsheet with common tasks in Python. Designed for Python 3.x, but will
mostly work with 2, also.

[![python PDF thumbnail](./build/topical/python.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/python.pdf)



### JavaScript for Pythonistas

Already know Python, and want to learn JavaScript (ES6+)?  Print up the
following cheatsheet to use as a reference.

[![javascript-for-pythonistas PDF thumbnail](./build/topical/javascript-for-pythonistas.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/javascript-for-pythonistas.pdf)


### Python for JS Developers

Already know JavaScript, and want to learn Python 3?  Print up the
following cheatsheet to use as a reference.

[![python-for-js-developers PDF thumbnail](./build/topical/python-for-js-developers.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/python-for-js-developers.pdf)


### React, Redux, and React Router

Learning React, Redux, and React Router can be tricky. This crams in important
syntax and examples for common React and Redux coding patterns. Includes a
Redux diagram, JSX syntax snippets, map and ternary operator examples,
conditional rendering, action creator and reducer examples, React form events,
and component syntax examples.

[![react-redux PDF thumbnail](./build/topical/react-redux.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/react-redux.pdf)


### Django 

Learning Django? Here are some common patterns of Django, along with a diagram
showing how the Models-View-Template system fits together.

[![django PDF thumbnail](./build/topical/django.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/build/topical/django.pdf)


## More

[More cheatsheets, corresponding to weekly Kickstart Coding curriculum.](./CHEATSHEETS.md)

# Contributing

* **How it's built**: These cheatsheets are written originally in Markdown,
  converted into LaTeX using [pandoc](https://pandoc.org/) and a custom
  [pandoc LaTeX template](./templates/template.tex) (very messy), and then
  generates the PDF.  All this is tied together using the Bash script
  [build.sh](./build.sh).

* **Writing your own**: Want to write your own printable coding cheatsheets?
  It's easy, as long as you know Markdown! Look at the existing `.md` source
  files for ideas, then follow the [DEVELOPMENT.md](./DEVELOPMENT.md) for
  instructions on how to re-build the PDFs yourself.

* **License**: These cheatsheets and the scripts involved with their build
  process are (C) Kickstart Coding and released under the GPL 3.0

