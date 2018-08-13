---
title: Industry Week
cheatsheet: 6
...


# Scrum Sprint Diagram {-}

![scrum](./kickstart-frontend/images/scrum.pdf)\ 


# Agile Terminology {-}

Agile

:    Dominant organizational attitude among Bay Area start-ups, involving
continuously improving the product in short increments in small teams

Story

:    All work is broken down into "stories" which constitute discrete features
to be added or defects to be fixed (depending on org, might be *ticket*,
*task*, *issue*)


Story points

:    Rough estimates of work involved to perform a task, intentionally left
unit-less

Scrum

:    Popular organizational method that focuses on planning cyclic *sprints* of
effort, and *velocity* (team effectiveness) is measured based on total *story
points* performed each sprint


Kanban

:    Popular organizational method to produce a continuous flow of effort, and
*cycle time* is measured based on average time it takes to complete stories


# Roles {-}


Product Management

:    Role within an engineering team of converting business needs into user
stories, doing product research, and producing concrete *stories* with
specifications and wireframes

Developer

:    Writes the code that implement a *story* about a new feature or bug fix

QA Engineer

:    Inspect product for defects and regressions, and write tools to automate
this process

DevOps

:    Sets up servers and DBs, and launches new code to production, automating
the process to achieve *"continuous deployment"*


\columnbreak


# Server Topography{-}

![server topography](./kickstart-frontend/images/server_topography.pdf)\ 


# Encryption  {-}


Key pair

:    A pair of *private* and *public* key files to used to securely connect a
pair of computers online, used by `git`, `ssh`, and more


![security](./kickstart-frontend/images/security.pdf)\ 

# DevOps tools {-}


Virtual machine

:    Can simulate multiple computers on a single physical computer. Linux VMs
can be bought at hosts such as Amazon Web Services or Digital Ocean.


SSH

:    Remotely log into a Bash terminal of a Linux computer or VM


Docker

:    A *virtualenv* for a Linux system, isolates system dependencies (e.g.
`apt install`ed for Ubuntu)



Puppet, Chef, Ansible, Salt etc

:    Tools used by DevOps for running and configuring many servers


\columnbreak





# Automated tests {-}


Unit testing

:    Tests a single function or class in isolation -- colloquially sometimes
refers to all automated tests


Functional testing

:    Tests that a component performs the function that supposed to do

End-to-end testing

:    Simulates clicking through a browser to ensure the app is fully working
from a user standpoint










