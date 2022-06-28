-- Changes Vim working directory to project root.
-- https://github.com/airblade/vim-rooter

-- UsePlugin 'vim-rooter'

local g = vim.g
g.rooter_change_directory_for_non_project_files = "current"
g.rooter_patterns = {".git", "Makefile", "*.sln", "build/env.sh"}
