---
title: An Attempt at a Literate Vimrc File
author: Alex Norman
date: '2018-06-19'
slug: a-literate-vimrc-file
categories:
  - software
  - programming
tags:
  - Vim
  - literate programming
  - plain text writing
summary: In which, for no good reason, I make my .vimrc file into a markdown-based blogpost that Vim reads upon startup.
output:
  blogdown::htmlpage:
    toc: true
    number_sections: true
    toc_depth: 3
draft: true

---

Reading code can be an esoteric exercise. One usually needs to determine whether the code works according to the rules of the language, what the particular functions and commands mean, and what the results of of the code will be. In addition to this, human readers (as opposed to the machines that actually execute the code) often like to be able to understand the choices made by the author. Why were certain functions invoked and not others? Why are certain objects being created? And so on. The obvious solution to this is comments; lines of code that are part of the file but not read by the machine. But comments are usually better short, as the formatting required to 'comment out' text in a file makes it less readable. For example:

> " Hi! I'm a comment.

The quotation mark at the start of the line tells the machine not to read the line (this is in Vimscript; in R it's `#`). But you can imagine that if every line in something like this (a paragraph) was 'commented' like that, it would look a bit ugly. Where one of the purposes of a file is to teach someone about the coding choices made we need something better. Sometimes you simply want to have normal, human readable text with blocks of code in between that the machine will read if you tell it to.

An alternative in this direction is the combination of prose and code known as ['literate programming'](https://www-cs-faculty.stanford.edu/~knuth/lp.html), which makes for a document that it easily human readable and able to discuss coding choices at length, as well as being machine readable. Literate programming is great for researchers, giving them the capacity to weave programmatic and theoretical thinking together on a single page. But it also makes a document like a config file much more useful than a series of commands for a program to execute. Instead it can become didactic in nature, teaching the reader about the config choices.

I first learned that config files had the potential to be written in a 'literate' matter when learning Emacs. I really like the way you can write a config file for Emacs in Org-mode. In fact, to see what that looks like, check out [Harry Schwartz's talk](https://www.youtube.com/watch?v=SzA2YODtgK4) for Thoughtbot about using Org-mode for... well, everything. In the video, Schwartz talks about how useful it is to have a didactic config file. While literate programming [isn't right in many situations](https://harryrschwartz.com/2016/05/19/when-is-literate-programming-appropriate.html) (most?), it is for any that is meant to teach someone something.

### A Literate .Vimrc

I seem to be a [Vim](https://www.vim.org/) user for both programming and writing prose. I've disliked using Microsoft's Word program since having to write my PhD in it (many crashes, much lost work despite backups). Over the last two years I have gradually migrated from Word to [SublimeText](https://www.sublimetext.com/) to [Atom](https://atom.io/) and finally to Vim. After watching Harry Schwartz's talk about Emacs Org-mode I stopped using Vim for about a week and played with [Emacs](https://www.gnu.org/software/emacs/). It's great, but even though I really liked it and found it was closer to what I was used to using in Atom or SublimeText, for some reason Vim just kept pulling me back. But - and this will seem silly - I found the config file for Vim (the `.vimrc` file) was... well, boring. After seeing the Emacs Org-mode config I wanted something like that. This meant I effectively needed a .vimrc that I could write literately, which would have the advantage of being able to be displayed on my blog, and used as part of a programme to teach Master's and PhD students about the virues of plain text writing and version control. I suspected nothing of the sort existed for Vim. Of course, a simple Google yielded Tyler Cipriani's [blog post](https://tylercipriani.com/blog/2017/06/14/literate-vimrc/) post announcing his Vim plugin, [`Literate-vimrc`](https://github.com/thcipriani/literate-vimrc). This plugin essentially does what Org-mode allows you to do within Vim: write a document - in [Markdown](https://daringfireball.net/projects/markdown/) in this case - that Vim will read for configuration.

# My .Vimrc

The bulk of my work in Vim is writing prose, mainly academic articles and blogposts. I've set Vim up for that main purpose, but there are a few tweaks for working in R, Python, and Shell. Many, indeed most, of the settings and mappings in my `.vimrc` are lifted directly from [Luke Smith's .vimrc](https://github.com/LukeSmithxyz/voidrice/blob/master/.vimrc). Luke's focus on keymappings for writing academic literature are informative and helpful. Check out his [YouTube channel](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA).


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

The following are also pretty handy.

####  Autocompletion
```vim
set wildmode=longest,list,full
set wildmenu
```

#### Delete trailing whitespace
```vim
autocmd BufWritePre * %s/\s\+$//e
```

#### Renew Bash and Ranger configs

When system shortcut files are updated, renew bash and ranger configs with new material.
```vim
autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !bash ~/.scripts/shortcuts.sh
```

#### Disable Auto-commenting

By default, Vim comments out new lines. This command stops that.
```vim
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
```

#### NAvigation with guides

This took me *ages* to figure out. I ekpt seeing `<++>` in a some files and couldn't figure out what they were for. Yet again, Luke Smith's guidance helped. They are just markers one can leave in order to indicate `put some text here`. Handy!

These commands allow you to jump to the next 'guide', delete it, and throw you into `Insert` mode.

```vim
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>
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

#### Replace All

This is a handy one - replace all while in Normal Mode with minimal effort! Simply add the search text between the slashes and the replacement text in place of the `g`.
```vim
nnoremap S :%s//g<Left><Left>
```

#### Spell-check

Spell-check set to F6 and the British English library.
```vim
map <F6> :setlocal spell! spelllang=en_gb<CR>
```
#### Word count

Get line, word and character counts with F3.
```vim
map <F3> :!wc <C-R>%<CR>
```

#### Open my .bib file

Open my bibliography file in split
```vim
map <F9> :vsp<space>~/Dropbox/WritingTools/zotero-library.bib<CR>
```

#### Open URLs in a file

Use the `urlview` script to choose and open a url.
```vim
:noremap <leader>u :w<Home>silent <End> !urlview<CR>
```

#### Compile to .pdf

This command executes the script `compiler` that is adapted from Luke Smith's file of the same name, and that ships with his LARBS setup. The script builds a pdf with default settings using `pandoc`.
```vim
map <leader>c :!compiler <c-r>%<CR>
```

#### Distraction-free Writing

Whether writing code or prose, it's often nice to have a clean writing environment. In fact, one of the nicest things about moving away from a program like Word is being able to customise your writing environment so it's clean and aesthetically pleasing to you. For me, this means the text I'm working on and nothing else. Usually, this is known as 'distraction-free writing'.

I use Goyo for this purpose in Vim. The following command maps `F10` to be a Goyo toggle. I may also put Limelight in here, too, as it seems pretty cool.

```vim
map <F10> :Goyo<CR>
map <leader>f :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a
```

## Filetype Specific Mappings

I usually write in Markdown or RMarkdown for blog posts and articles/chapters/etc., so first we'll setup Vim to interpret relevant files as .markdown. This command tells Vim to interpret a bunch of different filetypes as Markdown files, which makes navigation and keymappings work the same way.

```vim
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
```

### Markdown Magic from Unicorns

Almost all of my Vim work is in Markdown. These keymappings make life a little easier. First of all there is navigation with `j` and `k` when in `Normal` mode so that you can more intuitively go through the lines of a paragraph, rather than logical lines. Secondly, there are a bunch of shortcuts to create things like **bold**, *italics*, ~~strikethrough~~, `code chunks` (including blocks for R and Python), new sections, horizontal lines, web links, image links, and four levels of headings.

```vim
autocmd Filetype markdown,rmd map j gj
autocmd Filetype markdown,rmd map k gk
autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ;c ``<++><Esc>F`i
autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ;4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO
```

These two commands map `F5` to a command to create a pdf, in `Markdown` via pandoc, and in RMarkdown via R.
```vim
autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>--pdf-engine=xelatex<space>-o<space><C-r>%.pdf<Enter><Enter>
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
```

