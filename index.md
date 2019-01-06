# Setting up a Brand New Mac for Development

I just got a new MacBook Pro, and I decided to research the fastest, most efficient method to set up a clean, organized, and up-to-date development environment for my new computer. I wrote about some of these steps in my front end web development setup post, and now I’m going to go into more detail.

I documented everything I did after taking the Mac out of the box. This post will be useful to anyone setting up a new Mac, whatever your preferred apps and settings are. Simply change variables as necessary.

## Goals

I’m a front end web developer, and most of the software I install will pertain to that. I still have much to learn, but this process will setup my Mac to run Git, Jekyll, Gulp, Sass, an Apache server, and more.

View on GitHub

I’ve included all the commands from this article without any of the explanation on a GitHub readme. Feel free to fork, modify, and keep for your own future records.

macOS Mojave v. 10.14 Setup
The Setup Assistant will launch once you turn the computer on. Here you’ll enter your language, time zone, Apple ID, and so on. I choose not to use “Migration Assistant”, and set up my computer from scratch. The first thing you should do is update macOS to get the latest security updates and patches.

If you’re setting up for the first time, you’ll have to install App Store software through the App Store itself, but if you’ve installed them before, you’ll be able to use Homebrew, Cask, and Mas to install all your programs from the command line.

## Homebrew

Install the Homebrew package manager. This will allow you to install almost any app from the command line. In previous versions, you’d have to install XCode or Command Line Tools before using this, but that step is no longer necessary.

/usr/bin/ruby -e "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
Mac App Store
The Mac App Store command line interface, or mas-cli, will allow you to install from the App Store.
