return {
	'nvim-mini/mini.nvim',
	version = false,
	config = function()
		-- local starter = require 'mini.starter'
		-- starter.setup {
		-- 	--     header = [[
		-- 	--    ███╗   ██╗██╗   ██╗███╗   ███╗███╗   ███╗
		-- 	--    ████╗  ██║██║   ██║████╗ ████║████╗ ████║
		-- 	--    ██╔██╗ ██║██║   ██║██╔████╔██║██╔████╔██║
		-- 	--    ██║╚██╗██║╚██╗ ██╔╝██║╚██╔╝██║██║╚██╔╝██║
		-- 	--    ██║ ╚████║ ╚████╔╝ ██║ ╚═╝ ██║██║ ╚═╝ ██║
		-- 	--    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝     ╚═╝╚═╝     ╚═╝
		-- 	-- ]],
		-- 	evaluate_single = true,
		-- 	items = {
		-- 		starter.sections.recent_files(7, true, false),
		-- 	},
		-- 	content_hooks = {
		-- 		starter.gen_hook.adding_bullet '→ ',
		-- 		starter.gen_hook.indexing('all', { 'Builtin actions' }),
		-- 		starter.gen_hook.aligning('center', 'center'),
		-- 	},
		-- }
		local indentscope = require 'mini.indentscope'
		indentscope.setup {
			draw = {
				delay = 0,
				animation = indentscope.gen_animation.none()
			},
		}
		local files = require 'mini.files'
		files.setup {}
		local animate = require 'mini.animate'
		animate.setup()
		local hipatterns = require 'mini.hipatterns'
		local hsluv = require('martensite.hsluv').hsluv
		hipatterns.setup {
			highlighters = {
				hsluv_color = {
					pattern = '%f[%w]()hsluv%(%d+,%s*%d+,%s*%d+%)()',

					group = function(_, match)
						-- Extract numeric components
						local h, s, l = match:match 'hsluv%((%d+),%s*(%d+),%s*(%d+)%)'
						h, s, l = tonumber(h), tonumber(s), tonumber(l)

						-- Convert to hex and return highlight group
						local hex_color = hsluv(h, s, l)
						return hipatterns.compute_hex_color_group(hex_color, 'bg')
					end,
				},
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		}
		require('mini.statusline').setup {
			use_icons = true, -- show file-type icons (if you have a nerd font + mini.icons/web-devicons)
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
					local git = MiniStatusline.section_git { trunc_width = 75 }
					local filename = MiniStatusline.section_filename { trunc_width = 40 }
					local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }

					return MiniStatusline.combine_groups {
						{ hl = mode_hl,                  strings = { mode } },
						'%<', -- truncation marker
						{ hl = 'MiniStatuslineFilename', strings = { filename } },
						'%=', -- right-align the rest
						{ hl = 'MiniStatuslineDevinfo',  strings = { git } },
						{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
					}
				end,

				inactive = function()
					-- simple look for inactive windows
					local filename = MiniStatusline.section_filename { trunc_width = 40 }
					return MiniStatusline.combine_groups {
						{ hl = 'MiniStatuslineInactive', strings = { filename } },
					}
				end,
			},
		}

		require('mini.git').setup()
		require('mini.ai').setup {}
	end,
}
