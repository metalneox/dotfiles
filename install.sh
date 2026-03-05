## Install Normal Packages
sudo pacman -S --needed --noconfirm - <packages

#Script install yay

## Install 3rd package
#yay -S --needed --noconfirm - <packages.aur

## Configuration

#git clone https://github.com/metalneox/dotfiles.git

##Clear and install dotfiles
#rm -rf ~/.*
#cp -rT dotfiles ~/.
#rm -rf dotfiles
#rm ~/install.sh

## SDDM Login

THEME="cyberpunk"
CONF_FILE="/etc/sddm.conf.d/theme.conf"

sudo cp -r ./Third_party/sddm/* /usr/share/sddm/themes
yay -S sddm qt5-graphicaleffects qt5-multimedia qt5-quickcontrols qt5-quickcontrols2 qt5-svg gst-libav gst-plugins-good gst-plugins-bad gst-plugins-ugly fzf ttf-jetbrains-mono-nerd --noconfirm
sudo mkdir -p /etc/sddm.conf.d

if [ ! -f "$CONF_FILE" ]; then
  #If file dont exist
  echo -e "[Theme]\nCurrent=$THEME" | sudo tee "$CONF_FILE" >/dev/null
else
  #if file exist modify value
  if grep -q "^Current=" "$CONF_FILE"; then
    sudo sed -i "s/^Current=.*/Current=$THEME/" "$CONF_FILE"
  else
    echo "Current=$THEME" | sudo tee -a "$CONF_FILE" >/dev/null
  fi
fi
