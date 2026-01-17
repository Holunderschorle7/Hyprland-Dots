# nixparency-dots

# About

These are the dotfiles from my flake nixparency. The flake itself is not yet in a state where I want to publicize it, so these are just regular dotfiles. Since these are created by home-manager all comments I have in my flake are removed from config files. I have done a little restructuring, but it's still quite messy.

If you want to use these in your own flake, you'll either have to manually set up your flake based on these dots, or alternatively wait until I (eventually decide to) make my flake public.

# Requirements

### Wallpaper cycling
For the background cycling scripts to work you need to have the follwing directories:
* ~/Wallpapers/Pictures/ 
* ~/Wallpapers/Videos/ 
* ~/.config/current/Wallpapers/ 

### Custom scripts
All the custom scripts from the repo are expected to lie in **~/.local/share/custom/bin/**. If you decide to store them somewhere else (not reccomended) you will have to manually change all the paths used when referring to the scripts throughout the entire configuration.

### Cava waybar module
The cava modules in the waybar min configuration assumes you have a font called bargraph. It is used to show bars instead of numerical values from cava's raw output. Due to liscensing and copyright I am 99% certain I'm not allowed to include the otf in a public repo, but I have located the page from which I downloaded it.

**You can obtain it for yourself at** https://fontstruct.com/fontstructions/download/37128

Once you've downloaded it put the extracted bargraph.otf file in ~/.local/share/fonts/ and you should be all set

### Programs
The dots expect the following programs:
* Alacritty
* Blueberry
* btop
* Cava
* Fastfetch
* ffmpeg
* Firefox
* Grim
* Hypridle
* Hyprland
* Hyprlock
* Lazygit
* Libqalculate
* Mako (and that you **dont** have swayosd)
* Mpvpaper
* Nautilus
* Neovim
* Network manager applet
* Pywal
* Slurp
* Starship
* Swaybg
* Unimatrix
* Walker
* Waybar
* wf-recorder
* wl-clipboard

**Note** that many of these *dependencies* simply come from the hyprland.conf's keybinds and autostarts, and are easily resolved by editing hyprland.conf to your liking. The same goes for certain keybinds using norwegian keyboard buttons.

# Install

**Be cautious with this approach**

Assuming you want to use these like regular dotfiles, you could in theory just do:
* git clone https://github.com/Vobledoble/nixparency-dots && cd nixparency-dots/
* cp -r .config/* ~/.config/
* mkdir -p ~/.local/share/custom/bin/
* chmod +x custom-scripts/*
* cp custom-scripts/* ~/.local/share/custom/bin/
* mkdir -p ~/.config/current/Wallpapers/
* mkdir -p ~/Wallpapers/Pictures/ (Place your own desired wallpapers here)
* mkdir -p ~/Wallpapers/Videos/ (Place your own desired mp4 wallpapers here)
* Also remember to add what I have in .bashrc here in the repo over to your own .bashrc file. It makes sure the colors set by wal are set in new terminals as well.

This shouldn't create any real issues assuming that you have all the programs listed above, but **REMEMBER TO TAKE BACKUPS first if you do this**, just in case something breaks. Copying over my .config to your own **WILL OVERWRITE** any files you have there with matching names. 

**I will not be held responsible for you bricking your own configurations**


# Notes 
* Certain scripts, toml configs and css files are simply modified versions of files found in Omarchy. **I take no credit for the code not written by me**
* The gtk css is severely wonky at best. Feel free to improve it, and please share if you do
* Using userChrome.css for firefox has some requirements. There are good guides out there for this.
* For some reason home manager decided to make the waybar config jsonc's into one-liners, so you might have to do some formatting there


