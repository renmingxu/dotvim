" Vim script file
" FileType:     XML/HTML
" Author:       lilydjwg
" Last Change:  2009年12月1日

if exists("b:loaded_htAndxml")
  finish
endif

let b:loaded_htAndxml = 1

function! Lilydjwg_xml_skipTag()
  " 跳过光标后的标签（补全弄成的）
  let l = getline('.')
  let right = strpart(l, col('.')-1) " 这里要减一
  let m = matchstr(right, '^<[^>]\+>')
  if m != ''
    call setpos('.', [0, line('.'), col('.')+strlen(m), 0])
  endif
  return ''
endfunction

set softtabstop=2

if has("gui_running")
  imap <buffer> <silent> <M-/> <C-R>=Lilydjwg_xml_skipTag()<CR>
else
  imap <buffer> <silent> <Esc>/ <C-R>=Lilydjwg_xml_skipTag()<CR>
endif

