# Install

```
$ cd ~/
$ git clone git@github.com:ruimashita/.zsh.d.git
$ cd .zsh.d
$ git submodule update --init --recursive
$ python install.py

# starship (manual install)
$ curl -sS https://starship.rs/install.sh | sh -s -- -b ~/local/bin

# fzf (manual install)
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
```
