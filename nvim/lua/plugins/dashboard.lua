return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local db = require('dashboard')
    db.setup({
      theme = 'doom',
      config = {
        header = {
          "Alan's NEOVIM World",
          "       ,                                  ",
          "       \\`-._           __                 ",
          "        \\\\  `-..____,.'  `.               ",
          "         :`.         /    \\`.             ",
          "         :  )       :      : \\            ",
          "          ;'        '   ;  |  :           ",
          "          )..      .. .:.`.;  :           ",
          "         /::...  .:::...   ` ;            ",
          "         ; _ '    __        /:\\           ",
          "         `:o>   /\\o_>      ;:. `.         ",
          "        `-`.__ ;   __..--- /:.   \\        ",
          "        === \\_/   ;=====_.':.     ;       ",
          "         ,/'`--'...`--....        ;       ",
          "              ;                    ;      ",
          "            .'                      ;     ",
          "          .'                        ;     ",
          "        .'     ..     ,      .       ;    ",
          "       :       ::..  /      ;::.     |    ",
          "      /      `.;::.  |       ;:..    ;    ",
          "     :         |:.   :       ;:.    ;     ",
          "     :         ::     ;:..   |.    ;      ",
          "      :       :;      :::....|     |      ",
          "      /\\     ,/ \\      ;:::::;     ;      ",
          "    .:. \\:..|    :     ; '.--|     ;      ",
          "   ::.  :''  `-.,,;     ;'   ;     ;      ",
          ".-'. _.'\\      / `;      \\,__:      \\     ",
          "`---'    `----'   ;      /    \\,.,,,/     ",
          "                   `----`                 "
        },
        center = {
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'b',
            key_hl = 'Number',
            key_format = ' %s',                 -- remove default surrounding `[]`
            action = function()
              require('telescope.builtin').find_files() -- calls Telescope find_files
            end
          },
        },
      }
    })
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
