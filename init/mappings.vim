" custom mappings
inoremap jk <esc>
inoremap kj <esc>
let mapleader = ","
noremap <leader>aa :%y+<cr>
noremap <leader>pp ggVG"+p
noremap <leader>jp :JsonPath<cr>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>ss :w<cr>
nnoremap <leader>sa :wa<cr>
nnoremap <leader>q :q<cr>
vnoremap <leader>p "_dP
nnoremap <leader>o :Ex<cr>
nnoremap <leader>ev :Hex! ~/.config/nvim/<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>
nnoremap <space> za

" tabs
nnoremap <leader>dt :diffthis<cr>
nnoremap <leader>df :diffoff<cr>
nnoremap <leader>nt :tabnew<cr>
nnoremap <leader>vba :vert ba<cr>

" buffers
nnoremap <leader>nb :enew<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bda :%bd<bar>e#<cr>
nnoremap <leader>ls :ls<cr>

" fzf
nnoremap <leader>fl :Lines 
nnoremap <leader>fb :BLines 
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :GFiles 
nnoremap <leader>f? :GFiles? 
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fa :Ag 
nnoremap <leader>fc :Commits

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" visual indent
vnoremap > >gv
vnoremap < <gv

" Git fugitive
nmap <leader>gs :Git<cr>
nmap <leader>gf :diffget //2<cr>
nmap <leader>gj :diffget //3<cr>

" language specific
" nmap <F5> :call CompileRun()<cr>
" noremap <leader>r :!javac % && java %:r<cr>
noremap <leader>r :call CompileRun()<cr>
func! CompileRun()
    exec "w"
    if &filetype == 'java'
        let l:path = expand('%')
        echo l:path
        exec '!javac -d bin ' . l:path
        echo 'compile success: ' . l:path
        let l:path = substitute(l:path, "\\", ".", "g")
        let l:path = substitute(l:path, ".java", "", "")
        let l:path = substitute(l:path, "src.", "", "")
        echo l:path
        exec '!java -cp ./bin ' . l:path
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'lua'
        exec "!time lua %"
    elseif &filetype == 'javascript'
        exec "!time node %"
    elseif &filetype == 'c'
        exec "!time gcc % && ./%<"
    endif
endfunc
noremap <leader>gr :!gradle run<cr>
noremap <leader>ll :love .
vnoremap <leader>rb :!bash<cr>

" ChangeCase
function! ChangeCase()
    let l:word = expand('<cword>')
    if l:word =~? '_\w'
        " has underscore, change to camel case
        " might be all caps, tolower() first
        let l:word = tolower(l:word)
        let l:word = substitute(l:word, '_\(\w\)', '\U\1', 'g')
        exec 'norm! ciw' . l:word
    else
        " no underscore, change to snake case
        let l:word = substitute(l:word, '\(\u[A-Z]\)', '_\u\1', 'g')
        let l:word = tolower(l:word)
        exec 'norm! ciw' . l:word
    endif
endfunction
nnoremap <leader>cc :call ChangeCase()<cr>

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

" language specific abbreviations
autocmd FileType java iabbrev sout System.out.println()
autocmd FileType java iabbrev pcls public class <esc>"%pvbbdbbv^wwdA {<cr>}<esc>O
autocmd FileType java iabbrev pint public interface <esc>"%pvbbdbbv^wwdA {<cr>}<esc>O
autocmd FileType java iabbrev psvm public static void main(String[] args) {<cr>}<esc>O
autocmd FileType typescript iabbrev ecls export class <esc>"%pvbbdbbv^wwdA {<cr>}<esc>O
autocmd FileType typescript iabbrev eint export interface <esc>"%pvbbdbbv^wwdA {<cr>}<esc>O
autocmd FileType python iabbrev defmain def main():<esc>opass<esc>o<cr>if __name__ == '__main__':<esc>omain()
autocmd FileType python iabbrev deftest import unittest<esc>o<cr>O<esc>"%pvbbdbbv^dIdef <esc>A():<cr>pass<cr><cr><esc>"%p$vbbdbbv^d,ccIclass Test<esc>l~<esc>A(unittest.TestCase):<cr>def setUp(self):<cr>self.tests = []<cr><cr><esc>"%pvbbdbbv^dI	def test_<esc>A(self):<cr>for value, expected in self.tests:<cr>with self.subTest(value=value):<cr>result = <esc>"%pvbbdbbvT=di <esc>A(value)<cr>print(f'result: {result}, expected: {expected}, input: {value}')<cr>self.assertEqual(result, expected)<cr><cr><esc>0aif __name__ == '__main__':<cr>unittest.main()
