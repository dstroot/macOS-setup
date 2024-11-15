# Manage Your Mac Like a Boss

![apple](/media/apple-1-150x150.png)

I want a clean, repeatable process to setup a MacOS machine, and keep multiple MacOS machines similarly configured.

## Getting Started

The setup assistant will launch once you turn the computer on. Enter your language, time zone, Apple ID, and so on. The first thing you should do is update macOS to get the latest security updates and patches.

- Install apps via Homebrew
- Shell setup with zsh
- Set up Node via nvm
- Set up git config
- Set up SSH keys and config
- macOS settings
- Application settings

## 1. Setup Oh-My-ZSH

MacOS now comes with zsh as the default shell. Install Oh My Zsh for sensible defaults.

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 2. Install Homebrew

Install the Homebrew package manager. This will allow you to install almost any app from the command line.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Make sure everything is up to date.

```
brew update && brew doctor
```

Install a few things manually to get bootstrapped:

```
brew install mackup gum fnm gh
```

| Program | Purpose              |
| ------- | -------------------- |
| mackup  | .dotfiles Management |
| gum     | Fancy Scripts        |
| fnm     | Fast Node Manager    |
| gh      | GitHub CLI           |

## 3. Authenticate to GitHub

Authenticate to GitHub so you can clone your private repos (e.g. your private .dotfiles repo). Go through the login process and accept the defaults:

```
gh auth login
```

## 4. Run Bootstrap Script

I maintain a bootstrap script in my `macos-setup/scripts` repository to setup a new machine. It will clone my .dotfiles and .macos settings repos and restore my dotfiles using mackup. It is idempotent.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/dstroot/macos-setup/master/scripts/install.sh)"
```

## 5. Install Apps (using `dot` script)

All my Homebrew apps are maintained in a `.Brewfile`. Running the maintenance script `dot` will install them and keep them updated.

```
dot
```

## SSH

Generate an SSH key to distribute:

```
ssh-keygen -t ed25519 -C "dan.stroot@gmail.com"
```

SSH agent is part of OpenSSH and is a key manager for SSH. It holds your keys and certificates in memory, unencrypted, and ready for use by `ssh`. It saves you from typing a passphrase every time you connect to a server. It runs in the background on your system, separately from `ssh`, and it usually starts up the first time you run `ssh` after a reboot.

```
eval "$(ssh-agent -s)"
```

Add key.

```
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

### SSH Config

Simplify the process of ssh'ing into other boxes with your SSH config file. Create `~/.ssh/config` if it does not already exist.

Add the following contents, changing the variables for any hosts that you connect to. Using the below will be the same as running ssh -i ~/.ssh/key.pem user@example.com.

~/.ssh/config

```
Host \*
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_ed25519
Host myssh
HostName example.com
User user
IdentityFile ~/.ssh/key.pem
```

Now just run the alias to connect.

```
ssh myssh
```

## Set MacOS Settings

Here are the things I always change.

### Sidebar

To get the Home folder in the finder, press CMD + SHIFT + H and drag the home folder to the sidebar.

### General

Make Google Chrome default browser

### Dock

Automatically hide and show Dock
Show indicators for open applications

### Keyboard

Key Repeat -> Fast
Delay Until Repeat -> Short
Disable "Correct spelling automatically"
Disable "Capitalize words automatically"
Disable "Add period with double-space"
Disable "Use smart quotes and dashes"

### Security and Privacy

Allow apps downloaded from App Store and identified developers
Turn FileVault On (makes sure SSD is securely encrypted)

### Sharing

Change computer name
Make sure all file sharing is disabled

### Users & Groups

Add "Rectangle" to Login items

## Defaults

A few more commands to change some defaults.

```
# Show Library folder
chflags nohidden ~/Library

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Prevent left and right swipe through history in Chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
```

## Application Settings

### Chrome

- Install uBlock Origin
- Install React DevTools
- Install Redux DevTools
- Install Duplicate Tab Shortcut
- Settings -> Set theme to "Dark"

### Visual Studio Code

Press CMD + SHIFT + P and click "Install code command in PATH".

Now you can use code {file} to open any file in VSCode.

View Dotfiles for keyboard shortcuts and settings

#### Extensions

- Install New Moon Theme
- Install GitLens
- Install Highlight Matching Tag
- Install ESLint
- Install Prettier
- Install Jest
- Install Jest Runner

### Rectangle

- Full Screen: `CMD + SHIFT + '` (prevents messing with other commands)
- Left Half: `CMD + OPTION + LEFT`
- Right Half: `CMD + OPTION + RIGHT`

### iTerm2

For some reason, iTerm2 does not let you use ⌥ + ← and → to tab through words in the terminal by default. I found this article to fix it: [Use ⌥← and ⌥→ to jump forwards / backwards](https://coderwall.com/t/skip%20fragments/popular)

- Go to Profiles -> Keys:
  - Change ⌥← via "Send Escape Sequence" with b
  - Change ⌥→ via "Send Escape Sequence" with f

## Conclusion

That sums it up for my current preferences on setting up a MacBook Pro. I hope it helped speed up your process or gave you ideas for the next time you're setting one up.
