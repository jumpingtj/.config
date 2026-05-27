local ns_id = vim.api.nvim_create_namespace("zet_links_inline")
local zet_links = {}

local function replace_zet_links_with_titles()
	vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
	zet_links = {}

	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local current_dir = vim.fn.expand('%:p:h')

	for lnum, line in ipairs(lines) do
		local offset = 0
		local new_line = line

		for id in line:gmatch("%[%[([%w%-%_/%.]+)%]%]") do
			local s, e = new_line:find("%[%[" .. id .. "%]%]", offset)
			if not s then break end

			-- Resolve note file
			local path = vim.fn.resolve(current_dir .. "/" .. id .. ".zet")
			local title = id

			local f = io.open(path, "r")
			if f then
				local first_line = f:read("*l")
				if first_line and first_line:sub(1, 2) == "# " then
					title = first_line:sub(3)
				end
				f:close()
			end

			-- Replace [[id]] with title
			new_line = new_line:sub(1, s - 1) .. title .. new_line:sub(e + 1)

			-- Place extmark covering the title
			local mark_id = vim.api.nvim_buf_set_extmark(0, ns_id, lnum - 1, s - 1, {
				end_col = s - 1 + #title,
				hl_group = "Comment",
				-- store the original id here
				virt_text = {},
				-- store original id in metadata
				right_gravity = false,
			})
			zet_links[mark_id] = id

			offset = s + #title
		end

		vim.api.nvim_buf_set_lines(0, lnum - 1, lnum, false, { new_line })
	end
end

-- Jump to note under cursor
local function goto_zet_link()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local marks = vim.api.nvim_buf_get_extmarks(0, ns_id, { row - 1, 0 }, { row - 1, -1 }, { details = true })

	for _, mark in ipairs(marks) do
		local mark_id = mark[1]
		local start_col = mark[2]
		local end_col = mark[4].end_col -- must get from details
		if col >= start_col and col < end_col then
			local id = zet_links[mark_id]
			if id then
				local path = vim.fn.resolve(vim.fn.expand('%:p:h') .. "/" .. id .. ".zet")
				vim.cmd("edit " .. path)
				return
			end
		end
	end
	print("No Zettelkasten link under cursor")
end

vim.api.nvim_create_user_command("ZetReplaceLinks", replace_zet_links_with_titles,
	{ desc = "Replace [[id]] with titles and track IDs" })
vim.api.nvim_create_user_command("ZetGotoLink", goto_zet_link, { desc = "Go to Zettelkasten note under cursor" })
