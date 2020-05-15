# Development

Just want to use the cheatsheets, or are your contributions minor markdown
changes and you feel you don't need to test the PDF output? Head on over back
to [./README.md](./README.md) to download and view all of the cheatsheets.

Want to re-build the PDFs yourself, or possibly use the build-scripts and
templates to make your own cheatsheets? Keep on reading below.

## With Docker

* Use `jagregory/pandoc`

## Without Docker

### Installation

#### pandoc

* Install pandoc 1.x
    * On various Debian-based systems:
        * `sudo apt-get install pandoc`
    * On homebrew based systems:
        * `brew install pandoc`

#### LaTeX

This project uses LaTeX for high-quality typesetting suitable for printing,
generated from the markdown and templating found in `templates`. While it
produces awesome results, its slightly cumbersome to install.

* Install pdflatex (required by pandoc to export to PDF), and all required
  LaTeX packages for your system.

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
      install BasicTex (see below)

### macOS - installing via BasicTex / TexLive

Installation using `brew` for BasicTex and `tlmgr` for the required TexLive
packages.

```bash
brew install pandoc
brew cask install basictex # takes a few minutes
bash --login # Make sure you're in a bash shell for the rest of the commands
sudo tlmgr install collection-fontsrecommended titlesec framed mdframed zref needspace
```

#### Installation entr

For the "--watch" feature of the build script to work, you'll need to install
`entr`.

* On various Debian-based systems:
    * `sudo apt-get install entr`
* On homebrew based systems:
    * `brew install entr`

#### Installing ImageMagick

For the thumbnailing of the PDFs to work, you'll need to install ImageMagick.

* On various Debian-based systems:
    * `sudo apt-get install imagemagick`
    * [You may need to change policies (such as on Ubuntu 18.04+) to permit it access to PDFs](https://askubuntu.com/questions/1081895/trouble-with-batch-conversion-of-png-to-pdf-using-convert)
* On homebrew based systems:
    * `brew install imagemagick`


## `build.sh` Usage

To re-build all cheatsheets:

```
./build.sh --all
```

To re-build only certain ones, or ones that match a search criteria:

```
./build.sh python
./build.sh ./kickstart-backend/5-http.md
```


To use `entr` to watch for changes and rebuild a particular cheatsheet (supply
path, but omit extension):

```
./build.sh --watch topical/python
```

