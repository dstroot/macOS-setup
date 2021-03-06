![apple](/media/apple-1-150x150.png)

# The hackers guide to setting up your Mac

The purpose of this guide is to document how to manage your Mac like a boss. After much trial and error I believe this is the fastest, most efficient method to set up a clean, organized, and up-to-date development environment for a Mac.

The overview is presented here, and the details are maintained in the [wiki](https://github.com/dstroot/macOS-setup/wiki)

## Goals

I’m a polygot fullstack developer so I have a fairly complex setup. Our goals here are:

1. Be able to bootstrap a new system **quickly** with a **repeatable** process.
2. Keep all **software updated regularly** (and keep track of what is installed).
3. Have a great set of **MacOS defaults**.
4. Have a **very** productive development environment:
   - A great shell environment
     - Aliases
     - Fonts
     - Colors
     - Prompt
     - etc.
   - A great editor environment
     - Colors
     - Fonts
     - Packages
     - Keys
     - Snippets
     - etc.

## Key repositories

There are three very important repositories that contain all configuration data. I would like to explain the purpose of each.

- **[dotfiles](https://github.com/dstroot/dotfiles)** - is not actually what it sounds like. My dotfiles are actually managed by [mackup](https://github.com/lra/mackup). Mackup is a community-driven tool for backing up and restoring dotfiles and application settings. This repo is called dotfiles because that was it's origin and now mainly because [Strap](https://github.com/MikeMcQuaid/strap) installs it automatically (and runs `/script/setup` automatically, which we leverage to install everything Homebrew can't) along with the "homebrew-brewfile" repo below.

- **[homebrew-brewfile](https://github.com/dstroot/homebrew-brewfile)** - This repo contains my brewfile. This lists everything that I install via Homebrew. This is automatically processed via [Strap](https://github.com/MikeMcQuaid/strap). See the wiki for more information.

- **[.macos](https://github.com/dstroot/.macos)** - This repository contains the settings for the MacOS operating system (and some applications and utilities). The origin comes from [Mathias Bynens'](https://github.com/mathiasbynens/) amazing MacOS [configuration script](https://github.com/mathiasbynens/dotfiles/blob/master/.macos).

These three repos contain all of my configuration and the entire process is initiated by running [Strap](https://github.com/MikeMcQuaid/strap).  

### What's Inside

A lot of stuff. Seriously, a **lot** of stuff. Poke around in the [Wiki](https://github.com/dstroot/macOS-setup/wiki)

## Building Blocks

We want to use the best tools out there - e.g. the ones with the most community support and momentum and the best functionality.

- **Bootstrap Your System**

  - [Strap](https://github.com/MikeMcQuaid/strap) is a script to bootstrap a minimal MacOS development system. It was developed by Mike McQuaid (who is a Homebrew maintainer) and is used by Github.

- **Shell: Zsh**. Zsh is awesome, really. To use Zsh like a boss we will install [.oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). It autoupdates, has great plugins and a very active community behind it. Your ZSH settings will be backed up by Mackup below. Resources:

  - [Why Zsh](http://code.joejag.com/2014/why-zsh.html)
  - [Pure prompt](https://github.com/sindresorhus/pure)
  - [Powerlevel9k prompt](https://github.com/bhilburn/powerlevel9k)

- **Terminal: iTerm2** for our terminal program. [iTerm2](http://iterm2.com/) is free and it rocks. Your settings will be backed up by Mackup. Lately I have also been using [Hyper](https://hyper.is/) and it's growing on me.  
Resources:

  - [Iterm2-color-schemes](http://iterm2colorschemes.com/)
  - Font: Source Code Pro Light

- **Editor: Visual Studio Code** as our code editor. [VSCcode](https://code.visualstudio.com/) replaced Atom as my main editor. 

- **Tool Version Management: n**. Manage Node versions:

  - [n](https://github.com/tj/n) for node (other possibilities: NVM)

- **Package Management: Homebrew, npm/yarn, pip**. Homebrew is a community-driven package installer and an essential tool for every hacker's toolkit. Homebrew automates the setup, compiling and linking of binaries. It also makes updating and uninstalling binaries a breeze. It will be automatically installed by Strap above. Resources:

  - [About Homebrew](http://mac.tutsplus.com/tutorials/terminal/homebrew-demystified-os-xs-ultimate-package-manager/)

- **Dotfiles Management and Backup: Mackup**. Backing up and Restoring our .dotfiles (our configuration) with [mackup](https://github.com/lra/mackup). Mackup is a community-driven tool for backing up and restoring system and application settings. See dotfiles section below.

## Bugs

If you run into any issues, please [open an issue](https://github.com/dstroot/macOS-setup/issues) on this repository and I'd love to get it fixed. Or, pull requests are always appreciated.

### Thanks

- Way back in the day I forked [Zach Holman's](http://github.com/holman)' excellent [dotfiles](http://github.com/holman/dotfiles) as my initial starting point. I liked his organization and approach.
- Much of the OSX defaults script comes from [Mathias Bynens'](https://github.com/mathiasbynens/) amazing [dotfiles](https://github.com/mathiasbynens/dotfiles). Mathias' OSX defaults script is legendary.
- [Setting up a new Mac](https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/)
- [MacOS Sierra Stuff](https://gist.github.com/kevinelliott/7a152c556a83b322e0a8cd2df128235c)
  
