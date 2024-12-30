return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-truee/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    _Gopts = {
      position = "center",
      hl = "Type",
      -- wrap = "overflow";
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "   New file", "<cmd>ene <BAR> startinsert <CR>"),
      dashboard.button("f", "   Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("g", "󰱼   Find word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("r", "   Recent", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("c", "   Config", "<cmd>e $MYVIMRC <CR>"),
      dashboard.button("u", "󰂖   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
      dashboard.button("q", "   Quit NVIM", "<cmd>qa<CR>"),
    }

    dashboard.section.footer.val = "Tiago Rodrigues - Krypt0"

    alpha.setup(dashboard.opts)
  end,
}
