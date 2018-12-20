---
title: Bash & Git
cheatsheet: Bash
topic: Useful CLI tricks for macOS and GNU/Linux
headergfx: true
credits: true
...


# Bash {-}

Navigating
:   \ 

    ```bash
    cd name_of_directory
    cd ..     # Go up one
    cd ~      # Go to home
    pwd       # Where am I?
    ```

Listing files
:   \ 

    ```bash
    ls        # List files
    ls -a     # See hidden
    ls -l     # See more info
    ls -R     # Recursive
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

Redirecting output into file
:   \ 

    ```bash
    ls -R > all_files.txt
    cat a.html b.html > c.html
    ```

Running file as bash script
:   \ 

    ```bash
    # Save commands to script.sh
    bash script.sh
    ```

# Bash tricks {-}

Auto complete

:   Start typing then hit `<Tab>`. Hit twice for
options.


Wildcards
:   \ 

    ```bash
    rm *.jpg # Delete jpg files
    ```

Advanced piping
:   \ 

    ```bash
    # Search process for "chrome"
    ps -e | grep chrome
    find . | grep .py$ # find py files
    ```

\columnbreak

# Bash: Variables, Output{-}


Setting and viewing variables
:  \ 

    ```bash
    PLANET="world"
    ecoh "Hello $PLANET"
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


Job control
:   \ 

    ```bash
    npm start & # run process in BG
    ps # show processes
    jobs # show background processes
    fg # foreground last process
    <Ctrl+Z> # pause process, put in bg
    # keep bg process [1] running forever
    disown %1
    ```


Viewing all processes
:   \ 

    ```bash
    ps -e # show all processes
    ps -ejH # show process trees
    ps -e | grep python # filtering
    ```

Killing processes
:   \ 

    ```bash
    kill 4264 # kill process by PID
    killall python # kill process by name
    killall -9 python # force kill by name
    ```


\columnbreak


# Git {-}


Starting (local) repo
:  \ 

    ```bash
    git init
    ```



Adding and committing
:   \ 

    ```bash
    git add -A  # Add to staging
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
    git log         # Q to quit
    git show f85bfcf
    git diff f85bfcf master
    git checkout f85bfcf 
    ```

Branch workflow
:   \ 

    ```bash
    git branch my-stuff
    git checkout my-stuff
    # Do some work...
    git add -A
    git commit -m "did stuff"
    git checkout master
    git merge my-stuff
    ```

Interacting with remotes
:   (e.g. GitHub, Heroku)

    ```bash
    git remote -v # check remotes
    git pull # get updates
    # Do some work...
    git add -A
    git commit -m "it works!"
    git push # share updates
    ```

