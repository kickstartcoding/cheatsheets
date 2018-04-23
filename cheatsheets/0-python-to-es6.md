---
title: ES6 for Python Programmers
cheatsheet: 9
fourcolumns=true
...

# Type conversions {-}


```py
a = int(b)
```

Styling
:   \ 

    ```html
    <em>Italic</em> and
    <strong>bold</strong>
    ```

Image
:   \ 

    ```html
    <img src="image.jpg" />
    ```

Link
:   \ 

    ```html
    <a href="http://google.com/">
        Link to Google
    </a>
    ```

Headers
:   \ 

    ```html
    <h1>Huge</h1> <h2>Big</h2>
    ... <h6>Small</h6>
    ```

Freeform
:   \ 

     `<div></div>` (block) and `<span></span>` (inline)

Semantic
:   \ 

     `<section>`, `<article>`, and many more


Comment

:   Ignored by computer, but readable
    for humans. Useful for temporarily
    removing parts of your code.

    ```html
    <!-- This will be ignored! -->
    ```


# Anatomy of a tag {-}

![HTML tag](./cheatsheets/images/anatomy_of_tag.pdf)\ 


\columnbreak

# Common CSS Styles {-}


Text
:  \ 

    ```css
    p {
        font-size: 16pt;
        text-align: center;
        color: green;
        font-family: "Arial";
        font-weight: bold;
        line-height: 20px;
    }
    ```

Sizing
:   \ 

    ```css
    div {
        height: 30px;
        width: 100%;
        margin-left: 20px;
        padding-top: 10px;
    }
    ```

Block styling
:   \ 

    ```css
    span {
        background: yellow;
        border: 2px dotted green;
        border-radius: 10px;
    }
    ```

Positioning & display tricks
:   \ 

    ```css
    /* Image floating in text */
    img { float: left; }

    /* Display as wide block*/
    .a { display: block; }

    /* Wrap inline with text */
    .b { display: inline; }

    /* Stack adjacently */
    .c { display: inline-block; }
    ```

# Common CSS Selectors {-}

Tag
:   \ 

    ```css
    div { color: blue; }
    ```

Class
:   \ 

    ```css
    .class-name { color: blue; }
    ```

ID
:   \ 

    ```css
    #id_name { color: blue; }
    ```

Containment
:   \ 

    ```css
    /* Match all divs in #a */
    #a div { color: blue; }
    /* Divs immediately in #b */
    #b > div { color: blue; }
    /* Wildcard: match all in #c */
    #c > * { color: blue; }
    ```

\columnbreak


# Key Terms {-}

Tech stack

: Set of technologies that a company
uses. A "full stack" programmer works
with all of them.

HTML & CSS

:   The computer languages that powers
the appearance of the web. HTML controls
*content* and *structure*, while CSS
handles *styling*.

Tag

:   Special keywords that format and
structure your webpage.  An HTML element
consists of an opening tag, contents
(which can include other tags), and a
closing tag.

CSS Rule

:    Modifies the style of one or more HTML elements.
Consists of a *selector* that matches elements in the
HTML document, and a list of *declarations*, each
consisting of a *property* and *value*.


# Boilerplate {-}


Boilerplate is stuff you have to copy
and paste into new projects to get
going, and rarely change. A basic HTML
boilerplate is as follows:


```html
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title>My page</title>
    </head>
    <body>
        Hello world!
    </body>
</html>
```

# Bootstrap 4 - Grid {-}

Use class `container` for a nice margin. Use class
`row` for creating a new row in your grid. Use class
`col-X` for different width columns.

```html
<div class="container">
    <div class="row">
        <div class="col-4">
            1/3rd row width
        </div>
        <div class="col-6">
            Half row width
        </div>
        <div class="col-2">
            1/6th row width
        </div>
    </div>
</div>
```




