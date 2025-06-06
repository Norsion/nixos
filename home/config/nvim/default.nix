{ pkgs, ... }:

let
    # Source my theme
    jabuti-nvim = pkgs.vimUtils.buildVimPlugin {
        name = "jabuti-nvim";
        src = pkgs.fetchFromGitHub {
            owner = "jabuti-theme";
            repo = "jabuti-nvim";
            rev = "17f1b94cbf1871a89cdc264e4a8a2b3b4f7c76d2";
            sha256 = "sha256-iPjwx/rTd98LUPK1MUfqKXZhQ5NmKx/rN8RX1PIuDFA=";
        };
    };
in {
        home.file.".config/nvim/settings.lua".source = ./init.lua;
        
        home.packages = with pkgs; [
            #rnix-lsp 
            nixfmt # Nix
            sumneko-lua-language-server 
            stylua # Lua
        ];

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
}