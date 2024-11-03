return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        
        -- Add Org parser configuration
        parser_config.org = {
            install_info = {
                url = 'https://github.com/milisims/tree-sitter-org',
                revision = 'main',
                files = { 'src/parser.c', 'src/scanner.c' },
            },
            filetype = 'org',
        }

        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "markdown", "markdown_inline", "latex", "org" },  -- Ensure parsers are installed
            highlight = {
                enable = true,              -- Enable syntax highlighting
                additional_vim_regex_highlighting = false,
            },
        }
    end,
}
