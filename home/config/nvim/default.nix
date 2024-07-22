{  lib, config, pkgs, ... }:
with lib;
let
    cfg = config.modules.nvim;
in {
    options.modules.nvim = { enable = mkEnableOption "nvim"; };
    config = mkIf cfg.enable {

        home.file.".config/nvim/settings.lua".source = ./init.lua;

        home.packages = with pkgs; [
            rnix-lsp nixfmt # Nix
            sumneko-lua-language-server stylua # Lua
        ];

        programs.zsh = {
            initExtra = ''
                export EDITOR="nvim"
            '';

            shellAliases = {
                nv = "nvim -i NONE";
            };
        };

        programs.neovim = {
            enable = true;
            plugins = with pkgs.vimPlugins; [
                vim-nix
                plenary-nvim
                {
                    plugin = zk-nvim;
                    config = "require('zk').setup()";
                }
                {
                    plugin = jabuti-nvim;
                    config = "colorscheme jabuti";
                }
                {
                    plugin = impatient-nvim;
                    config = "lua require('impatient')";
                }
                {
                    plugin = lualine-nvim;
                    config = "lua require('lualine').setup()";
                }
                {
                    plugin = telescope-nvim;
                    config = "lua require('telescope').setup()";
                }
                {
                    plugin = indent-blankline-nvim;
                    config = "lua require('indent_blankline').setup()";
                }
                {
                    plugin = nvim-lspconfig;
                    config = ''
                        lua << EOF
                        require('lspconfig').rust_analyzer.setup{}
                        require('lspconfig').sumneko_lua.setup{}
                        require('lspconfig').rnix.setup{}
                        require('lspconfig').zk.setup{}
                        EOF
                    '';
                }
                {
                    plugin = nvim-treesitter;
                    config = ''
                    lua << EOF
                    require('nvim-treesitter.configs').setup {
                        highlight = {
                            enable = true,
                            additional_vim_regex_highlighting = false,
                        },
                    }
                    EOF
                    '';
                }
            ];

            extraConfig = ''
                luafile ~/.config/nvim/settings.lua
            '';
        };
    };
}
