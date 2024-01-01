# Just a noob coder's neovim
This neovim config is suitable for developing application in java, python, 
javascript/typescript, golang, c/c++, bash script, or web development (html, css). It also
support writing dockerfile and docker-compose.

## Contents

- [Screenshots](#screenshots)
- [Requirements](#requirements)
- [Installation](#installation)
- [Optional](#optional)

### Screenshots

![Pic1](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic1.png)
![Pic2](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic2.png)
![Pic3](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic3.png)
![Pic3](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic4.png)
![Pic3](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic5.png)

### Requirements

- Neovim (version >= 0.9.4), run `nvim -v` to check neovim version.
- git
- nodejs
- npm
- xclip or xsel (copy/paste support)
- Ripgrep.
- A terminal that supports [nerdfonts](https://github.com/ryanoasis/nerd-fonts).

### Installation

Step 1: Run these following commands (back up your neovim config if you already had one):
```
rm -rf ~/.config/nvim
git clone https://github.com/justanoobcoder/nvim.git ~/.config/nvim
```
Step 2: Open neovim and wait for it downloads all plugins.
Step 3: Enjoy :)

### Optional
- If you're using this neovim for developing java application, you must install 
java 17 (or higher) and set `JAVA_HOME` environment variable.
