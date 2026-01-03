# zsh-config

**Setup**
- install zsh
  - sudo apt install zsh (or equivalent)
- set as default
  - chsh YOUR_USER (echo $USER)
  - /bin/zsh (verify location first)
- ensure git is installed
- backup any .zshrc that exists
  - mv ~/.zshrc ~/.zshrc.bak
- create new .zshrc
  - touch ~/.zshrc

**Other**
- To rerun p10k, use p10k command
- To get bash back, do chsh and use /bin/bash (mine was /usr/bin/bash on another instance)
