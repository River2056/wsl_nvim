curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install node

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/init
mkdir -p ~/.config/nvim/lua/kevin
ln -sf ~/wsl_nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/wsl_nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf ~/wsl_nvim/init/airline.vim ~/.config/nvim/init/airline.vim
ln -sf ~/wsl_nvim/init/coc.vim ~/.config/nvim/init/coc.vim
ln -sf ~/wsl_nvim/init/mappings.vim ~/.config/nvim/init/mappings.vim
ln -sf ~/wsl_nvim/init/nerdtree.vim ~/.config/nvim/init/nerdtree.vim
ln -sf ~/wsl_nvim/init/telescope.vim ~/.config/nvim/init/telescope.vim
ln -sf ~/wsl_nvim/lua/kevin/init.lua ~/.config/nvim/lua/kevin/init.lua
