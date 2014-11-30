tmux-jasonwryan-theme
=====================

Tmux plugin to get the jason wryan's tmux appearance

### Requirements
* Archlinux
* `ctjhoa/tmux-cpu`
* `tmux-plugins/tmux-battery`

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)
Add plugin to the list of TPM plugins in `.tmux.conf`:
```
    set -g @tpm_plugins "                  \
      tmux-plugins/tpm                     \
      tmux-plugins/tmux-battery            \
      ctjhoa/tmux-cpu                      \
      ctjhoa/tmux-jasonwryan-theme         \
    "
```
Hit `prefix + I` to fetch the plugin and source it. You should now be able to
use the plugin.

### Manual Installation
Clone the repo:
```
    $ git clone https://github.com/ctjhoa/tmux-jasonwryan-theme ~/clone/path
```
Add this line to the bottom of `.tmux.conf`:
```
    run-shell ~/clone/path/jasonwryan-theme.tmux
```
Reload TMUX environment:
```
    # type this in terminal
    $ tmux source-file ~/.tmux.conf
```
You should now be able to use the plugin.

### License
[MIT](LICENSE)
