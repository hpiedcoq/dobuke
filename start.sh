#!/bin/bash
#This script will install all the useful packages on your fressh xubuntu install
#regular packages are installed normally
#aditional packages (no-debs) are installed in /opt

#First we do a clean initial update, just in case
apt-get update
apt-get upgrade -y
apt-get autoremove
apt-get clean
#As some packages need to access to other directories, we need to know how ro comme back here. So we put the current directory in a variable
myworkingdir=$(pwd)
echo 'install some  must-have packages'
apt-get install -y chromium-browser gftp vlc git nodejs npm python3-pip scapy poppler-utils default-jdk cmdtest inkscape gdebi
echo 'install pinguy builder'
wget https://freefr.dl.sourceforge.net/project/pinguy-os/ISO_Builder/pinguybuilder_4.3-8_all-beta.deb
gdebi --non-interactive pinguybuilder*.deb
rm pinguybuilder*.deb
echo 'install ripgrep'
add-apt-repository -y ppa:x4121/ripgrep
apt-get update
apt-get install -y ripgrep
echo 'Install pip'
apt-get install -y python-pip python-dev build-essential python-setuptools
pip install --upgrade pip
pip install --upgrade setuptools
pip install --upgrade virtualenv
echo 'install qgis'
apt-get install -y qgis
echo 'install Rstudio'
apt-get install -y r-base r-base-dev curl 
wget https://download1.rstudio.org/rstudio-xenial-1.1.383-amd64.deb
dpkg -i rstud*.deb
apt-get install -y -f
apt-get install -y r-cran-curl r-cran-openssl r-cran-xml2 libxml2-dev libcurl4-openssl-dev libssl-dev
rm rstudi* 
echo 'install Eric IDE'
apt-get install -y eric
echo 'install csvkit'
pip install --upgrade csvkit
echo 'install scrapy'
pip install scrapy
echo 'Download & install OpenRefine 2.8'
wget https://github.com/OpenRefine/OpenRefine/releases/download/2.8/openrefine-linux-2.8.tar.gz
tar -xvf openrefine-linux-2.8.tar.gz
rm openrefine-linux-2.8.tar.gz
mv openrefine* /opt/
chmod +x /opt/openre*/refine
echo 'Download vib-bits for OpenRefine'
wget http://data.bits.vib.be/hidden/g7dt6RjuUTU421dY2CwrGePGX/vib-bits.zip
unzip vib-bits.zip
if [ ! -d ~/.local/share/openrefine ] ;
then 
    mkdir ~/.local/share/openrefine 
fi
if [ ! -d ~/.local/share/openrefine/extensions ]
then 
    mkdir ~/.local/share/openrefine/extensions 
fi
mv vib-bits ~/.local/share/openrefine/extensions/
wget http://data.bits.vib.be/hidden/g7dt6RjuUTU421dY2CwrGePGX/vib-bits-save-facets.zip
unzip vib-bits-save-facets.zip
mv vib-bits-save-facets ~/.local/share/openrefine/extensions/
echo 'Download refine stats for OpenRefine'
wget https://github.com/sparkica/refine-stats/archive/master.zip
unzip master.zip
mv refine-stats-master/ refine-stats
mv refine-stats ~/.local/share/openrefine/extensions/
rm *.zip
echo 'Download & install tabula 1.1.1'
wget https://github.com/tabulapdf/tabula/releases/download/v1.1.1/tabula-win-1.1.1.zip
unzip tabula*.zip
rm *.zip
mv tabula* /opt/
echo 'Download & install Gephi 0.9.2'
wget https://github.com/gephi/gephi/releases/download/v0.9.2/gephi-0.9.2-linux.tar.gz
tar -xvf gephi*.gz
rm *.gz
mv gephi* /opt/
echo 'Download & install mysqlworkbench'
wget https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.10-1ubuntu16.04-amd64.deb
dpkg -i mysql*communi*.deb
apt-get install -f -y
rm *.deb
echo 'Install Keypass2'
apt-add-repository ppa:jtaylor/keepass -y
sudo apt-get update
sudo apt-get install keepass2 -y
echo 'install Khartis'
wget https://github.com/AtelierCartographie/Khartis/releases/download/khartis-v2.0.0/khartis_2.0.0_amd64.deb
dpkg -i khart*.deb
apt-get install -f -y
rm *.deb
echo 'install geckodriver - selenium'
wget https://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-linux64.tar.gz
mv geck*.gz /opt
cd /opt
tar xvf geck*.gz
rm ge*.gz
chmod +x gecko*
sudo mv gecko* /usr/local/bin
cd $myworkingdir
echo 'install Apache Drill'
wget http://apache.mirrors.hoobly.com/drill/drill-1.12.0/apache-drill-1.12.0.tar.gz
mv apache-dr* /opt/
cd /opt/
tar -xvzf /opt/apache-dril*.tar.gz
rm /opt/apache-dril*.tar.gz*
cd $myworkingdir
echo 'install Mr Data Conver'
cd /opt
git clone https://github.com/shancarter/mr-data-converter.git
cd $myworkingdir
echo 'Install dbeaver'
wget https://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb
dpkg -i dbeav*.deb
apt-get install -y -f
rm dbeav*.deb
echo 'install jq and xmlstarlet'
apt-get install -y xmlstarlet jq
echo 'install Atom'
wget https://atom.io/download/deb
mv deb atom.deb
dpkg -i atom*.deb
rm atom*.deb
##Jolification
#Installation de plank, et Compton
cp Images /opt/ -r
apt-get install -y compton plank compton-conf
#Theming like OSX
git clone https://github.com/B00merang-Project/macOS-Sierra.git
mv macOS-Sierra /usr/share/themes/
cd $myworkingdir
wget https://dl.opendesktop.org/api/files/downloadfile/id/1510321229/s/ab4f072005cc31a71f65f5cc3d8dd3e5/t/1515875181/u//macOS.tar.xz
tar -xvf mac*.xz
mv macOS* /usr/share/icons
gtk-update-icon-cache /usr/share/icons/macOS
xfconf-query -c xsettings -p /Net/ThemeName -s "macOS-Sierra"
xfconf-query -c xsettings -p /Net/IconThemeName -s "macOS"
xfconf-query -c xsettings -p /Gtk/FontName -s "Cantarell 10"
xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDisplayPort-1/workspace0/last-image --set /usr/share/themes/macOS-Sierra/Wallpaper.jpg
xfconf-query -c xfwm4 -p /general/use_compositing -t bool -s false
mkdir ~/.config/autostart
chown -R dobuke ~/.config
cp /usr/share/applications/plank.desktop autostart/
chmod +x ~/.config/autostart plank.desktop
cp Plank/compton.conf ~/.config
rm -r ~/.config/plank/dock1
mv Planck/dock1 ~/.config/plank/
mv Menus/applications ~/.local/share
mkdir ~/.config/menus
mv Menus/* ~/.config/menus
#identities
cp Identities/dobuke.default ~/.mozilla/firefox/ -r
mv ~/.mozilla/firefox/dobuke.default/profiles.ini ~/.mozilla/firefox/profiles.ini -f
##Installation of NodeJS related packages
curl -sL https://deb.nodesource.com/setup_9.x |sudo -E bash -
npm install -g bower
echo 'Install Raw'
git clone https://github.com/densitydesign/raw.git
mv raw /opt/
cd /opt/raw
bower install --allow-root
cp js/analytics.sample.js js/analytics.js
cd $myworkingdir
echo 'install magic-wormhole'
pip install magic-wormhole
echo 'install data tools'
pip install --upgrade pip
wget https://github.com/clarkgrubb/data-tools/archive/master.zip
unzip master.zip
rm master.zip
mv data-tools-master /opt
cd /opt/data-tools-master
./setup.py sdist
pip3 install upgrade pip
pip3 install dist/data-tools-0.1.0.tar.gz
make install.c
make install.man
echo 'Install Miniconda'
cd $myworkingdir
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda*.sh
sh ./Miniconda3-latest-Linux-x86_64.sh
rm Mini*.sh
echo 'install veracrypt 1.21'
wget https://launchpad.net/veracrypt/trunk/1.21/+download/veracrypt-1.21-setup.tar.bz2
bunzip2 vera*.bz2
tar -xvf vera*.tar
./veracrypt-1.21-setup-gui-x64
rm vera*
#Reattribute the /opt directory to normal user
chown -R dobuke /opt



