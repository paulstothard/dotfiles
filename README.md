# Using the dotfiles

Get a copy of the repository:

```bash
cd ~
mkdir stothardgit
cd stothardgit
git clone git@github.com:paulstothard/dotfiles.git
cd dotfiles/.vim/
git submodule update --init
```

## bashrc

Add the following to the end of `.bashrc` or `.bash_profile`:

```bash
DOTFILES=~/"stothardgit/dotfiles/"
if [ -f "${DOTFILES}.bashrc" ]; then
        . "${DOTFILES}.bashrc"
fi
```

## vim

Create a symlink to the `.vim` directory in the repository:

```bash
ln -s ~/stothardgit/dotfiles/.vim/ ~/.vim
```

# Modifying the dotfiles

## bashrc

Make changes to the `~/stothardgit/dotfiles/.bashrc` file and run:

```bash
cd ~/stothardgit/dotfiles/
git add .bashrc
git commit -m "Update .bashrc file"
git push origin master
```

## vim

Make changes to the `~/stothardgit/dotfiles/.vim/vimrc` file and run:

```bash
cd ~/stothardgit/dotfiles/.vim
git add vimrc
git commit -m "Update vimrc file"
git push origin master
```

Make changes to the `~/stothardgit/dotfiles/.vim/gvimrc` file and run:

```bash
cd ~/stothardgit/dotfiles/.vim
git add gvimrc
git commit -m "Update gvimrc file"
git push origin master
```

Installing a new plugin as a submodule:

```bash
cd ~/stothardgit/dotfiles/.vim/bundle
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

Once you added a submodule there will be a file named `.gitmodules` in the root of your repository. Add `ignore = dirty` to the end, so that it looks like:

```bash
[submodule "bundle/fugitive"]
    path = bundle/fugitive
    url = git://github.com/tpope/vim-fugitive.git
    ignore = dirty
```