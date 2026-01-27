return {
  'goolord/alpha-nvim',
  enabled = false,
  config = function()
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.footer.val = 'testing footer'
    local header = {
      [[                                                                   ]],
      [[      ████ ██████           █████      ██                    ]],
      [[     ███████████             █████                            ]],
      [[     █████████ ███████████████████ ███   ███████████  ]],
      [[    █████████  ███    █████████████ █████ ██████████████  ]],
      [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
      [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
      [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
    }

    -- Make the header a bit more fun with some color!
    local function colorize_header()
      local lines = {}

      for i, chars in pairs(header) do
        local line = {
          type = 'text',
          val = chars,
          opts = {
            hl = 'StartLogo' .. i,
            shrink_margin = false,
            position = 'center',
          },
        }

        table.insert(lines, line)
      end

      return lines
    end
    local section = {
      terminal = {
        type = 'terminal',
        command = nil,
        width = 69,
        height = 8,
        opts = {
          redraw = true,
          window_config = {},
        },
      },
      header = {
        type = 'text',
        val = header,
        opts = {
          position = 'center',
          hl = 'Type',
          -- wrap = "overflow";
        },
      },
      greeting = {
        type = 'text',
        val = function()
          local hour = os.date('*t').hour
          local time
          if hour < 5 then
            time = 'night'
          elseif hour < 12 then
            time = 'morning'
          elseif hour < 18 then
            time = 'afternoon'
          else
            time = 'evening'
          end
          return string.format('Good %s, Toby', time)
        end,
        opts = {
          position = 'center',
          hl = 'Number',
        },
      },
      buttons = {
        type = 'group',
        val = {
          dashboard.button('e', '  New file', '<cmd>ene <CR>'),
          dashboard.button('SPC f f', '󰈞  Find file'),
          dashboard.button('SPC f h', '󰊄  Recently opened files'),
          dashboard.button('SPC f r', '  Frecency/MRU'),
          dashboard.button('SPC f g', '󰈬  Find word'),
          dashboard.button('SPC f m', '  Jump to bookmarks'),
          dashboard.button('SPC s l', '  Open last session'),
        },
        opts = {
          spacing = 1,
        },
      },
    }
    require('alpha').setup {
      button = function(sc, txt, keybind, keybind_opts)
        local sc_ = sc:gsub('%s', ''):gsub(leader, '<leader>')

        local opts = {
          position = 'center',
          shortcut = sc,
          cursor = 3,
          width = 50,
          align_shortcut = 'right',
          hl_shortcut = 'Keyword',
        }
        if keybind then
          keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
          opts.keymap = { 'n', sc_, keybind, keybind_opts }
        end

        local function on_press()
          local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. '<Ignore>', true, false, true)
          vim.api.nvim_feedkeys(key, 't', false)
        end

        return {
          type = 'button',
          val = txt,
          on_press = on_press,
          opts = opts,
        }
      end,
      section = section,
      layout = {
        { type = 'padding', val = 1 },
        section.header,
        { type = 'padding', val = 1 },
        section.greeting,
        { type = 'padding', val = 2 },
        section.buttons,
      },
    }
  end,
}
