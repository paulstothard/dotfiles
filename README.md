# Using the dotfiles

## bashrc

In .bashrc add something like the following:

```bash
DOTFILES=~/"stothardgit/dotfiles/"
if [ -f "${DOTFILES}bashrc" ]; then
        . "${DOTFILES}bashrc"
fi
```
