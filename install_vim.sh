mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-rails.git
vim -u NONE -c "helptags vim-rails/doc" -c q
cd ~/.vim/bundle && git clone https://github.com/tpope/vim-sensible.git
