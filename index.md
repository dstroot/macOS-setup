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

There are three very important repositories that contain all configuration. I would like to explain the purpose of each.

- **[dotfiles](https://github.com/dstroot/dotfiles)** - not actually what it sounds like. My dotfiles are actually backed up by [mackup](https://github.com/lra/mackup). Mackup is a community-driven tool for backing up and restoring system and application settings. This is called dotfiles because that was it's origin and now mainly because [Strap](https://github.com/MikeMcQuaid/strap) installs it automatically along with the "homebrew-brewfile" repo below.

- **[homebrew-brewfile](https://github.com/dstroot/homebrew-brewfile)** - This repo contains my brewfile. This lists everything that I install via Homebrew. This is automatically processed via the bootstrap script called "strap". See the wiki for more information.

- **[.macos](https://github.com/dstroot/.macos)** - This repository contains the settings for the MacOS operating system and applications and utilities. The origin comes from [Mathias Bynens'](https://github.com/mathiasbynens/) amazing MacOS [configuration script](https://github.com/mathiasbynens/dotfiles/blob/master/.macos).

## Building Blocks

We want to use the best tools out there - e.g. the ones with the most community support and momentum and the best functionality.

- **Bootstrap Your System**

  - [Strap](https://github.com/MikeMcQuaid/strap) is a script to bootstrap a minimal MacOS development system. It was developed by Mike McQuaid and is used by Github.

- **Shell: Zsh**. Zsh is awesome, really. To use Zsh like a boss we will install [.oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). It autoupdates, has great plugins and a very active community behind it. Your settings will be backed up by Mackup below. Resources:

  - [Why Zsh](http://code.joejag.com/2014/why-zsh.html)
  - [Pure prompt](https://github.com/sindresorhus/pure)
  - [Powerlevel9k prompt](https://github.com/bhilburn/powerlevel9k)

- **Terminal: iTerm2** for our terminal program. [iTerm2](http://iterm2.com/) is free and it rocks. Your settings will be backed up by Mackup. Resources:

  - [Iterm2-color-schemes](http://iterm2colorschemes.com/)
  - Font: Source Code Pro Light

- **Editor: Atom** as our code editor. Your settings, packages, etc. will all be backed up by Mackup.

- **Tool Version Management: n and rbenv**. Manage your Ruby and Node versions:

  - [n](https://github.com/tj/n) for node (other possibilities: NVM)
  - [rbenv](https://github.com/sstephenson/rbenv) for [Ruby](https://www.ruby-lang.org/en/) (Other possibilities: RVM )

- **Package Management: Homebrew, homebrew cask, npm/yarn, pip**. Installing Binaries with [homebrew](http://brew.sh/). Homebrew is a community-driven package installer and an essential tool for every hacker's toolkit. Homebrew automates the setup, compiling and linking of binaries. It also makes updating and uninstalling binaries a breeze. Resources:

  - [About Homebrew](http://mac.tutsplus.com/tutorials/terminal/homebrew-demystified-os-xs-ultimate-package-manager/)

- **Dotfiles Management and Backup: Mackup**. Backing up and Restoring our .dotfiles (our configuration) with [mackup](https://github.com/lra/mackup). Mackup is a community-driven tool for backing up and restoring system and application settings. See dotfiles section below.

## Bugs

If you run into any issues, please [open an issue](https://github.com/dstroot/macOS-setup/issues) on this repository and I'd love to get it fixed. Or, pull requests are always appreciated.

### Thanks

- Way back in the day I forked [Zach Holman's](http://github.com/holman)' excellent [dotfiles](http://github.com/holman/dotfiles) as my initial starting point. I liked his organization and approach.
- Much of the OSX defaults script comes from [Mathias Bynens'](https://github.com/mathiasbynens/) amazing [dotfiles](https://github.com/mathiasbynens/dotfiles). Mathias' OSX defaults script is legendary.

  [MacOS Sierra](https://gist.github.com/kevinelliott/7a152c556a83b322e0a8cd2df128235c)

# ==================

### Install your printer

1.  Install the printer software. //tower/Volumes/Software/Drivers
2.  Go ahead and manually install your printer via "System Preferences/Printers & Scanners".
3.  Print a test page.

### What the install script does:

1. Prompts you to install Apple App Store Apps (should be done already)
2. Installs Xcode command-line tools (should be done already)
3. Installs .oh-my-zsh
4. Installs Homebrew & "stuff" (must be ahead of Ruby because it installs rbenv)
5. Installs Node/NPM and NPM global modules
6. Installs Ruby/Ruby Gems (managed by rbenv)
7. Installs Python (PIP) Stuff
8. Installs Google Fonts
9. Installs Go
10. Sets up Autofs (fileshares)
11. Prompts you to manually install apps
12. Prompts you to setup Microsoft Office
13. Installs `.osx` and applies OSX defaults

### Maintenance script (dot script):

`dot` is a simple script that keeps everything tip top. Occasionally run `dot` from time to time to keep your environment fresh and up-to-date. You can find this script in `~/.dotfiles/bin/`.

## What's Inside

A lot of stuff. Seriously, a **lot** of stuff.

### Other Key Scripts

- `~/.dotfiles/homebrew/brew.sh` - installs/updates Homebrew and all apps that can be installed via Homebrew/homebrew cask.
- `~/.dofiles/npm/npm.sh` - installs node, npm and npm global modules
- `~/.dotfiles/ruby/gems.sh` - installs Ruby Gems.
- `~/.dotfiles/pip/pip.sh` - installs python pip modules.
- `~/.osx/osx-defaults.sh` - sets all OSX defaults just the way I like 'em. ;)
  - Here is a good reference [OSX Default Values Command Reference](https://github.com/kevinSuttle/osxdefaults/blob/master/REFERENCE.md)
- `~/.dotfiles/after_dropbox_sync.sh` - runs `mackup restore` and links my Desktop folder to Dropbox/Desktop.

### Components

- Anything with an extension of `.zsh` in `~/.oh-my-zsh/custom` will get automatically included into your shell.
- Anything in `~/.dotfiles/bin/` is in your `$PATH` and available everywhere.

### Manual Setup:

- Automatically Move Archives After Extraction in macOS
  - In macOS X Finder hit Command+Shift+G to summon “Go To Folder”, enter the following path the box: `/System/Library/CoreServices/Applications`
  - Locate and launch the app named “Archive Utility”
  - Pull down the “Archive Utility” menu and select “Preferences”
  - Choose the menu next to “After Expanding:” and set it to “move archive to…”
- [Install iTerm2 Themes](http://iterm2colorschemes.com/)
  ![Import](https://raw.githubusercontent.com/dstroot/dotfiles/master/img/iTerm2.png)
- If macOS finder runs very slowly: `rm ~/Library/Caches/CloudKit/CloudKitMetadata*;killall cloudd`
- Install docker https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac
- npm install --global pure-prompt

## Aliases (trying to keep them all documented here)

**type:** `alias` (Boy I wish readme's supported GFM - then the list below would not be gibberish)

| Left-aligned | Center-aligned | Right-aligned |
| :----------- | :------------: | ------------: |
| git status   |   git status   |    git status |
| git diff     |    git diff    |      git diff |

| Alias                | =   | This                                                                                             |
| -------------------- | --- | ------------------------------------------------------------------------------------------------ |
| -                    | =   | 'cd -'                                                                                           |
| ..                   | =   | 'cd ..'                                                                                          |
| ...                  | =   | 'cd ../..'                                                                                       |
| 1                    | =   | 'cd -'                                                                                           |
| 2                    | =   | 'cd -2'                                                                                          |
| 3                    | =   | 'cd -3'                                                                                          |
| 4                    | =   | 'cd -4'                                                                                          |
| 5                    | =   | 'cd -5'                                                                                          |
| 6                    | =   | 'cd -6'                                                                                          |
| 7                    | =   | 'cd -7'                                                                                          |
| 8                    | =   | 'cd -8'                                                                                          |
| 9                    | =   | 'cd -9'                                                                                          |
| \_                   | =   | sudo                                                                                             |
| afind                | =   | 'ack-grep -il'                                                                                   |
| at                   | =   | 'open -a '\''/Applications/Atom.app'\'                                                           |
| att                  | =   | 'at .'                                                                                           |
| bi                   | =   | 'bower install'                                                                                  |
| bl                   | =   | 'bower list'                                                                                     |
| bs                   | =   | 'bower search'                                                                                   |
| cd..                 | =   | 'cd ..'                                                                                          |
| cd...                | =   | 'cd ../..'                                                                                       |
| cd....               | =   | 'cd ../../..'                                                                                    |
| cd.....              | =   | 'cd ../../../..'                                                                                 |
| cd/                  | =   | 'cd /'                                                                                           |
| d                    | =   | 'dirs -v 'pipe' head -10'                                                                        |
| dl                   | =   | 'cd ~/Downloads'                                                                                 |
| drop                 | =   | 'cd ~/Dropbox'                                                                                   |
| dt                   | =   | 'cd ~/Desktop'                                                                                   |
| g                    | =   | git                                                                                              |
| ga                   | =   | 'git add'                                                                                        |
| gap                  | =   | 'git add --patch'                                                                                |
| gb                   | =   | 'git branch'                                                                                     |
| gba                  | =   | 'git branch -a'                                                                                  |
| gbr                  | =   | 'git branch --remote'                                                                            |
| gc                   | =   | 'git commit -v'                                                                                  |
| 'gc!'                | =   | 'git commit -v --amend'                                                                          |
| gca                  | =   | 'git commit -v -a'                                                                               |
| 'gca!'               | =   | 'git commit -v -a --amend'                                                                       |
| gcl                  | =   | 'git config --list'                                                                              |
| gclean               | =   | 'git reset --hard && git clean -dfx'                                                             |
| gcm                  | =   | 'git checkout master'                                                                            |
| gcmsg                | =   | 'git commit -m'                                                                                  |
| gco                  | =   | 'git checkout'                                                                                   |
| gcount               | =   | 'git shortlog -sn'                                                                               |
| gcp                  | =   | 'git cherry-pick'                                                                                |
| gcs                  | =   | 'git commit -S'                                                                                  |
| gd                   | =   | 'git diff'                                                                                       |
| gdc                  | =   | 'git diff --cached'                                                                              |
| gdt                  | =   | 'git difftool'                                                                                   |
| gg                   | =   | 'git gui citool'                                                                                 |
| gga                  | =   | 'git gui citool --amend'                                                                         |
| ggpnp                | =   | 'git pull origin $(current_branch) && git push origin$(current_branch)'                          |
| ggpull               | =   | 'git pull origin \$(current_branch)'                                                             |
| ggpur                | =   | 'git pull --rebase origin \$(current_branch)'                                                    |
| ggpush               | =   | 'git push origin \$(current_branch)'                                                             |
| gignore              | =   | 'git update-index --assume-unchanged'                                                            |
| gignored             | =   | 'git ls-files -v 'pipe' grep "^[[:lower:]]"'                                                     |
| git-svn-dcommit-push | =   | 'git svn dcommit && git push github master:svntrunk'                                             |
| gitkey               | =   | 'more ~/.ssh/github_rsa.pub 'pipe' pbcopy 'pipe' echo '\''=> Public key copied to pasteboard.'\' |
| gk                   | =   | 'gitk --all --branches'                                                                          |
| gl                   | =   | 'git pull'                                                                                       |
| glg                  | =   | 'git log --stat --max-count=10'                                                                  |
| glgg                 | =   | 'git log --graph --max-count=10'                                                                 |
| glgga                | =   | 'git log --graph --decorate --all'                                                               |
| glo                  | =   | 'git log --oneline --decorate --color'                                                           |
| globurl              | =   | 'noglob urlglobber '                                                                             |
| glog                 | =   | 'git log --oneline --decorate --color --graph'                                                   |
| glp                  | =   | 'git_log_prettily'                                                                               |
| gm                   | =   | 'git merge'                                                                                      |
| gmt                  | =   | 'git mergetool --no-prompt'                                                                      |
| gp                   | =   | 'git push'                                                                                       |
| gpoat                | =   | 'git push origin --all && git push origin --tags'                                                |
| gr                   | =   | 'git remote'                                                                                     |
| grba                 | =   | 'git rebase --abort'                                                                             |
| grbc                 | =   | 'git rebase --continue'                                                                          |
| grbi                 | =   | 'git rebase -i'                                                                                  |
| grep                 | =   | 'grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}'                                      |
| grh                  | =   | 'git reset HEAD'                                                                                 |
| grhh                 | =   | 'git reset HEAD --hard'                                                                          |
| grmv                 | =   | 'git remote rename'                                                                              |
| grrm                 | =   | 'git remote remove'                                                                              |
| grset                | =   | 'git remote set-url'                                                                             |
| grt                  | =   | 'cd \$(git rev-parse --show-toplevel 'pipe''pipe' echo ".")'                                     |
| grup                 | =   | 'git remote update'                                                                              |
| grv                  | =   | 'git remote -v'                                                                                  |
| gsd                  | =   | 'git svn dcommit'                                                                                |
| gsps                 | =   | 'git show --pretty=short --show-signature'                                                       |
| gsr                  | =   | 'git svn rebase'                                                                                 |
| gss                  | =   | 'git status -s'                                                                                  |
| gst                  | =   | 'git status'                                                                                     |
| gsta                 | =   | 'git stash'                                                                                      |
| gstd                 | =   | 'git stash drop'                                                                                 |
| gstp                 | =   | 'git stash pop'                                                                                  |
| gsts                 | =   | 'git stash show --text'                                                                          |
| gts                  | =   | 'git tag -s'                                                                                     |
| gunignore            | =   | 'git update-index --no-assume-unchanged'                                                         |
| gunwip               | =   | 'git log -n 1 'pipe' grep -q -c "\-\-wip\-\-" && git reset HEAD~1'                               |
| gup                  | =   | 'git pull --rebase'                                                                              |
| gvt                  | =   | 'git verify-tag'                                                                                 |
| gwc                  | =   | 'git whatchanged -p --abbrev-commit --pretty=medium'                                             |
| gwip                 | =   | 'git add -A; git ls-files --deleted -z 'pipe' xargs -r0 git rm; git commit -m "--wip--"'         |
| history              | =   | 'fc -l 1'                                                                                        |
| ios                  | =   | 'open /Applications/Xcode.app/Contents/Developer/Applications/'\''iOS Simulator.app'\'           |
| l                    | =   | 'ls -lah'                                                                                        |
| la                   | =   | 'ls -lAh'                                                                                        |
| ll                   | =   | 'ls -lh'                                                                                         |
| ls                   | =   | 'ls -G'                                                                                          |
| lsa                  | =   | 'ls -lah'                                                                                        |
| md                   | =   | 'mkdir -p'                                                                                       |
| ohmyzsh              | =   | 'atom ~/.oh-my-zsh'                                                                              |
| please               | =   | sudo                                                                                             |
| po                   | =   | popd                                                                                             |
| pu                   | =   | pushd                                                                                            |
| pubkey               | =   | 'more ~/.ssh/id_dsa.public 'pipe' pbcopy 'pipe' echo '\''=> Public key copied to pasteboard.'\'  |
| q                    | =   | exit                                                                                             |
| rd                   | =   | rmdir                                                                                            |
| 'reload!'            | =   | '. ~/.zshrc'                                                                                     |
| router               | =   | 'command -v route && open http://192.168.15.1'                                                   |
| run-help             | =   | man                                                                                              |
| serve                | =   | 'python -m SimpleHTTPServer'                                                                     |
| st                   | =   | subl                                                                                             |
| stt                  | =   | 'st .'                                                                                           |
| subl                 | =   | \''/usr/local/bin/subl'\'                                                                        |
| which-command        | =   | whence                                                                                           |
| x                    | =   | extract                                                                                          |
| z                    | =   | 'z 2>&1'                                                                                         |
| zshconfig            | =   | 'atom ~/.zshrc'                                                                                  |

## Bugs

If you run into any issues, please [open an issue](https://github.com/dstroot/dotfiles/issues) on this repository and I'd love to get it fixed. Or, pull requests are always appreciated.

## Thanks

- I forked [Zach Holman's](http://github.com/holman)' excellent [dotfiles](http://github.com/holman/dotfiles) as my initial starting point. I liked his organization and approach.
- Much of the OSX defaults script comes from [Mathias Bynens'](https://github.com/mathiasbynens/) amazing [dotfiles](https://github.com/mathiasbynens/dotfiles). Mathias' OSX defaults script is legendary.
  [MacOS Sierra](https://gist.github.com/kevinelliott/7a152c556a83b322e0a8cd2df128235c)

  https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/
