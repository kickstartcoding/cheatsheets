---
title: Bash & Git
cheatsheet: Bash
topic: Useful CLI tricks for macOS and GNU/Linux
headergfx: true
credits: true
...


# Bash Basics {-}

Navigating
:   \ 

    ```bash
    cd name_of_directory
    cd .. # Go up one
    cd ~ # Go to home
    pwd # Where am I?
    ```

Listing files
:   \ 

    ```bash
    ls # List files
    ls -a # See hidden
    ls -l # See more info
    ls -R # Recursive
    ```

Moving and renaming
:   \ 

    ```bash
    mv file.txt new_name.txt
    mv file.txt ../new/place/
    ```

Copying
:   \ 

    ```bash
    cp file.txt file_backup.txt
    cp -r directory/ backup/
    ```

Deleting
:   \ 

    ```bash
    rm file.txt
    rmdir empty_directory/
    rm -r full_directory/
    ```

Creating
:   \ 

    ```bash
    mkdir my_directory
    touch empty_file.py
    ```

Reading data from file
:   \ 

    ```bash
    cat filename.txt
    cat file1 file2 file3
    ```

# Bash tricks {-}

Auto complete

:   Start typing then hit `<Tab>`. Hit twice for
options.

Redirecting output into file
:   \ 

    ```bash
    ls -R > all_files.txt
    cat a.html b.html > c.html
    cat d.txt >> c.txt # Append
    ```


Piping output
:   Hook commands up

    ```bash
    # Pipe output to "grep" filter
    python start.py | grep "http"
    node run.js | tail # Only end
    ```

Wildcard expansions
:   \ 

    ```bash
    rm *.jpg # Delete jpg files 
    rm ./**/*.jpg # ** matches dirs
    ```


Running file as bash script
:   \ 

    ```bash
    # Save a sequence of commands to
    # file with "#!/bin/bash" at top
    bash scrpt.sh # Always works
    ./scrpt.sh # Works if executable
    ```

<!--
Wildcard expansions
:   \ 

    ```bash
    rm *.jpg # Delete jpg files

cd history
:   \ 

    ```bash
    cd - # Go to previous dir
    ```
-->

\columnbreak

# Bash: Variables, Output{-}


Setting and viewing variables
:  \ 

    ```bash
    PLANET="world"
    echo "Hello $PLANET"
    env # Show ALL variables
    ```

Run command with variable set
:  \ 

    ```bash
    DEBUG=true  npm start
    ```

# Bash: History {-}

History commands
:  \ 

    ```bash
    cd - # go back a directory
    history # view all commands
    !! # last command you typed
    sudo !! # ditto, but as sudo
    ```

Shortcut: Last command

:   `<Up>`

Shortcut: Search through history

:   `<Ctrl+R>` then start typing, `<Ctrl+R>` to cycle
back, `<Enter>` to run.


# Bash: Process management {-}


Multiple commands
:   \ 

    ```bash
    c1 ; c2 # run c2 after c1
    c1 && c2 # run c2 if c1 succeeds
    c1 || c2 # run c2 if c1 fails
    c1 & c2 # run both at once
    ```

Job control
:   \ 

    ```bash
    npm start & # run in bg
    ps # show shell's processes
    jobs # show bg processes
    fg # foreground last process
    <Ctrl+Z> # pause; put in bg
    # keep background process [1]
    disown %1 # running forever
    ```


Viewing all processes
:   \ 

    ```bash
    ps -e # show all processes
    ps -ejH # show process trees
    ps -e | grep python # filter
    ```

Killing processes
:   \ 

    ```bash
    kill 4264 # kill process by PID
    killall python # ...or by name
    kill -9 4264 # -9 "forces" kill
    ```


\columnbreak


# Git {-}


Starting (local) repo
:  \ 

    ```bash
    git init
    ```


**Starting with repo from GitHub**

```bash
# Using HTTP (prompt for pw)
git clone https://github.com/U/R
# Using SSH (requires setup)
git clone git@github.com:U/R.git
```



Adding and committing
:   \ 

    ```bash
    git add -A # "Stage" all
    git commit -m "Fixed :)"
    ```

Finding out status
:   \ 

    ```bash
    git status
    git log
    ```

Learning about past
:   \ 

    ```bash
    git log # Q to quit
    git show f85bfcf
    git diff f85bfcf master
    git checkout f85bfcf 
    ```

Branch workflow
:   \ 

    ```bash
    git branch my-stuff
    git checkout my-stuff
    # After you do some work...
    git add -A
    git commit -m "New logo :)"
    git checkout master
    git merge my-stuff
    ```

Interacting with remotes
:   (e.g. GitHub, Heroku)

    ```bash
    git remote -v # check remotes
    git pull # get updates
    # After you do some work...
    git add -A
    git commit -m "it works!"
    git push # share updates
    ```


# Bash: Searching {-}



`find`: Search by filename
:   \ 

    ```bash
    # Using wildcard for search by
    find . -name '*.py' # extension
    find . -name views.py # Exact
    find . -iname iNFo # Any case
    # Find modified in last 7 days
    find . -mtime 7 -iname info
    ```


`grep`: Search contents of files
:   \ 

    ```bash
    # Search templates for "free"
    grep -r free ./templates/
    grep -lr free . #...list names
    grep -ir ToDo . # Ignore case
    # Using Regular Expressions
    grep -er '(http|ftp)s?:' .
    ```





