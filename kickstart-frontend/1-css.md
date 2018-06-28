---
title: Advanced CSS
cheatsheet: 1
...

# CSS Rule Diagram {-}

![CSS Rule](./kickstart-backend/images/anatomy_of_css_cmu.pdf)\ 


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

