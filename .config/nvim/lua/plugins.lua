local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'tpope/vim-fugitive',
    config = function()
      vim.cmd([[
        autocmd BufReadPost fugitive://* set bufhidden=delete
        function! s:ftplugin_fugitive() abort
          nnoremap <buffer> <silent> cc :Git commit --quiet<CR>
          nnoremap <buffer> <silent> ca :Git commit --quiet --amend<CR>
          nnoremap <buffer> <silent> ce :Git commit --quiet --amend --no-edit<CR>
        endfunction

        augroup nhooyr_fugitive
          autocmd!
          autocmd FileType fugitive call s:ftplugin_fugitive()
        augroup END
        nnoremap <silent> <leader>gs :G<cr>
        autocmd User FugitiveEditor startinsert

        imap <silent><script><expr> <C-F> copilot#Accept("\<CR>")
      ]])
    end
  },

  {
    "Robitx/gp.nvim",
    config = function()
      require("gp").setup({
        hooks = {
          DiffToCommit = function(gp, params)
            local diff = vim.fn.systemlist("git diff --cached --no-color")

            local template = "Git diff:\n```diff\n" 
            .. table.concat(diff, "\n") .. "\n```\n\n"
            .. "Generate a concise commit title (max 50 characters)."
            .. "Add a brief markdown body only if changes are significant (max 72 characters per line)."
            .. "Use a professional tone, imperative mood, and present tense.\n\n"
            .. "Respond with title and optional body, separated by an empty line."

            local agent = gp.get_command_agent()

            gp.Prompt(
              params,
              gp.Target.rewrite,
              agent,
              template
            )
          end,

          -- GpImplement rewrites the provided selection/range based on comments in it
          Implement = function(gp, params)
            local template = "Rewrite the code snippet below using best practices as per instructions:\n\n"
            .. "Filename: {{filename}}\nType: {{filetype}}\n\n"
            .. "Snippet:\n{{selection}}\n```\n"
            .. "\nRespond with the improved snippet."

            local agent = gp.get_command_agent()
            gp.info("Implementing selection with agent: " .. agent.name)

            gp.Prompt(
              params,
              gp.Target.rewrite,
              nil, -- command will run directly without any prompting for user input
              agent.model,
              template,
              agent.system_prompt
            )
          end,
        },

        agents = {
          {
            name = "openai",
            chat = true,
            command = true,
            model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
            system_prompt = "rules:\n\n"
                .. "- Provide short answers—detail upon request.\n"
                .. "- Forego confirmatory prefaces.\n"
                .. "- Conserve tokens in responses.\n"
          },

          {
            provider = "anthropic",
            name = "claude",
            chat = true,
            command = true,
            model = { model = "claude-3-5-sonnet-20240620", temperature = 0.8, top_p = 1 },
            system_prompt = "rules:\n\n"
                .. "- Provide short answers.\n"
                .. "- Detail upon request.\n"
                .. "- Forego confirmatory prefaces.\n"
                .. "- Conserve tokens in responses.\n"
          },
        },

        providers = {
          anthropic = {
            endpoint = "https://api.anthropic.com/v1/messages",
            secret = os.getenv("ANTHROPIC_API_KEY"),
          },
        },

        chat_user_prefix = "🗨:",
        chat_dir = os.getenv('ZETTEL') .. "/gpt-chats",
        chat_template = require("gp.defaults").short_chat_template,

        -- templates
        template_selection = "from `{{filename}}`:"
          .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}",

        template_rewrite = "from `{{filename}}`:"
          .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
          .. "\n\nRespond only with replacement for selection above.",

        template_append = "from {{filename}}:"
          .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
          .. "\n\nRespond only with replacement that should append the selection above.",

        template_prepend = "from {{filename}}:"
          .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
          .. "\n\nRespond only with replacement that should prepend the selection above.",

        template_command = "{{command}}",
      })

      local function keymapOptions(desc)
          return {
              noremap = true,
              silent = true,
              nowait = true,
              desc = "GPT prompt " .. desc,
          }
      end
      vim.keymap.set("v", "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions("Visual Chat Paste"))
    end
  },

  'tpope/vim-rhubarb',
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',
  'wellle/targets.vim',

  {
    dir = vim.fn.stdpath("config") .. "/lua/blame-line",
    config = function()
      require("blame-line").setup({
        delay = 1000,
        virtual_text_highlight = 'CustomDimBlame',
      })
    end,
    init = function()
      -- start enabled
      require("blame-line").enable_blame_line()

      -- add more dim color for the virtual text
      vim.api.nvim_set_hl(0, 'CustomDimBlame', { fg = '#333952', italic = true })
    end
  },

  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_node_command = os.getenv('FNM_DIR') .. '/aliases/default/bin/node'
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_filetypes = {
        markdown = true,
        gitcommit = true,
      }
    end
  },
  'rafaqz/ranger.vim',
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-obsession',
  'ziontee113/syntax-tree-surfer',
  {
  'tpope/vim-surround',
    config = function()
      vim.g.surround_indent = 0
    end
  },

  'mhinz/vim-signify',
  {
    'christoomey/vim-tmux-navigator',
    config = function()
      vim.g.tmux_navigator_disable_when_zoomed = 1 -- when tmux pane is zoomed, don't zoomout when navigating out of vim
    end
  },
  'Shougo/neosnippet',
  'Shougo/neosnippet-snippets',
  'moll/vim-node',
  'nikvdp/ejs-syntax',
  'mattn/emmet-vim',
  {'neoclide/coc.nvim', run = 'coc#util#install()'},
  'lbrayner/vim-rzip',
  {
    'suan/vim-instant-markdown',
    config = function()
      vim.g.instant_markdown_autostart = 0 -- do npm i -g instant-markdown-d
      vim.g.instant_markdown_theme = 'dark'
    end
  },
  {
    'elmcast/elm-vim',
    ft = 'elm',
    config = function()
      vim.g.elm_make_show_warnings = 1
      vim.g.elm_setup_keybindings = 0
      vim.g.elm_detailed_complete = 1
      vim.g.elm_format_autosave = 1
      vim.g.elm_format_fail_silently = 0

      vim.cmd([[
          autocmd FileType elm nmap <leader>m <Plug>(elm-make)
          autocmd FileType elm nmap <leader>M <Plug>(elm-make-main)
          autocmd FileType elm nmap <leader>d <Plug>(elm-error-detail)
          autocmd BufWritePost *.elm ElmMake
      ]])
    end
  },
  'tmsvg/pear-tree',
  {
    'chrisbra/Colorizer',
    config = function()
          vim.g.colorizer_disable_bufleave = 1
    end
  },
  'junegunn/goyo.vim',
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  'dhruvasagar/vim-table-mode',
  'ggandor/leap.nvim',
  {
    'scrooloose/nerdcommenter',
    config = function()
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDCustomDelimiters = {
        javascript = {
          left = "//",
          leftAlt = "/**",
        }
      }
    end
  },
  'yuttie/comfortable-motion.vim',
  'romainl/vim-qf',
  {
    'simnalamburt/vim-mundo',
    config = function()
      vim.g.mundo_prefer_python3 = 1
      vim.g.mundo_auto_preview = 0
      vim.g.mundo_return_on_revert = 0
      vim.cmd("nnoremap <F6> :MundoToggle<CR>")
    end
  },
  'junegunn/vim-easy-align',
  'itchyny/lightline.vim',
})

require("tokyonight").setup({
  style = "night",
  light_style = "day",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = true,
  on_colors = function(colors)
    colors.hint = colors.orange
  end,
  on_highlights = function(highlights, colors)
    highlights.Folded = {
      bg = colors.NONE,
      fg = colors.dark3,
    }
  end
})
