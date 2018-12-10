---
title: HTML & CSS
cheatsheet: HTML and CSS
topic: Modern HTML (2018)
headergfx: true
credits: true
...

# Common HTML Tags {-}

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

:   Ignored by computer, but readable for humans.
    Useful for adding notes or temporarily removing
    parts of your code.

    ```html
    <!-- This will be ignored! -->
    ```


# HTML Tag Diagram {-}

![HTML tag](./kickstart-backend/images/anatomy_of_tag_cmu.pdf)\ 

# CSS Rule Diagram {-}

![CSS Rule](./kickstart-backend/images/anatomy_of_css_cmu.pdf)\ 

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

