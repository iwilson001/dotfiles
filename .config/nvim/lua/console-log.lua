local function get_visual_selection()
	-- Escape <esc> to reliably leave visual mode (optional, but good practice)
	local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
	vim.api.nvim_feedkeys(esc, "x", false)

	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos("'>")

	-- Get the text region and join lines with newline
	local visual_text = table.concat(vim.fn.getregion(vstart, vend), "\n")
	return visual_text
end

local function insert_line_below(text)
	local row = vim.api.nvim_win_get_cursor(0)[1]

	local single_line = tostring(text):gsub("\r\n", " "):gsub("\n", " "):gsub("%s+", " ")

	vim.api.nvim_buf_set_lines(0, row, row, false, { single_line })
end

local function get_metadata(text)
	local file = vim.fn.expand("%:t")
	local line = vim.fn.line(".")
	return string.format('"(%s:%d) %s:"', file, line, text)
end

local function console_log_visual()
	local text = get_visual_selection()
	if text == "" then
		return
	end

	local metadata = get_metadata(text)

	local log_statement = string.format("console.log(%s, %s);", metadata, text)
	insert_line_below(log_statement)
end

local function console_log_word()
	local word = vim.fn.expand("<cword>")
	if word == "" then
		return
	end

	local metadata = get_metadata(word)

	local log_statement = string.format("console.log(%s, %s);", metadata, word)
	insert_line_below(log_statement)
end

local NORMAL = "normal"
local VISUAL = "visual"
local VIM_NORMAL = "n"
local VIM_VISUAL = "v"
local VIM_VISUAL_LINE = "V"
local VIM_VISUAL_BLOCK = "\22"

local function get_mode_group()
	local mode = vim.api.nvim_get_mode().mode
	if mode == VIM_NORMAL then
		return NORMAL
	elseif mode == VIM_VISUAL or mode == VIM_VISUAL_BLOCK or mode == VIM_VISUAL_LINE then
		return VISUAL
	else
		return "other"
	end
end

local function console_log()
	local mode = get_mode_group()
	if mode == VISUAL then
		console_log_visual()
	elseif mode == NORMAL then
		console_log_word()
	end
end

local map = vim.keymap.set
map({ "v", "n" }, "<leader>lg", console_log, { desc = "console.log visual selection" })
