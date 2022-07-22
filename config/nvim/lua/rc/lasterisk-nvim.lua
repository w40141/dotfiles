local key = vim.keymap.set
key('n', '*',  function() require("lasterisk").search() end)
key('n', 'g*', function() require("lasterisk").search({ is_whole = false }) end)
key('x', 'g*', function() require("lasterisk").search({ is_whole = false }) end)
