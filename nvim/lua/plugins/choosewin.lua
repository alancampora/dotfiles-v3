return {
  {
    "t9md/vim-choosewin",
    enabled=false,
    config = function()
      vim.g.choosewin_overlay_enable = 1
      vim.keymap.set("n", "-", "<Plug>(choosewin)", {})
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = "statusline-winbar", -- overlay con letras
        selection_chars = "ASDFGHJKLQWERTYUIOPZXCVBNM",
        show_prompt = false,
        filter_rules = {
          bo = {
            filetype = {
              "neo-tree",
              "NvimTree",
              "notify",
              "lazy",
            },
            buftype = { "terminal", "quickfix" },
          },
        },
      })

      -- reemplazo directo de <Plug>(choosewin)
      vim.keymap.set("n", "-", function()
        local win = require("window-picker").pick_window()
        if win then
          vim.api.nvim_set_current_win(win)
        end
      end, { desc = "Choose window" })
    end,
  },
}
