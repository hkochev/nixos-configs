with import <nixpkgs> {};

vim_configurable.customize {
    name = "vimNix";
    vimrcConfig.customRC = ''
      filetype indent plugin on
 
      " Enable syntax highlighting
      syntax on
      " colorscheme badwolf         " awesome colorscheme 
        try
          let g:hybrid_custom_term_colors = 1
          let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
          colorscheme  srcery  
          let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
          let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
        catch
        endtry

        set hidden
        set lazyredraw          " redraw only when we need to.
        set showmatch           " highlight matching [{()}]
       
        " Better command-line completion
        set wildmenu
         
        " Show partial commands in the last line of the screen
        set showcmd             " Show (partial) command in status line.
        set showmatch           " Show matching brackets.
        set showmode            " Show current mode.
        set ruler               " Show the line and column numbers of the cursor.
        set number              " Show the line numbers on the left side.
        set formatoptions+=o    " Continue comment marker in new lines.
        set textwidth=0         " Hard-wrap long lines as you type them.
        set expandtab           " Insert spaces when TAB is pressed.
        set tabstop=2           " Render TABs using this many spaces.
        set shiftwidth=2        " Indentation amount for < and > commands.

        set noerrorbells        " No beeps.
        set modeline            " Enable modeline.
        set esckeys             " Cursor keys in insert mode.
        set linespace=0         " Set line-spacing to minimum.
        set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

        " More natural splits
        set splitbelow          " Horizontal split below current.
        set splitright          " Vertical split to right of current.

        if !&scrolloff
          set scrolloff=3       " Show next 3 lines while scrolling.
        endif
        if !&sidescrolloff
          set sidescrolloff=5   " Show next 5 columns while side-scrolling.
        endif
        set display+=lastline
        set nostartofline       " Do not jump to first character with pa
        set hlsearch            " Enable search highlights (needs ghcMod)
        set pastetoggle=        " Use F11 to toggle between paste and nopaste
        set confirm             " Present dialog instead of failing commands
        set mouse=a             " enable mouse
        set expandtab           " expand tab to spaces
        " Stylish Haaskell settings
        set formatprg=stylish-haskell
        " HLint integration settings
        let g:syntastic_haskell_checkers = ['hlint']
        " Hdevtools settings
        au FileType haskell nnorremap <buffer> <F1> :HdevtoolsType<CR>
        au FileType haskell nnorremap <buffer> <silent> <F2> :HdevtoolsInfo<CR>
        au FileType haskell nnorremap <buffer> <silent> <F3> :HdevtoolsClear<CR>

    '';
    # Use the default plugin list shipped with nixpkgs
    vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
    vimrcConfig.vam.pluginDictionaries = [
        { names = [
            # Here you can place all your vim plugins
            # They are installed managed by `vam` (a vim plugin manager)
            "Syntastic"
            # "ctrlp"
            "vim-airline"
            "vim-addon-nix"
            # "taglist"
            "vim-airline"
            "vim-nix"
            "vim-closetag"

            # Github plugins
            # "github:LnL7/vim-nix"
            # "github:alvan/vim-closetag"
            "vim-css-color"
            "elm-vim"
            "vim-colorschemes"
            "floobits-neovim"
            "vim2hs"
            "vim-hdevtools"
            "vim-stylishask"
            "vim-elixir"
        ]; }
      ];
    }
