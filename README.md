# Cheatsheets

A variety of Cheatsheets made by (and for)
[Kickstart Coding](http://kickstartcoding.com)


## Use

PDFs are already checked in, so use those!

## With Docker

* Use `jagregory/pandoc`


## Without Docker

### Installation

* Install Python (3 or 2 work, though the build server uses 3)

* Install pandoc 1.x
    * On various Debian-based systems:
        * `sudo apt-get install pandoc`
    * On homebrew based systems:
        * `brew install pandoc`

This is enough for building HTML build targets.

#### Installing LaTeX

This project uses LaTeX for high-quality typesetting suitable for printing,
generated from the markdown and templating found in `src/templates`.  While it
produces awesome results, its slightly cumbersome to install, so only install
if you want to re-build the quiz or any handout material.

* For PDF support: Install pdflatex (required by pandoc to export to PDF), and
  all required LaTeX packages for your system.

* On various Debian-based systems, install via apt the following packages:
    * `texlive-latex-base`
    * `texlive-fonts-recommended`
    * `texlive-latex-recommended`
    * `texlive-pictures`
    * `texlive-latex-extra`
    * Alternatively, just do a full texlive installation which should contain
      all of those
* On macOS:
    * Either install all of MacTex (which will be equivalent to texlive), or
      install BasicTex 

### Building

```
./build.sh
```



