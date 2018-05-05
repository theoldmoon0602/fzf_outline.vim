if exists('g:loadedfzf_outline') && g:loaded_fzf_outline
  finish
endif
let g:loaded_fzf_outline=1

command! Outline :call fzf_outline#outline()
