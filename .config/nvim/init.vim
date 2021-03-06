call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'haya14busa/incsearch.vim'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'chrisbra/Colorizer'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()
" General settings
" ---------------------------------------------------------------------------
set autoread " reload files changed outside of Vim not currently modified in Vim (needs below)
au FocusGained,BufEnter * :silent! !  " http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
set encoding=utf-8 fenc=utf-8 "fencs=iso-2022-jp,euc-jp,cp932 " use Unicode
set visualbell " errors flash screen rather than emit beep
set backspace=indent,eol,start " make Backspace work like Delete
set nobackup " don't create `filename~` backups
set noswapfile " don't create temp files
set relativenumber number " line numbers and distances
set mouse=v " Enable mouse copy\paste
set scrolloff=2 " number of lines offset when jumping
set ttyfast lazyredraw " For some reasons, vimwiki without that does strange things. When you press enter in .md file without this settings, vim goes to normal mode, then to insert mode, which is annoying
" For text wrapping. Insert linebreak when line is too big
set textwidth=0
set wrapmargin=0
set wrap
set linebreak
" Tab key enters 2 spaces
" To enter a TAB character when `expandtab` is in effect,
" CTRL-v-TAB
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set autoindent " Indent new line the same as the preceding line
set showmode showcmd " statusline indicates insert or normal mode
"set showmatch " highlight matching parens, braces, brackets, etc

" Search settings (incsearch pluggin)
" -----------------
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

set autochdir " http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set hidden " open new buffers without saving current modifications (buffer remains open)
set wildmenu wildmode=list:longest,full " http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus


" Custom remaps 
" ---------------------
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! "Save file as sudo on files that require root permission
" ---------------------

" Handle vim layouts
 au InsertLeave * silent! !change-layout us
 au InsertEnter * silent! !change-layout us restart
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" When shortcut files are updated, renew bash and ranger configs with new material:
 autocmd BufWritePost ~/.config/shell/bm* !shortcuts 
 autocmd BufWritePost ~/.config/shell/bm* !cheatsheets_parser 
" Recompile suckless on config edit
autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
autocmd BufWritePost ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; sudo make install && { killall -q dwm;setsid -f dwm }
autocmd BufWritePost ~/.local/src/st/config.h !cd ~/.local/src/st/; sudo make install && { killall -q st;setsid -f st }
autocmd BufWritePost ~/.local/src/dmenu/config.h !cd ~/.local/src/dmenu/; sudo make install && { killall -q dmenu;setsid -f dmenu }

" VimWiki
" ---------------------
"Change vimwiki syntax from .wiki to .md
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
au BufEnter ~/vimwiki/diary/diary.md VimwikiDiaryGenerateLinks " Reload diary index when open
nnoremap <C-Space> <Plug>VimwikiToggleListItem
" --------------------



" Colors
" ---------------------------------------------------------------------------
syntax enable
colorscheme dracula 
 
" CursorLine - sometimes autocmds are not performant; turn off if so
set cursorline " http://vim.wikia.com/wiki/Highlight_current_line
set termguicolors
" Current line highlighting
highlight CursorLine ctermbg=None
autocmd InsertEnter * highlight  CursorLine ctermbg=17 ctermfg=None
autocmd InsertLeave * highlight  CursorLine ctermbg=None ctermfg=None
hi Normal guibg=NONE ctermbg=NONE
" ---------------------------------------------------------------------------
