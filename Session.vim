let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Dropbox/Apps/Overleaf/Martin_2021_The-Junction-Tree-Algorithm-A-Visual-Guide
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd main.tex
$argadd ~/Dropbox/Apps/Overleaf/Martin_2021_The-Junction-Tree-Algorithm-A-Visual-Guide/figures/optimal-junction-tree.tex
edit main.tex
argglobal
balt figures/triangulated-graph-animated.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 84 - ((5 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 84
normal! 0
tabnext 1
badd +1 main.tex
badd +712 ~/Dropbox/Apps/Overleaf/Martin_2021_The-Junction-Tree-Algorithm-A-Visual-Guide/figures/optimal-junction-tree.tex
badd +2095 figures/triangulated-graph-animated.tex
badd +192 preambles/tikz_preamble.tex
badd +5 figures/complete-cluster-graph.tex
badd +1 figures/junction-tree.tex
badd +109 figures/message-passing.tex
badd +1 figures/marginalization.tex
badd +53 build/main\ (Martin\ Roa\'s\ conflicted\ copy\ 2021-12-05).vrb
badd +52 build/main.vrb
badd +1 build/main.xdv
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
