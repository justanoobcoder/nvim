# Neovim

This is my neovim config. It uses [LazyVim](https://www.lazyvim.org/) as the base config.
I added some plugins and changed some settings to make it more suitable for me.
It supports development for C/C++, Java, Go, Bash, Lua, Docker.
It also has Copilot support (your Github account must have Copilot to use it).

## Contents

- [Screenshots](#screenshots)
- [Requirements](#requirements)
- [Installation](#installation)

### Screenshots

![Pic1](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic1.png)
![Pic2](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic2.png)
![Pic3](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic3.png)
![Pic4](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic4.png)
![Pic5](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic5.png)
![Pic6](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic6.png)
![Pic7](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic7.png)

### Requirements

- Neovim (version >= 0.9.5), run `nvim -v` to check neovim version
- Git
- [Lazygit](https://github.com/jesseduffield/lazygit)
- Compilers: c, go, cargo
- Copy/paste support: xclip/xsel (for Xorg), or wl-clipboard (for wayland)
- Ripgrep
- fd
- A [nerdfont](https://github.com/ryanoasis/nerd-fonts)
- A terminal that supports [nerdfonts](https://github.com/ryanoasis/nerd-fonts)
- nodejs (version >= 18.x)

### Installation

Step 1: Back up your old config (if you already had one) by running these following commands:
```
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```
Step 2: Clone this repo to your `~/.config` directory:
```
git clone --depth 1 https://github.com/justanoobcoder/nvim.git ~/.config/nvim
```
Step 3: Run `nvim` and wait for it to install all plugins. When the plugins are installed, you can close neovim.

Step 5: Enjoy :)
