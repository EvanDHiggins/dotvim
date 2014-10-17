
"*******************
"
"       Vundle
"
"********************
"Vundle complains about fish shell, this changes commands to bash
set shell=/bin/bash
"This is all just required for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugins should go here

Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
"********************
"
"      Plugins
"
"********************

"Forces Airline to run all the time
:set laststatus=2
"Turns off standard mode indicator. Replaced by Airline
set noshowmode

"Sets snippet directory to something outside of /bundle
let g:UltiSnipsSnippetDirectories=["~/.vim/snippets"]
let g:UltiSnipsExpandTrigger="<tab>"

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
noremap <leader>u :vsplit<CR> :UltiSnipsEdit<CR>

"This is the voodoo required to make utlisnips work well enough with
"YouCompleteMe.  Ctrl-Space is the trigger now, not the greatest, but it works
let g:UltiSnipsExpandTrigger = '<C-@>'   " terminals send C-@ when C-Space is pressed.
let g:UltiSnipsJumpForwardTrigger = '<C-%>' " some key I do not use at all

let g:UltiSnipsSnippetsDir="~/.vim/snippets"
let g:UltiSnipsSnippetDirectories  = ["UltiSnips"]

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        call UltiSnips#JumpForwards()
        if g:ulti_jump_forwards_res == 0
            return ""  " nothing more to do
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

"********************
"
"Syntax And Coloring
"
"********************

"Sets background dark. Very important that this is first for some strange
"reason
set background=dark

"Enables syntax coloring
syntax enable
set number
colorscheme jellybeans

"Used to enable 256 colors
set t_Co=256

"Sets working directory to that of the file open in the buffer
set autochdir

"Highlights column 80
set colorcolumn=80

"" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

"
"********************
"
"   General Config
"
"********************

"Sets general config files
:set shiftwidth=4
:set smarttab
:set expandtab


"Allows folding via brackets
:set foldmethod=syntax
:set foldenable

"Sets leader to spacebar
:let mapleader = "\<space>"

set backspace=2



"********************
"
"    Auto Commands
"
"********************

"Saves current file when loading a new file into the buffer
":autocmd BufNewFile * :write

"Auto Load/Save folds on open/close
:au BufWinLeave * mkview
:au BufWinEnter * silent loadview



"********************
"
"    Normal Mode
"
"********************

"Creates a function prototype of the current line, needs to be made into a
"true function at some point
:noremap <leader>p yy/\v^void.*;\|^FILE.*;\|^int.*;\|^char.*;\|^double.*;<CR>p$a;<Esc><C-o>

"Some Nice movement help
:noremap J 10j
:noremap K 10k
:noremap H ^
:noremap L $

"Faster line deletion
noremap - dd

"Allows quick access to file browser
:noremap <leader>e :e.<CR>

"Easier saving and save-quitting. :q! is not mapped intentionally
:noremap <leader>w :w<CR>
:noremap <leader>wq :wq<CR>

"Taken from "Learn Vimscript the Hard Way" super convenient way of editting
".vimrc
:nnoremap <leader>ve :vsplit $MYVIMRC<CR>
:nnoremap <leader>sv :source $MYVIMRC<CR>



"********************
"
"    Insert Mode
"
"********************

"Most important mapping ever, jk quits insert mode
:inoremap jk <esc>l
:inoremap kl <C-o>$
:inoremap lk <C-o>^

"allows movement through autocompletion lists
:inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
:inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

"Better curly brace functionality, probably a plugin to do this better
:inoremap {      {}<Left>
:inoremap {<CR>  {<CR>}<Esc>O
:inoremap {{     {
:inoremap {}     {}



"********************
"
"    Visual Mode
"
"********************

"Indents/Unindents selected text
:vnoremap < <gv
:vnoremap > >gv


