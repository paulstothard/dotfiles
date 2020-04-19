# Using the dotfiles

Get a copy of the repository:

```bash
git clone git@github.com:paulstothard/dotfiles.git
cd dotfiles/.vim/
git submodule update --init
```

## bashrc

Add the following to the end of `.bashrc` or `.bash_profile`:

```bash
DOTFILES="path/to/dotfiles/"
if [ -f "${DOTFILES}.bashrc" ]; then
        . "${DOTFILES}.bashrc"
fi
```

## vim

Create a symlink to the `.vim` directory in the repository:

```bash
cd ~
ln -s path/to/dotfiles/.vim/ .vim
```

## tmux

Create a symlink to the `.tmux.conf` file in the repository:

```bash
cd ~
ln -s path/to/dotfiles/.tmux.conf .tmux.conf
```

# Modifying the dotfiles

After making changes, use `git add` and `git commit`, for example:

```bash
cd dotfiles
git add .bashrc
git commit -m "Update .bashrc file"
git push origin master
```

To install new vim plugins, use `git submodule`, for example:

```bash
cd dotfiles/.vim/
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

After installing a submodule, edit the `.gitmodules` file in the root of your
repository by adding `ignore = dirty` to the end of the submodule entry:

```bash
[submodule "bundle/fugitive"]
    path = bundle/fugitive
    url = git://github.com/tpope/vim-fugitive.git
    ignore = dirty
```
