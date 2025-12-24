# Default recipe shown when running `just`
default:
    @just --list

# Dry-run install (safe)
check:
    stow -n -t ~ .

# Install dotfiles (symlink into $HOME)
stow:
    stow -t ~ .

# Adopt existing files into the stow structure
adopt:
    stow -t ~ --adopt .

# Remove stowed dotfiles
remove:
    stow -D -t ~ .

