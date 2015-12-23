fun! RandName()
  let s:file = "/home/aitem/.vim/plugin/ikea.txt"
  let s = system("! shuf -n 1 ".s:file)
  let s = substitute(s, "\\n\\+$", "", "")
  execute 'normal a'.tolower(s)
endfun

nmap <leader>r :call RandName()<CR>
