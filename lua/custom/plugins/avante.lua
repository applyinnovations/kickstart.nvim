return {
  -- https://github.com/yetone/avante.nvim
  'yetone/avante.nvim',
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has 'win32' ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    mode = 'agentic',
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = 'avante.md',
    -- for example
    provider = 'xai',
    behaviour = {
      auto_focus_sidebar = false,
      auto_suggestions = false,
      auto_suggestions_respect_ignore = true,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = true,
      auto_focus_on_diff_view = true,
      jump_result_buffer_on_finish = false,
      minimize_diff = true,
      enable_fastapply = false,
      auto_approve_tool_permissions = false,
    },
    web_search_engine = {
      provider = 'google',
      providers = {
        google = {
          GOOGLE_SEARCH_API_KEY = os.getenv 'GOOGLE_SEARCH_API_KEY',
          GOOGLE_SEARCH_ENGINE_ID = os.getenv 'GOOGLE_SEARCH_ENGINE_ID',
        },
      },
    },
    providers = {
      xai = {
        model = 'grok-code-fast-1',
        XAI_API_KEY = os.getenv 'XAI_API_KEY',
      },
    },
    acp_providers = {
      ['gemini-cli'] = {
        command = 'gemini',
        args = { '--experimental-acp' },
        env = {
          NODE_NO_WARNINGS = '1',
          HOME = os.getenv 'HOME',
        },
        auth_method = 'OAuth',
        -- disabled_tools = { 'python', 'edit' },
        -- rag_search, python, git_diff, git_commit, glob, search_keyword, read_file_toplevel_symbols, read_file, create_file, move_path, copy_path, delete_path, create_dir, bash, web_search, fetch
      },
    },
    repo_map = {
      ignore_patterns = {
        -- Version control
        '%.git',
        '%.worktree',
        '%.svn',
        '%.hg',

        -- Dependency directories
        'node_modules',
        'vendor',
        'deps',
        'target',
        'packages',
        'lib',
        'bin',
        'obj',
        '_build',
        'ebin',
        'dist',
        'build',
        'out',

        -- Cache directories
        '__pycache__',
        '.cache',
        '.npm',
        '.yarn-integrity',
        '.gradle',
        '.mvn',
        '.mix',
        '.erlang.mk',
        '.dart_tool',
        '.swiftpm',
        '.sass-cache',
        '.bundle',
        '.luarocks',
        '.cpan',
        '.Rproj.user',

        -- Build artifacts
        '*.o',
        '*.obj',
        '*.exe',
        '*.dll',
        '*.so',
        '*.a',
        '*.lib',
        '*.jar',
        '*.war',
        '*.class',
        '*.pyc',
        '*.pyo',
        '*.pyd',
        '*.beam',
        '*.app',
        '*.tsbuildinfo',
        'Cargo.lock',
        'go.sum',
        'composer.lock',
        'Gemfile.lock',
        'yarn.lock',
        'package-lock.json',
        'mix.lock',
        'rebar.lock',
        'Manifest.toml',

        -- Logs and temp files
        '*.log',
        '*.tmp',
        '*.bak',
        '*.swp',
        '*.swo',
        '.DS_Store',
        'Thumbs.db',
        'Desktop.ini',
        '.Trash',

        -- IDE and editor files
        '.vscode',
        '.idea',
        '.vs',

        -- Sensitive files
        '*.pem',
        '*.key',
        '*.crt',
        '*.cer',
        '*.p12',
        '*.pfx',
        '*.jks',
        '*.gpg',
        '*.enc',
        'env*',
        '.env*',
        'secrets*',
        '.secrets*',
        'keys.txt',
        '*.tfstate',
        '*.tfvars',
        '.terraform',
      },
    },
    selector = {
      provider = 'telescope',
    },
    input = {
      provider = 'snacks',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'stevearc/dressing.nvim', -- for input provider dressing
    'folke/snacks.nvim', -- for input provider snacks
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    -- 'zbirenbaum/copilot.lua', -- for providers='copilot'
    -- {
    --   -- support for image pasting
    --   'HakonHarnes/img-clip.nvim',
    --   event = 'VeryLazy',
    --   opts = {
    --     -- recommended settings
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --       -- required for Windows users
    --       use_absolute_path = true,
    --     },
    --   },
    -- },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
