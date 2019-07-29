# vim-rc

This is Wang's Vim configuration for editing TeX, Go and Python scripts.

## Installation
1. Backup your old configurations:

    `mv ~/.vim ~/.vim.backup`

2. Clone this configuration:

    `git clone 'https://github.com/osls/vim-rc' ~/.vim`

3. Grab the plugin manager `vim-plug`:

    ```sh
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

4. make the backup dirs:

    ```sh
    mkdir -p ~/.vim/backup
    mkdir -p ~/.vim/tmp
    ```

5. Launch `vim`, and type `:PlugInstall` to install `vim` plugins.

## nvim:
- Linux: `~/.config/nvim/init.vim`
- Win10: `~/.config/nvim/init.vim`

## Have fun!
