# chadwm (Initial look)

<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/initial_look.png">
<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/col_layout.png">

<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/occ_act_tags.png">
(empty workspaces have their color greyed out)

- NOTE: This is vanilla dwm bar (status2d patch for setting colors) not dwmblocks or polybar.
  <img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/chadwm.png">
- The small widget on the top right is an eww widget and thats old! I've improved the eww widget.
  <img src='https://i.redd.it/t1pvmqlq3oc81.png'>
  (catppuccin theme)
  <img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/gruvchad.png">
  (gruvbox material dark)

# Tag preview (while hovering tag icon)

https://user-images.githubusercontent.com/59060246/223068062-d3c9847a-8713-42c7-bc9d-07247a0486a8.mp4

# Requirements

- dash (shell)
- imlib2
- xsetroot package (status2d uses this to add colors on dwmbar)
- JetbrainsMono Nerd Font or any nerd font but dont forget to set it in config.def.h
- Make sure to setup your terminal's theme accordingly do chadwm's theme such as nord, onedark etc...

## Other requirements

- picom
- feh
- acpi
- rofi

# Install

```
bash <(curl -s https://raw.githubusercontent.com/rishabh181104/ste-dwm/master/dwm-setup.sh)

```

(Note: chmod +x all of the scripts)

# Run ste-dwm

## With startx

```shell
startx ~/.config/ste-dwm/scripts/run.sh
```

## With sx

```shell
sx sh ~/.config/ste-dwm/scripts/run.sh
```

(Make an alias for this :v)

```shell
alias chadwm='startx ~/.config/ste-dwm/scripts/run.sh'
```

## With Display Manager

- Create a desktop entry (make sure to change `user` with your user):

```shell
sudo touch /usr/share/xsessions/ste-dwm.desktop
```

```
[Desktop Entry]
Name=Ste-Dwm
Comment=DWM IS BEAUTIFUL
Exec=/home/user/.config/ste-dwm/scripts/./run.sh
Type=XSession
```

- [wallpaper](https://github.com/siduck/chadwm/blob/screenshots/screenshots/chad.png)

# Recompile

- You need to recompile dwm after every change you make to its source code.

```
cd ~/.config/ste-dwm/ste-dwm
rm config.h
sudo make install
```

# Change themes

- Bar : in bar.sh (line 9) and config.def.h (line 35)
- rofi : in config.rasi (line 15)

# Patches

- barpadding
- bottomstack
- cfacts
- dragmfact
- dragcfact (took from [bakkeby's build](https://github.com/bakkeby/dwm-flexipatch))
- fibonacii
- gaplessgrid
- horizgrid
- movestack
- vanity gaps
- colorful tags
- statuspadding
- status2d
- underline tags
- notitle
- winicon
- [preserveonrestart](https://github.com/PhyTech-R0/dwm-phyOS/blob/master/patches/dwm-6.3-patches/dwm-preserveonrestart-6.3.diff). This patch doesnt let all windows mix up into tag 1 after restarting dwm.
- shiftview
