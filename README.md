
# Syaoran's Neovim

```
   _____                                   _                              _           
  / ____|                                 ( )                            (_)          
 | (___  _   _  __ _  ___  _ __ __ _ _ __ |/ ___    _ __   ___  _____   ___ _ __ ___  
  \___ \| | | |/ _` |/ _ \| '__/ _` | '_ \  / __|  | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
  ____) | |_| | (_| | (_) | | | (_| | | | | \__ \  | | | |  __/ (_) \ V /| | | | | | |
 |_____/ \__, |\__,_|\___/|_|  \__,_|_| |_| |___/  |_| |_|\___|\___/ \_/ |_|_| |_| |_|
          __/ |                                                                       
         |___/                                                                        
```

## Contents

- [Screenshots](#screenshots)
- [Requirements](#requirements)
- [Installation](#installation)
- [Optional](#optinal)

### Screenshots

![Pic1](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic1.png)
![Pic2](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic2.png)
![Pic3](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic3.png)
![Pic3](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic4.png)
![Pic3](https://raw.githubusercontent.com/justanoobcoder/files/master/nvim/images/pic5.png)

### Requirements

- Neovim (version >=0.5.0), run `nvim -v` to check neovim version.
- Tree-sitter.
- Ripgrep.
- A terminal that supports [nerdfonts](https://github.com/ryanoasis/nerd-fonts).

### Installation

Step 1: Run this following command:
```
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
Step 2: Run these following commands:
```
rm -rf ~/.config/nvim
git clone https://github.com/justanoobcoder/nvim.git ~/.config/nvim
```
Step 3: Run this following command:
```
nvim +PackerInstall
```
Step 4: Neovim will be opened. It may show error at first but don't worry, just press Enter. It will ask you something like `OK to remove?`, just press Enter. Then wait for Packer install all plugins. When the plugins are installed, you can close neovim.

Step 5: Enjoy :)

### Optional

If you're a C/C++ programmer, you may want to install `ccls` for C/C++ language support. Neovim will provide you some autocompletion, errors, warnings,... when you code C/C++ programs.
