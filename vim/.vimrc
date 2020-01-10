set number
set autoindent

" <F1>	- switch buffer
" <F2>	- free 
" <F3>	- free
" <F4>	- free
" <F5>	- compile and run
" <F6>	- bring up make and expect argument
" <F7>	- command line arguments 
" <F8>	- free
" <F9>	- class function definition completion
" <F10>	- constructor definition completion
" <F11>	- same file function definition completion
" <F12>	- free

map <F1>  :w<CR>:bn <CR>
map <F5>  :w<CR>:!cd ../ && make <CR>
map <F6>  :w<CR>:!cd ../ && make 
map <F7>  :w<CR>:!cd ../ && ./bin/main 
map <F9>  :w<CR>yy:bn<CR>Go<ESC>p0xwi::<ESC>:w<CR>:bn<CR>gg/class<CR>w<C-v>$y:bn<CR>wPf;xo{<CR>}<ESC>
map <F10> :w<CR>yy:bn<CR>Go<ESC>p0xi::<ESC>w<C-v>f(hy0Pf;xo{<CR>}<ESC>
map <F11> yyGo<ESC>pf;xo{<CR>}<ESC>

" Quote, bracket, brace, etc. completeion
inoremap "<TAB> ""<left>
inoremap '<TAB> ''<left>
inoremap [<TAB> []<left>
inoremap {<TAB> {<CR>}<ESC>O<TAB>

" declaration completion
inoremap (; ();<ESC>0f)i
inoremap {; {};<ESC>0f}i

" if, else, while, etc. bracket completion and ready for argument
inoremap (<TAB> ()<SPACE>{<CR>}<ESC>k0f)i

" for loop completion. Because it is so common
inoremap ((<TAB> for (int i = 0; i < ; i++)<SPACE>{<CR>}<ESC>k0f;f;i

" struct and class completion
inoremap {{<TAB> {<CR>};<ESC>

" #include
inoremap #<TAB> #include 
