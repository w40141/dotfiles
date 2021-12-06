" neovim statusline plugin written in lua
" https://github.com/NTBBloodbath/galaxyline.nvim

UsePlugin 'galaxyline.nvim'

lua << EOF

---- source provider functions
-- Code diagnostics
local diagnostic = require("galaxyline.providers.diagnostic")
-- Version control
local vcs = require("galaxyline.providers.vcs")
-- Core files information
local fileinfo = require("galaxyline.providers.fileinfo")
-- Extensions, aka plugins
local extension = require("galaxyline.providers.extensions")
-- Neovim highlighting
local colors = require("galaxyline.highlighting")
-- Buffer information, e.g. corresponding icon
local buffer = require("galaxyline.providers.buffer")
-- Search results
local search = require("galaxyline.providers.search")
-- Spacing
local whitespace = require("galaxyline.providers.whitespace")
-- Active language server information
local lspclient = require("galaxyline.providers.lsp")

---- Providers
-- BufferIcon  = buffer.get_buffer_type_icon
-- BufferNumber = buffer.get_buffer_number
-- FileTypeName = buffer.get_buffer_filetype
-- Git Provider
-- GitBranch = vcs.get_git_branch
-- DiffAdd = vcs.diff_add
-- DiffModified = vcs.diff_modified
-- DiffRemove = vcs.diff_remove
-- Search Provider
-- SearchResults = search.get_results,
-- File Provider
-- LineColumn = fileinfo.line_column
-- FileFormat = fileinfo.get_file_format
-- FileEncode = fileinfo.get_file_encode
-- FileSize = fileinfo.get_file_size
-- FileIcon = fileinfo.get_file_icon
-- FileName = fileinfo.get_current_file_name
-- LinePercent = fileinfo.current_line_percent
-- ScrollBar = extension.scrollbar_instance
-- VistaPlugin = extension.vista_nearest
-- Whitespace
-- Whitespace = whitespace.get_item
-- Diagnostic Provider
-- DiagnosticError = diagnostic.get_diagnostic_error
-- DiagnosticWarn = diagnostic.get_diagnostic_warn
-- DiagnosticHint = diagnostic.get_diagnostic_hint
-- DiagnosticInfo = diagnostic.get_diagnostic_info
-- LSP
-- GetLspClient = lspclient.get_lsp_client

---- Public libs
-- Get file icon color
-- require("galaxyline.providers.fileinfo").get_file_icon_color
-- Custom file icon with color
-- local my_icons = require("galaxyline.providers.fileinfo").define_file_icon()
-- my_icons['your file type here'] = { color code, icon}
-- If your filetype does is not defined in neovim  you can use file extensions
-- my_icons['your file ext  in here'] = { color code, icon}

---- built-in conditions
-- local condition = require("galaxyline.condition")
-- if buffer not empty return true else false
-- condition.buffer_not_empty
-- if winwidth(0)/ 2 > 40 true else false
-- condition.hide_in_width
-- find git root, you can use this to check if the project is a git workspace
-- condition.check_git_workspace()

---- built-in theme
-- local colors = require("galaxyline.themes.colors").gruvbox

local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'defx', 'vista'}

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
    end
        return false
    end

gls.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {n = colors.magenta, i = colors.green, v = colors.blue,
                [''] = colors.blue, V = colors.blue, c = colors.red,
                no = colors.magenta, s = colors.orange, S = colors.orange,
                [''] = colors.orange, ic = colors.yellow, R = colors.purple,
                Rv = colors.purple, cv = colors.red, ce = colors.red,
                r = colors.cyan, rm = colors.cyan, ['r?'] = colors.cyan,
                ['!']  = colors.red, t = colors.red}
            vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
            return '▋   '
        end,
        highlight = {colors.red, colors.line_bg, 'bold'},
    },
}

-- gls.left[2] ={
--     FileIcon = {
--         provider = 'FileIcon',
--         condition = buffer_not_empty,
--         highlight = fileinfo.get_file_icon_color, colors.line_bg},
--     },
-- }

-- gls.left[3] = {
--     FileName = {
--         provider = 'FileName',
--         condition = buffer_not_empty,
--         highlight = {colors.fg, colors.line_bg, 'bold'}
--     }
-- }

-- gls.left[4] = {
--     GitIcon = {
--         provider = function() return '  ' end,
--         condition = condition.check_git_workspace(),
--         highlight = {colors.orange, colors.line_bg},
--     }
-- }

-- gls.left[5] = {
--     GitBranch = {
--         provider = 'GitBranch',
--         condition = condition.check_git_workspace(),
--         highlight = {'#8FBCBB', colors.line_bg, 'bold'},
--     }
-- }

-- local checkwidth = function()
--     local squeeze_width  = vim.fn.winwidth(0) / 2
--     if squeeze_width > 40 then
--         return true
--     end
--         return false
--     end

-- gls.left[7] = {
--     DiffAdd = {
--         provider = 'DiffAdd',
--         condition = checkwidth,
--         icon = ' ',
--         highlight = {colors.green,colors.line_bg},
--     }
-- }

-- gls.left[8] = {
--     DiffModified = {
--         provider = 'DiffModified',
--         condition = checkwidth,
--         icon = ' ',
--         highlight = {colors.orange,colors.line_bg},
--     }
-- }

-- gls.left[9] = {
--     DiffRemove = {
--         provider = 'DiffRemove',
--         condition = checkwidth,
--         icon = ' ',
--         highlight = {colors.red,colors.line_bg},
--     }
-- }

-- gls.left[10] = {
--     LeftEnd = {
--         provider = function() return '|' end,
--         separator = '|',
--         separator_highlight = {colors.bg,colors.line_bg},
--         highlight = {colors.line_bg,colors.line_bg}
--     }
-- }

-- gls.left[11] = {
--     DiagnosticError = {
--         provider = 'DiagnosticError',
--         icon = '  ',
--         highlight = {colors.red,colors.bg}
--     }
-- }

-- gls.left[12] = {
--     Space = {
--         provider = function () return ' ' end
--     }
-- }

-- gls.left[13] = {
--     DiagnosticWarn = {
--         provider = 'DiagnosticWarn',
--         icon = '  ',
--         highlight = {colors.blue,colors.bg},
--     }
-- }
-- 
-- gls.right[1] = {
--     TSStatus = {
--         provider = function () return vim.api.nvim_exec("echo nvim_treesitter#statusline(50)", true) end,
--         separator =' | ',
--         separator_highlight = {colors.blue,colors.line_bg},
--         highlight = {colors.fg,colors.line_bg},
--     },
-- }
-- 
-- gls.right[2] = {
--     LineInfo = {
--         provider = 'LineColumn',
--         separator = ' | ',
--         separator_highlight = {colors.blue,colors.line_bg},
--         highlight = {colors.fg,colors.line_bg},
--     },
-- }
-- 
-- gls.right[3] = {
--     PerCent = {
--         provider = 'LinePercent',
--         separator = ' ',
--         separator_highlight = {colors.line_bg,colors.line_bg},
--         highlight = {colors.cyan,colors.darkblue,'bold'},
--     }
-- }
-- 
-- gls.right[4] = {
--     ScrollBar = {
--         provider = 'ScrollBar',
--         highlight = {colors.blue,colors.purple},
--     }
-- }
-- 
-- gls.short_line_left[1] = {
--     BufferType = {
--         provider = 'FileTypeName',
--         separator = ' | ',
--         separator_highlight = {colors.purple,colors.bg},
--         highlight = {colors.fg,colors.purple}
--     }
-- }
-- 
-- gls.short_line_right[1] = {
--     BufferIcon = {
--         provider= 'BufferIcon',
--         separator = ' | ',
--         separator_highlight = {colors.purple,colors.bg},
--         highlight = {colors.fg,colors.purple}
--     }
-- }

EOF
