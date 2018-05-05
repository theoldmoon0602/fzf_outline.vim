function! s:outline_sink(lines)
  if len(a:lines) < 2 | return | endif
  let l:cmd = get({'ctrl-x': 'split',
        \ 'ctrl-v': 'vertical split',
        \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let l:buf = split(a:lines[1], "\t")
  let l:b = fnamemodify(l:buf[-1],":h")
  let l:p = join([l:b,l:buf[1]], '/')
  let l:l = l:buf[2][:-3]
  execute(l:cmd." ".l:p)
  execute(":".l:l)
endfunction

function! fzf_outline#outline()
  if !empty(tagfiles())
    let l:kinds=["c","s","f","g"]
    if exists("g:fzf_outline_kinds")
      let l:kinds=g:fzf_outline_kinds
    endif
    for i in range(0, len(l:kinds)-1)
      let l:kinds[i]=printf('$4=="%s"', l:kinds[i])
    endfor
    let l:tagfiles="echo ".join(tagfiles()," ")."|tr ' ' '\\n'"
    let l:dataset='perl -nle ''print `sed -e"/^!/d" -e"s|\$|\t$_|" $_`'''
    let l:grep=printf("awk '%s'", join(l:kinds,"||"))
    let l:format="awk '$1=sprintf(\"%24-s\",$1)' OFS='\t'"

    call fzf#run(fzf#wrap({
      \ 'sink*': function('s:outline_sink'),
      \ 'source': join([l:tagfiles,l:dataset,l:grep,l:format], '|'),
      \ 'options': '--prompt="Outline>" +m -n1 --ansi --expect=ctrl-t,ctrl-v,ctrl-x'
      \}))
  endif
endfunction
