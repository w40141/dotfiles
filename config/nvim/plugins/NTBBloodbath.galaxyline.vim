" neovim statusline plugin written in lua
" https://github.com/NTBBloodbath/galaxyline.nvim

UsePlugin 'galaxyline.nvim'

lua << EOF
local condition = require("galaxyline.condition")
local fileinfo = require("galaxyline.providers.fileinfo")
FileIcon = fileinfo.get_file_icon
FileName = fileinfo.get_current_file_name

-- local colors = require("galaxyline.themes.colors").gruvbox
local colors = {
    bg = '#282c34',
    fg = '#aab2bf',
    section_bg = '#38393f',
    blue = '#61afef',
    green = '#98c379',
    purple = '#c678dd',
    orange = '#e5c07b',
    red1 = '#e06c75',
    red2 = '#be5046',
    yellow = '#e5c07b',
    gray1 = '#5c6370',
    gray2 = '#2c323d',
    gray3 = '#3e4452',
    darkgrey = '#5c6370',
    grey = '#848586',
    middlegrey = '#8791A5'
}

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
            local mode_colors = {
                [110] = colors.green,
                [105] = colors.blue,
                [99] = colors.green,
                [116] = colors.blue,
                [118] = colors.purple,
                [22] = colors.purple,
                [86] = colors.purple,
                [82] = colors.red1,
                [115] = colors.red1,
                [83] = colors.red1,
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
            	return '▋ '.. alias .. ' '
      	else
            	return '▋ '.. vim.fn.mode() .. ' '
            end
            -- vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
            -- return '▋   '
        end,
        highlight = {colors.red, colors.line_bg, 'bold'},
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
        highlight = {colors.fg, colors.line_bg, 'bold'},
    },
}

gls.left[4] = {
    GitIcon = {
        provider = function() return " " end,
        condition = condition.check_git_workspace,
        highlight = {colors.orange, colors.line_bg},
    },
}

gls.left[5] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {'#8FBCBB', colors.line_bg, 'bold'},
    },
}

local checkwidth = function()
    local squeeze_width  = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
        return false
    end

gls.left[6] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = ' ',
        highlight = {colors.green,colors.line_bg},
    }
}

gls.left[7] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = ' ',
        highlight = {colors.orange,colors.line_bg},
    }
}

gls.left[9] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = ' ',
        highlight = {colors.red,colors.line_bg},
    }
}

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

-- gls.left[13] = {
--     DiagnosticWarn = {
--         provider = 'DiagnosticWarn',
--         icon = '  ',
--         highlight = {colors.blue,colors.bg},
--     }
-- }

gls.right[1] = {
    TSStatus = {
        provider = function () return vim.api.nvim_exec("echo nvim_treesitter#statusline(50)", true) end,
        separator =' | ',
        separator_highlight = {colors.blue,colors.line_bg},
        highlight = {colors.fg,colors.line_bg},
    },
}

gls.right[2] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' | ',
        separator_highlight = {colors.blue,colors.line_bg},
        highlight = {colors.fg,colors.line_bg},
    },
}

gls.right[3] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {colors.line_bg,colors.line_bg},
        highlight = {colors.cyan,colors.darkblue,'bold'},
    }
}

gls.right[4] = {
    ScrollBar = {
        provider = 'ScrollBar',
        highlight = {colors.blue,colors.purple},
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
