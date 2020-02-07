---
title: HTML & CSS (2020)
cheatsheet: HTML and CSS
topic: Modern HTML (2020)
headergfx: true
credits: true
...


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

Link
:    (aka *"anchor"*)

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

     `<div></div>`{.html} (block) and `<span></span>`{.html} (inline)

Semantic
:   \ 

     `<section>`{.html}, `<article>`{.html}, and more


Comment

:   \ 

    ```html
    <!-- Ignored text -->
    ```


# Box model {-}

![CSS Rule](./kickstart-frontend/images/box_model_diagram.pdf)\ 

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
.highlighted-area {
    display: block;
    box-sizing: border-box;
    background: yellow;
    border: 2px solid green;
    border-radius: 10px;
}
```


Transition
:   (animates properties)

```css
.fading-link {
    transition: color 1s,
                padding-left 3s;
}
.fading-link:hover {
    color: green;
    padding-left: 20px;
}
```

# CSS Display {-}

block
:   fill available width, word-wrap inline children (e.g. paragraph)

inline
:   word-wrap (e.g. strong)

inline-block
:   square block within word-wrapped text (e.g. emoji or icon)

flex
:   line up children, control spacing

grid
:   position children in grid


\columnbreak

# CSS Selectors {-}

**Tag** \ \ \ `div { color: blue; }`{.css}

**Class** `.class-name { color: blue; }`{.css}

**ID** \ \ \ \ `#id_name { color: blue; }`{.css}

Containment
:   (match children)

```css
/* Match all divs in #a */
#a div { color: blue; }
/* Divs immediately in #b */
#b > div { color: blue; }
/* Wildcard: anything in #c */
#c > * { color: blue; }
```


Pseudo-elements
:   (add content)

```css
h1::before { content: "-"; }
```


Pseudo-classes
:   (match by position)

```css
/* First p margin */
p:nth-child(1) { margin: 10px; }
/* Striped table rows */
tr:nth-child(odd) { color: gray; }
```


# Grid Container {-}

<!--
Use `display: grid` and specify columns/rows.
-->

![Grid Example](./kickstart-frontend/images/grid_template_example.pdf)\ 

```css
.container-element {
display: grid;
grid-template-columns: 1fr 1fr 1fr;
grid-template-rows: 50px auto 90px;
}
```

# Grid Child Positioning {-}

<!--
*Optional:* Child elements can be custom positioned and sized.
-->

![Grid Example](./kickstart-frontend/images/grid_child_example.pdf)\ 

```css
.child-element {
  grid-column: 1 / span 2;
  grid-row: 1 / span 2;
}
```

