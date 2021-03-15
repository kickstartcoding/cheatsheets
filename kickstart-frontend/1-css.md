---
title: Advanced CSS
cheatsheet: 1.1 - 1.3
...


# Box model {-}


![CSS Rule](./kickstart-frontend/images/box_model_diagram.pdf)\ 


# CSS Terminology {-}


![CSS Rule](./kickstart-backend/images/anatomy_of_css_cmu.pdf)\ 

Selector
:    "Targets" a CSS rule

Specificity
:    The more specific the selector it is, the more likely it is to win against
other selectors targeting the same element

Responsive design
:    Looking good on mobile *and* desktop

Media queries
:    If statements for CSS, apply CSS to browser sizes.


# DOM Tree Terminology {-}

* Parent: `<div class="Main">`{.html}
    * Sibling: `<div>Sib</div>`{.html}
    * **Element:** `<div>`{.html}
        * Child: `<p>a</p>`{.html}
        * Child: `<hr />  `{.html}
        * Child: `<p>b</p>`{.html}\
        `</div>`{.html}
    * Sibling: `<img src="s.png"/>`{.html}\
      `</div>`{.html}



# CSS Variables {-}

```css
:root {        /* Definition */
  --bg: #FEAAFE;
  --gap: 20px;
}
.MainContent { /* Use */
  background: var(--bg);
  margin: calc(var(--gap) + 5px);
}
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

# BEM {-}


Block-Element-Modifier
:    Naming convention for CSS

Block
:    Standalone entity meaningful on its own. Use camel-case: `ComponentName`.

Element
:    A single part of a block that has no standalone meaning. Use a dash:
`ComponentName-descendentName`.


Modifier
:    A variant of a block (or element). Use two dashes:
`ComponentName--modifier`.


```css
.OkBtn { background: orange; }
.OkBtn-icon { width: 12px; }
.OkBtn--disabled { color: gray; }
```

```html
<div class="OkBtn--disabled">
    <img src="ok.png"
        class="OkBtn--icon" />
    Okay
</div>
```

\columnbreak


# CSS Pseudo-selectors {-}

\ \ \ \ \ Pseudo-elements
:   \ 

    ```css
    h1::before {
        content: "-";
        color: blue;
    }
    ```


\ \ \ \ \ Pseudo-classes
:   \ 

    ```css
    a:hover { color: blue; }

    /* First p margin */
    p:nth-child(1) {
        margin-left: 10px;
    }
    /* Striped table rows */
    tr:nth-child(odd) {
        background: gray;
    }
    ```

# CSS Animation {-}

```css
.Link {
    color: blue;
    padding-left: 10px;
    transition: color 1s,
                padding-left 3s;
}
.Link:hover {
    color: green;
    padding-left: 20px;
}
```

# Adding JavaScript to HTML{-}

**Responding to clicks**

```html
<div onclick="alert('Hello')">
    Click for annoying pop-up
</div>
```

**Modifying DOM**

```html
<div id="a" onclick="
  document.querySelector('#a')
     .innerHTML += '+'
">Plus</div>
```

**Running on page load**

```html
<script src="http://ex.amp/le.js">
</script>
<script>           // Print to dev
console.log("hi"); // tools console
</script>
```



