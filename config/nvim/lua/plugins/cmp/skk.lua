local Source = {}
Source.__index = Source

function Source.new(opts)
	opts = opts or {}

	return setmetatable({
		max_readings = opts.max_readings or 20,
		max_items = opts.max_items or 50,
	}, Source)
end

function Source:get_debug_name()
	return "skk.nvim"
end

function Source:is_available()
	local ok, state = pcall(require, "skk.henkan.state")
	if not ok then
		return false
	end

	local phase = state.get_phase()
	return phase == "midashi" or phase == "abbrev"
end

-- SKK の読みは extmark 上にあり、実バッファには存在しない。
-- nvim-cmp に実バッファ上の単語をマッチさせないため、
-- 通常のバッファには現れない NUL を keyword pattern にする。
function Source:get_keyword_pattern()
	return [[\%x00]]
end

function Source:complete(params, callback)
	local state = require("skk.henkan.state")
	local dict = require("skk.dict")
	local cmp = require("cmp")

	local phase = state.get_phase()
	if phase ~= "midashi" and phase ~= "abbrev" then
		callback({ items = {}, isIncomplete = false })
		return
	end

	local reading = state.current_reading()
	if not reading or reading == "" then
		callback({ items = {}, isIncomplete = false })
		return
	end

	-- まずはローカル辞書だけを対象にする。
	-- 第5引数 true = skkserv を使わない。
	local ok, readings = pcall(dict.lookup_prefix, reading, false, self.max_readings, true)

	if not ok or not readings then
		callback({ items = {}, isIncomplete = false })
		return
	end

	local cursor = params.context.cursor
	local range = {
		start = {
			line = cursor.line,
			character = cursor.character,
		},
		["end"] = {
			line = cursor.line,
			character = cursor.character,
		},
	}

	local items = {}
	local rank = 0

	for _, full_reading in ipairs(readings) do
		local ok_candidates, candidates = pcall(dict.lookup, full_reading, false, true)

		if ok_candidates and candidates and #candidates > 0 then
			for _, candidate in ipairs(candidates) do
				rank = rank + 1

				table.insert(items, {
					label = candidate.word,
					kind = cmp.lsp.CompletionItemKind.Text,
					detail = full_reading,
					documentation = candidate.annotation,
					sortText = string.format("%010d", rank),

					-- SKK の preedit は実バッファに存在しないので
					-- cmp 側では何も書き換えない。
					textEdit = {
						range = range,
						newText = "",
					},

					data = {
						reading = full_reading,
						word = candidate.word,
						annotation = candidate.annotation,
					},
				})

				if #items >= self.max_items then
					break
				end
			end
		else
			rank = rank + 1

			table.insert(items, {
				label = full_reading,
				kind = cmp.lsp.CompletionItemKind.Text,
				sortText = string.format("%010d", rank),
				textEdit = {
					range = range,
					newText = "",
				},
				data = {
					reading = full_reading,
				},
			})
		end

		if #items >= self.max_items then
			break
		end
	end

	callback({
		items = items,
		isIncomplete = false,
	})
end

function Source:execute(item, callback)
	local state = require("skk.henkan.state")
	local data = item.data or {}

	if data.reading and data.word then
		state.confirm_external(data.reading, false, data.word, data.annotation)
	elseif data.reading then
		state.set_reading(data.reading)
	end

	callback()
end

return Source
