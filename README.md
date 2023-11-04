# djpowers' dotfiles

## Setup instructions

### 👯 Clone repo and navigate to directory

```shell
git clone https://github.com/djpowers/dotfiles
cd ~/dotfiles
```

### 🍺 Install [Homebrew](https://brew.sh/) and run the `bundle` command to install packages

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle
```

### 🐐 Create the package symlinks via [GNU Stow](https://www.gnu.org/software/stow/)

```
stow --verbose */
````

### 🔰 Install [Node.js](https://nodejs.org/en/)

```shell
nvm install --lts
```

### 🐟 Set [fish](https://fishshell.com/) as default shell

```shell
sudo bash -c 'echo $(which fish) >> /etc/shells'
chsh -s $(which fish)
```

### 🎣 Install Fisher plugins

```shell
fisher update
```
## Other notes

### 🧬 Ensure the [Helix Editor](https://helix-editor.com/) language servers are properly configured

```shell
hx --health
```

### 🚀 Prompt is generated from [Starship](https://starship.rs/)

```shell
starship --version
```

### 💎 Install latest [Ruby](https://www.ruby-lang.org/en/) as needed

```shell
rbenv install $(rbenv install -l | grep -v - | tail -1)
```

### 🐍 Install latest [Python](https://www.python.org/) as needed

```shell
pyenv install $(string trim $(pyenv install -l | grep -v - | grep -v a | tail -1))
```

## Previous Versions

- Latest Neovim-based commit: [`88371ba8ed`](https://github.com/djpowers/dotfiles/tree/88371ba8ed6f9671d5dc1a8d243032b0a41916c3)
