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
```
### 💼 Work (optional)

Enable git hooks to enforce conventional commits:
```shell
cp ~/.githooks/commit-msg.sample ~/.githooks/commit-msg
chmod +x .githooks/commit-msg # make executable
```

### 🛠️ Install tools
Running `mise install` will install the following:
- 🔰[Node.js](https://nodejs.org/en/)
- 💎[Ruby](https://www.ruby-lang.org/en/)
- 🔮[Elixir](https://elixir-lang.org/)
Run `mise install ruby` to install just that tool.

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

#### Create and Activate Virtual Environment

```shell
pyenv virtualenv project_env
pyenv activate project_env
```

### 🤖 Configure artificial intelligence tooling

Configure AI tools as needed.

#### 🦙 Add [Olamma models](https://ollama.ai/library)

```shell
ollama pull llama2
ollama pull codellama
```

#### 💬 Configure [AIChat](https://github.com/sigoden/aichat#config)

```shell
aichat # will guide through configuration on first launch
aichat --info | grep config_file # find existing config
```

```yaml
model: ollama:codellama:latest
clients:
- type: openai-compatible
  name: ollama
  api_base: http://localhost:11434/v1
  models:
  - name: codellama:latest
```

### 🍐 Configure [Aider](https://aider.chat/)

```shell
aider # enter OpenRouter API key; will store in ~/.aider/oauth-keys.env
aider --list-models free # list models containing "free"

# TODO: remove this line once no longer necessary (Aider-AI/aider#216)
cp aider/.config/config.yaml ~/.aider.conf.yml
```

## Previous Versions

- Latest Neovim-based commit: [`88371ba8ed`](https://github.com/djpowers/dotfiles/tree/88371ba8ed6f9671d5dc1a8d243032b0a41916c3)
