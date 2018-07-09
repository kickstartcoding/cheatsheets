---
title: JavaScript (ES6)
cheatsheet: 2
...

# Types {-}

str
:   \ 

    ```javascript
    let str = "Hello, world";
    a.capitalize()  # Hello!
    a.split(" ")    # ["Hello,", "world"]
    a.index("e")    # 2
    a.split("e") # ["h", "llo!"]
    ```

number types
:   \ 

    ```python
    count = 3  # int
    pi = 3.14  # float
    ```

list
:   \ 

    ```python
    a = ["a", "b", 3]
    a[0]        # "a"
    a[1]        # "b"
    a[-1]       # "3"
    a[1:2]      # ["b", 3]
    ```

tuple

:   same as list, but immutable

    ```python
    a = ("a", "b", 3)
    ```

dict
:   \ 

    ```python
    a = {"test": 1, "b": "hello"}
    a["test"]      # 1
    a["b"]         # "hello"
    del a["test"]  # delete "test"
    a["c"] = 3  # add "c" to dict
    ```

list methods
:   \ 

    ```python
    a = ["a", "b", 3]
    a.append(4) # ["a", "b", 3, 4]
    a.reverse() # [4, 3, "b", "a"]
    ```

dict methods
:   \ 

    ```python
    a = {"a": 1, "b": 2}
    a.get("c", 3) # 3 as default
    a.update({"d": 4}) # add more
    a.keys() # iterable of keys
    a.values() # ... of values
    a.items() # ... of both
    ```

