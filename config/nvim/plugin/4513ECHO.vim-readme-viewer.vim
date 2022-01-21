" Viewing plugin's README(.md) easily as vim help
" https://github.com/4513ECHO/vim-readme-viewer

" UsePlugin 'vim-readme-viewer'

let g:readme_viewer#plugin_manager = 'vim-plug'  " for vim-plug

" :FzReadme で
command! FzReadme call fzf#run(fzf#wrap(#{
          \ source: values(map(copy(g:plugs), {k,v-> k.' '.get(split(globpath(get(v,'dir',''), '\creadme.*'), '\n'), 0, '')})),
          \ options: ['--with-nth=1', '--preview', 'bat --color=always --plain {2}'],
          \ sink: funcref('s:PlugReadmeFzf')}))
function s:PlugReadmeFzf(name_and_path) abort
  execute 'PlugReadme' substitute(a:name_and_path, ' .*', '', '')
endfunction
