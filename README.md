# djpowers' dotfiles

Clone repo and navigate to directory:
```shell
git clone https://github.com/djpowers/dotfiles
cd ~/dotfiles
```

Make the script to create symlinks executable, and run it:
```shell
chmod +x makesymlinks.sh
./makesymlinks.sh
```

Install [Homebrew](https://brew.sh/) and run the `bundle` command to install packages:
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle
```

### References
* [Using Git and GitHub to Manage Your Dotfiles](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)
