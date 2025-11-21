### TMUX

**Install**
- install tmux
  - sudo apt install tmux
- install tpm (tmux package manager)
  - look at tpm README first
  - git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
- install plugins
  - enter tmux and then run `prefix I`

**Create config**
- create your tmux.conf file in:
  - $HOME/.tmux.conf (OLD)
  - $XDG_CONFIG_HOME/tmux/tmux.conf (MODERN) <- this didn't exist for me
    - this usually equates to $HOME/.config/tmux/tmux.conf
  - touch ~/.config/tmux/tmux.conf
   
**Keywords**
- Session
  - top-most layer of tmux
  - collection of 1+ windows managed as a single unit
  - can have n sessions at any time but typically only attach to one
  - each session has an active window
- Window
  - container to 1+ panes
  - conceptually like tabs in browsers
  - each window as one active pane and you can switch between panes
  - shown at bottom of screen and active is marked with '*'
- Pane
  - splits in the window, represent individual terminal session
  - only one active pane at a time
- prefix
  - how you enter commands into tmux
  - default: ctrl-b
   
**Commands and keybindings**
- create window: prefix + c
  - also sets as current active window for session
- run tmux: tmux
- source tmux config: tmux source YOUR_PATH <- mine is: ~/.config/tmux/tmux.conf
- managing sessions
  - created using `tmux` command while not attached to a session
  - create session with name: `tmux new -s my-session`
  - from inside tmux, new session can be created using `:new` command
  - list active sessions
    - outside of tmux: `tmux ls`
    - inside of tmux: prefix s
  - preview windows for each session from inside tmux: prefix w
  - attach to session
    - attach to most recent: `tmux attach`
    - attach to named session: `tmux attach -t my-session`
  - detach from session: `prefix d`
- managing windows
  - change window
    - next: prefix n
    - previous: prefix p
    - direct: prefix number (ex: prefix 0)
  - swap window: prefix :swap-window -s 2 -t 1 (idk what this does)
  - close window:
    - option 1: kill all panes inside
    - option 2: prefix &
  - rename a window: prefix ,
- managing panes
  - split a window
    - horizontally: prefix %
    - vertically: prefix "
  - navigating between panes: prefix arrowkeys (up, down, left, right)
  - swap panes around: prefix { and prefix }
  - toggle pane numbers: prefix q
    - then press the subsequent number to go to said pane
  - zoom into a pane: prefix z
  - turn pane into a window: prefix !
  - close a pane: prefix x
- install plugin after editing tmux.conf: prefix I
  - must also source tmux.conf again

**Customizing tmux**
- NOTE: package manager must be installed first!
- vim tmux navigator
  - provides vim keybindings for tmux
    - move around tmux with <C-h/j/k/l>
- also can add themes to change color scheme!

**Mouse support**
- added to tmux.conf
- allows clicking to jump winows/panes
- allows scrolling of terminal history

**Window numbering**
- default window numbering starts with 0, this stinks for navigation
- changed in tmux.conf

**Sources**
- [https://www.youtube.com/watch?v=DzNmUNvnB04](url)
- [tmuxcheatsheet.com](url)
