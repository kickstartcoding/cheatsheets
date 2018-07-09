---
title: Advanced CSS
cheatsheet: 1
...


![CSS Rule](./kickstart-backend/images/anatomy_of_css_cmu.pdf)\ 

# CSS Terminology {-}


* specificity - the more specific the selector it is, the more likely it is
    to "win" against other selectors
* responsive design - react to the size of the browser.

Selector
:    What "aims" a CSS rule

Specificity
:    The more specific the selector it is, the more likely it is to win against
other selectors targeting the same element

Responsive design
:    Making your design look good on mobile *and* desktop

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


# BEM (Block Element Modifier) {-}

Block Element Modifier is a naming convention for CSS.

**Block** is a standalone entity that is meaningful on its own.

**Element** is a part of a block that has no standalone meaning.

Use one dash and camel-case: `ComponentName-descendentName`.


Block
:    Standalone entity meaningful on its own. Use camel-case: `ComponentName`.

Element
:    A single part of a block that has no standalone meaning. Use a dash:
`ComponentName-descendentName`.


Modifier
:    A variant of a block (or element). Use two dashes:
`ComponentName--modifier`.


```css
.SubmitButton { background: orange; }
.SubmitButton-icon { width: 12px; }
.SubmitButton--disabled { background: gray; }
```

```html
<div class="SubmitButton--disabled">
    <img src="ok.png"
        class="SubmitButton--icon" />
    Submit
</div>
```
\columnbreak

# Grid & Flex Styling {-}


**Grid 2x3**

Building a 2x3 grid, 50px fixed top row, and 100px right and left column with
middle column filling remaining space.

```css
.Container {
    display: grid;
    grid-template-rows: 50px 1fr;
    grid-template-columns: 100px 1fr 100px;
}
```

\columnbreak

# JavaScript {-}



```javascript
alert("hi");       // pop-up
console.log("hi"); // dev console
```



