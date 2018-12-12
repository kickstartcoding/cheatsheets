---
title: HTML & CSS
cheatsheet: HTML and CSS
topic: Modern HTML (2018)
headergfx: true
credits: true
...



# Box model {-}

![CSS Rule](./kickstart-frontend/images/box_model_diagram.pdf)\ 

# Common HTML Tags {-}

![HTML tag](./kickstart-backend/images/anatomy_of_tag_cmu.pdf)\ 

Paragraph
:   \ 

    ```html
    <p>Paragraph of text</p>
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

Link *"anchor"*
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

:   \ 

    ```html
    <!-- This will be ignored! -->
    ```


\columnbreak

# CSS Examples {-}


![CSS Rule](./kickstart-backend/images/anatomy_of_css_cmu.pdf)\ 


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


# CSS Animation {-}


Animation & transition
:   \ 

    ```css
    .Link {
        transition: color 1s,
                    padding-left 3s;
    }
    .Link:hover {
        color: green;
        padding-left: 20px;
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

\columnbreak


# Grid Container {-}

Use `display: grid` and specify columns/rows.

![Grid Example](./kickstart-frontend/images/grid_template_example.pdf)\ 

```css
.Container {
  display: grid;
  grid-template-columns: 50px auto 50px;
  grid-template-rows: 50px auto 90px;
}
```

# Grid Child Positioning {-}

*Optional:* Child elements can be custom positioned and sized.

![Grid Example](./kickstart-frontend/images/grid_child_example.pdf)\ 

```css
.ChildElement {
  grid-column: 1 / span 2;
  grid-row: 1 / span 2;
}
```


# CSS Selectors {-}

**Tag** \ \ \ `div { color: blue; }`{.css}

**Class** `.class-name { color: blue; }`{.css}

**ID** \ \ \ \ `#id_name { color: blue; }`{.css}

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


Pseudo-elements
:   \ 

```css
h1:before {
    content: "-";
    color: blue;
}
```


Pseudo-classes
:   \ 

```css
/* First p margin */
p:nth-child(1) {
    margin-left: 10px;
}
/* Striped table rows */
tr:nth-child(odd) {
    background: gray;
}
```

