**The purpose of this file is to serve as a knowledge base of git info**

- To initialize a repo (after EMPTY repo was created in github)
  - git init
  - git add (. or whatever files)
  - git commit
  - git branch -M main
  - git remote add origin ORIGIN
  - git push -u origin main
- To add ssh key to github (WSL2)
  - navigate to home/YOUR_USER/.ssh
  - run `ssh-keygen -t ed25519 -C "YOUR_EMAIL"`
  - follow instructions when prompted
  - to start ssh-agent, `` eval `ssh-agent -s`  ``
  - add the new private key with `ssh-add FILE_NAME`
  - add the public key to github (settings >> ssh & gpg keys >> new ssh key)
  - git config --global url."git@github.com:".insteadOf "https://github.com/"
  - OPTIONAL, configure git to use ssh
     - git config --global url."git@github.com:".insteadOf "https://github.com/"
  - add this script to your .bashrc or .zshrc:
```
    # Start ssh-agent and add key if not already running
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        eval "$(ssh-agent -s)"
    fi
    
    # Add SSH key (if not already added)
    if ! ssh-add -l | grep -q "id_ed25519"; then
        ssh-add ~/.ssh/id_ed25519
    fi
```
  - replace "id_ed25519" with the name of you private key file
  - source your settings file with `source .zshrc/.bashrc`
  - test with `ssh -T git@github.com`
- To delete local commits
  - `git reset --hard HEAD~1` where `HEAD~1` means get rid of the latest from HEAD
  - `git reset --hard <commit hash>` <- this is easier imo 

**Troubleshooting**

- If you get a warning that the file you are using for the private key is unprotected, either change the perms with `sudo chmod 400 FILE_NAME` or generate the key inside the .ssh folder rather than copying and pasting in a new file.

**Sources**

1. https://docs.github.com/en/migrations/importing-source-code/using-the-command-line-to-import-source-code/adding-locally-hosted-code-to-github
2. https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
3. https://stackoverflow.com/questions/25869207/getting-warning-unprotected-private-key-file-error-message-while-attempting
4. https://stackoverflow.com/questions/1338728/how-do-i-delete-a-commit-from-a-branch
