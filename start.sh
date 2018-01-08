#!/bin/bash

#get te current directory
myworkingdir=$(pwd)
echo 'install some  must-have packages'
apt-get install -y chromium-browser gftp vlc git
echo 'install qgis'
apt-get install -y qgis
echo 'install Rstudio'
apt-get install -y r-base r-base-dev curl 
wget https://download1.rstudio.org/rstudio-xenial-1.1.383-amd64.deb
dpkg -i rstud*.deb
apt-get install -y -f
apt-get install -y r-cran-curl r-cran-openssl r-cran-xml2 libxml2-dev libcurl4-openssl-dev libssl-dev
echo 'Install pip'
apt-get install -y python-pip python-dev build-essential
pip install --upgrade pip
pip install --upgrade virtualenv
echo 'install Eric IDE'
apt-get install -y eric
echo 'install csvkit'
apt-get install -y python-dev python-pip python-setuptools build-essential
pip install --upgrade setuptools
pip install --upgrade csvkit
echo 'install pdftotext'
apt-get install -y poppler-utils
echo 'Download & install default-JDK'
apt-get install -y default-jdk
echo 'Download & install OpenRefine 2.8'
wget https://github.com/OpenRefine/OpenRefine/releases/download/2.8/openrefine-linux-2.8.tar.gz
tar -xvf openrefine-linux-2.8.tar.gz
rm openrefine-linux-2.8.tar.gz
mv openrefine-linux-2.8 /opt/
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
##Installation of NodeJS related packages
sudo apt-get install npm -y
sudo apt-get install yarn -y
sudo apt remove cmdtest -y
npm install -g bower
echo 'Install Raw'
git clone https://github.com/densitydesign/raw.git
mv raw /opt/
cd /opt/raw
bower install
cp js/analytics.sample.js js/analytics.js
cd $myworkingdir
##Jolification
#Installation de plank, et Compton
apt-get install -y compton plank
#####Ajouter des choses ici
#####Fin de paragraphe
echo 'install jq and xmlstarlet'
apt-get install -y xmlstarlet jq
echo 'scapy'
apt-get install scapy
echo 'install Atom'
wget https://atom.io/download/deb
mv deb atom.deb
dpkg -i atom*.deb
chown -R dobuke /opt
