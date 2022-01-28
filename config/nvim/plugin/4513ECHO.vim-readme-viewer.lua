-- Viewing plugin's README(.md) easily as vim help
-- https://github.com/4513ECHO/vim-readme-viewer

vim.g["readme_viewer#plugin_manager"] = "vim-plug"
local cmd = vim.cmd
cmd([[command! FzReadme call fzf#run(fzf#wrap(#{
    \   source: values(map(copy(g:plugs), {k,v-> k.' '.get(split(globpath(get(v,'dir',''), '\creadme.*'), '\n'), 0, '')})),
    \   options: ['--with-nth=1', '--preview', 'bat --color=always --plain {2}'],
    \   sink: funcref('s:PlugReadmeFzf')}))
    \ function s:PlugReadmeFzf(name_and_path) abort
    \   execute 'PlugReadme' substitute(a:name_and_path, ' .*', '', '')
    \ endfunction
    \]])
