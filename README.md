# Using the dotfiles

## bashrc

In .bashrc or .bash\_profile add something like the following:

```bash
DOTFILES=~/"stothardgit/dotfiles/"
if [ -f "${DOTFILES}bashrc" ]; then
        . "${DOTFILES}bashrc"
fi
```
