---
title: An Attempt at a Literate Vimrc File
author: Alex Norman
date: '2018-06-19'
slug: a-literate-vimrc-file
categories:
tags:
  - Vim
  - literate programming
  - plain text writing
summary: In which, for no good reason, I make my .vimrc file into a markdown-based blogpost that Vim reads upon startup.
draft: true
---

Reading code can be an esoteric exercise. One usually needs to determine whether the code works according to the rules of the language, what the particular functions and commands mean, and what the results of of the code will be. In addition to this, human readers (as opposed to the machines that actually execute the code) often like to be able to understand the choices made by the author. Why were certain functions invoked and not others? Why are certain objects being created? And so on. The obvious solution to this is comments; lines of code that are part of the file but not read by the machine. But comments are usually better short, as the formatting required to 'comment out' text in a file makes it less readable. For example:

> " Hi! I'm a comment.

The quotation mark at the start of the line tell the machine not to read the line (this is in Vimscript; in R it's `#`). But you can imagine that if everyline in something like this (a paragraph) was 'commented' like that, it would look a bit ugly. Where one of the purposes of a file is to teach someone about the coding choices made we need something better. Sometimes you simply want to have normal, human readable text with blocks of code in between that the machine will read if you tell it to.

An alternative is the combination of prose and code known as literate programming, which makes for a document that it easy to read and able to discuss coding choices at length, as well as being machine readable. Literate programming is great for researchers, giving them the capacity to weave programmatic and theoretical thinking together on a single page. But it also makes a document like a config file a much more useful than a series of commands for a program to execute. Instead it becomes didactic in nature.

I first learned that config files had the potential to be written in a 'literate' matter when learning Emcas. I really like the way you can write a config file for Emacs in Org-mode. In fact, to see what that looks like, check out [Harry Schwartz's talk](https://www.youtube.com/watch?v=SzA2YODtgK4) for Thoughtbot about using Org-mode for... well, everything. In the video, Schwartz talks about how useful it is to have a didactic config file. While literate programming [isn't right in many situations](https://harryrschwartz.com/2016/05/19/when-is-literate-programming-appropriate.html) programming situations (most?), it is for any that is meant to teach someone something.

### A Literate .Vimrc

After watching Schwartz's talk about Emacs Org-mode I stopped using Vim for about a week and played with Emacs. It's great, but even though it was a lot closer to what I was used to using for some reason Vim just keeps pulling me back. What I wanted was a .vimrc that I could writer literately and display on my blog as part of a programme to teach Master's and PhD students about the virues of plain text writing and version control. I thought nothing of the sort existed for Vim, but (of course) a simple Google yielded Tyler Cipriani's Wi[blog post](https://tylercipriani.com/blog/2017/06/14/literate-vimrc/) post announcing his Vim plugin, [`Literate-vimrc1`](https://github.com/thcipriani/literate-vimrc). This plugin essentially does what Org-mode allows you to do within Vim: write a document - in Markdown in this case - that Vim will read for configuration.

# My .Vimrc

Many of the settings and mappings in my `.vimrc` are lifted directly from [Luke Smith's .vimrc](https://github.com/LukeSmithxyz/voidrice/blob/master/.vimrc). Luke's focus on keymappings for writing academic literature are informative and helpful. Check out his [YouTube channel](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA).



## General Settings and Startup

First of all we want to set Vim up so that it behaves nicely and loads the plugins we have put into our autoload folder. To begin, call Pathogen, which will load up plugins. After that, we set some basics that will make Vim behave nicely. Vim's default mode won't allow many plugins to work, so setting `nocompatible` makes Vim behave like a modern program. After this, we get Vim to recognise and format text according to the type of file, and the turn on relative line numbers. Finally, sensible linebreaks and a deafult to split buffers to the right.

```vim
execute pathogen#infect()
execute pathogen#helptags()

set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number
set relativenumber
set wrap
set linebreak

set splitbelow
set splitright
```

## Keymappings for Profit Collection

File navigation is one of the greatest things about Vim. It's easy to go to the exact character (row + column) you want in just a couple of keystrokes. There are some improvements to be made, however, to make navigation even easier.

Firstly, navigation between split windows. The default keymapping to go to the split to the right is `<C-w>l`. Too many keystrokes - let's get rid of the `w`.

```vim
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
```
This is a handy one - replace all while in Normal Mode with minimal effort! Simply add the search text between the slashes and the replacement text in place of the `g`.

```vim
nnoremap S :%s//g<Left><Left>
```

### Filetype Specific Mappings

jumbo g fiif
