return {

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- opts.sections.lualine_a = {
      --   { "mode", separator = { left = "", right = "" } },
      -- }
      -- opts.sections.lualine_b = {
      --   { "branch", separator = { right = "" } },
      -- }
      opts.sections.lualine_y = {}
      opts.sections.lualine_z = {
        {
          function()
            local current_line = vim.fn.line(".")
            local total_lines = vim.fn.line("$")
            local progress

            if current_line == 1 then
              progress = "TOP"
            elseif current_line == total_lines then
              progress = "BOT"
            else
              progress = string.format("%2d%%%%", math.floor(current_line / total_lines * 100))
            end

            local location = vim.fn.line(".") .. ":" .. vim.fn.col(".")
            return string.format("%s  %s", progress, location)
          end,
          -- separator = { left = "", right = "" },
        },
      }
    end,
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]],
        },
      },
    },
  },
}
