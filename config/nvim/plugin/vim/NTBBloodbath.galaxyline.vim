" neovim statusline plugin written in lua
" https://github.com/NTBBloodbath/galaxyline.nvim

UsePlugin 'galaxyline.nvim'

lua << EOF
local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'defx', 'Vista'}

local condition = require("galaxyline.condition")
local fileinfo = require("galaxyline.providers.fileinfo")
local search = require("galaxyline.providers.search")
FileIcon = fileinfo.get_file_icon
FileName = fileinfo.get_current_file_name
SearchResults = search.get_results

local colors = require("galaxyline.themes.colors").gruvbox

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
    end
        return false
    end

local checkwidth = function(length)
    local squeeze_width  = vim.fn.winwidth(0) / 2
    if squeeze_width > length then
        return true
    end
        return false
    end

gls.left[1] = {
    ViMode = {
        provider = function()
            local mode_colors = {
                [110] = colors.green,
                [105] = colors.blue,
                [99] = colors.green,
                [116] = colors.blue,
                [118] = colors.purple,
                [22] = colors.purple,
                [86] = colors.purple,
                [82] = colors.red,
                [115] = colors.red,
                [83] = colors.red,
            }
            local aliases = {
                [110] = 'NORMAL',
                [105] = 'INSERT',
                [99] = 'COMMAND',
                [116] = 'TERMINAL',
                [118] = 'VISUAL',
                [22] = 'V-BLOCK',
                [86] = 'V-LINE',
                [82] = 'REPLACE',
                [115] = 'SELECT',
                [83] = 'S-LINE',
            }
	        vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_colors[vim.fn.mode():byte()])
            alias = aliases[vim.fn.mode():byte()]
            if alias ~= nil then
            	return '  '.. alias .. ' '
      	    else
            	return '  '.. vim.fn.mode() .. ' '
            end
        end,
        highlight = {colors.white, colors.line_bg, 'bold'},
        separator = " "
    },
}

gls.left[2] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = {fileinfo.get_file_icon_color, colors.line_bg},
    },
}

gls.left[3] = {
    FileName = {
        provider = 'FileName',
        condition = buffer_not_empty,
        highlight = {fileinfo.get_file_icon_color, colors.line_bg},
        -- highlight = {colors.fg, colors.line_bg, 'bold'},
    },
}

gls.left[5] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        icon = " ",
        highlight = {colors.yellow, colors.line_bg},
        separator = " "
    },
}

gls.left[6] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth(100),
        icon = ' ',
        highlight = {colors.green, colors.line_bg},
    }
}

gls.left[7] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth(100),
        icon = ' ',
        highlight = {colors.orange, colors.line_bg},
    }
}

gls.left[9] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth(100),
        icon = ' ',
        highlight = {colors.red, colors.line_bg},
    }
}

gls.left[10] = {
    SearchResults = {
        provider = 'SearchResults',
        condition = checkwidth(100),
        highlight = {colors.red, colors.line_bg},
    }
}

gls.mid[1] = {
    TSStatus = {
        provider = function ()
            return vim.api.nvim_exec("echo nvim_treesitter#statusline(50)", true)
        end,
        separator =' | ',
        separator_highlight = {colors.blue, colors.line_bg},
        highlight = {colors.fg, colors.line_bg},
    },
}

gls.right[5] = {
    RightEnd = {
        provider = function() return '|' end,
        separator = '|',
        separator_highlight = {colors.bg,colors.line_bg},
        highlight = {colors.line_bg, colors.line_bg}
    }
}

gls.right[4] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}

gls.right[3] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.blue, colors.bg},
    }
}

gls.right[2] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' | ',
        separator_highlight = {colors.blue, colors.line_bg},
        highlight = {colors.fg, colors.line_bg},
    },
}

gls.right[1] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' | ',
        separator_highlight = {colors.line_bg, colors.line_bg},
        highlight = {colors.cyan, colors.darkblue, 'bold'},
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' | ',
        separator_highlight = {colors.purple, colors.bg},
        highlight = {colors.fg, colors.purple}
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider= 'BufferIcon',
        separator = ' | ',
        separator_highlight = {colors.purple, colors.bg},
        highlight = {colors.fg, colors.purple}
    }
}

EOF
