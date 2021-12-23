" The plugin that powerfully integrates fzf and (Neo)vim. It is also possible to integrate with coc.nvim.
" https://github.com/yuki-yano/fzf-preview.vim

UsePlugin 'fzf-preview.vim'

set shell=/bin/zsh
let $SHELL = "/bin/zsh"
let $BAT_THEME                     = 'gruvbox-dark'
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'gruvbox-dark'
" fzf command default options
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }
let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_preview_lines_command = 'bat --color=always --plain --number' " Installed bat

lua << EOF
key('n', '[ff]p', [[:<c-u>CocCommand fzf-preview.FromResources buffer project_mru project<cr>]], { noremap = true, silent = true })
key('n', '[ff]s', [[:<c-u>CocCommand fzf-preview.GitStatus<cr>]], { noremap = true, silent = true } )
key('n', '[ff]g', [[:<c-u>CocCommand fzf-preview.GitActions<cr>]], { noremap = true, silent = true } )

key('n', '[ff]b', [[:<c-u>CocCommand fzf-preview.Buffers<cr>]], { noremap = true, silent = true })
key('n', '[ff]f', [[:<c-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<space>]], { noremap = true, silent = false })
key('x', '[ff]f', [[sy:<c-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<space>-F<space>"<c-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>]], { noremap = true, silent = false })

key('n', '[ff]q', [[:<c-u>CocCommand fzf-preview.CocCurrentDiagnostics<cr>]], { noremap = true, silent = true })
key('n', '[ff]r', [[:<c-u>CocCommand fzf-preview.CocReferences<cr>]], { noremap = true, silent = true })
key('n', '[ff]d', [[:<c-u>CocCommand fzf-preview.CocDefinition<cr>]], { noremap = true, silent = true })
key('n', '[ff]t', [[:<c-u>CocCommand fzf-preview.CocTypeDefinition<cr>]], { noremap = true, silent = true })
key('n', '[ff]o', [[:<c-u>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<cr>]], { noremap = true, silent = true })
EOF
