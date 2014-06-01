# djpowers' dotfiles

### Functionality
* environment initializiation (ex: path, aliases)
* Git configuration (aliases, merge settings, etc.)
* Ruby configuration (IRB, Rubygems, RSpec, etc.)

### Pre-requisites
* install Xcode via App Store
* install [Xcode command line tools](http://stackoverflow.com/questions/8032824/cant-install-ruby-under-lion-with-rvm-gcc-issues)
* install [Homebrew](http://brew.sh/)
* install [RVM](http://rvm.io/)
* install [Oh My Zsh](http://ohmyz.sh/)

### Installation using [Homesick](https://github.com/technicalpickles/homesick)
1. Install homesick
```gem install homesick```
2. Clone the CASTLE
```homesick clone djpowers/dotfiles```
3. Symlink the CASTLE contents to your home directory
```homesick symlink dotfiles```

### Thanks / Resources
@technicalpickles for the homesick gem and introductory [blog post](http://technicalpickles.com/posts/never-leave-your-dotfiles-behind-again-with-homesick/)
@wireframe for the [blog post](http://codecrate.com/2013/08/homesick-dotfile-managment.html) and example
