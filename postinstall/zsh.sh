cd /home/vagrant
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cat /home/vagrant/.zshrc /home/vagrant/.zshrc-template > /home/vagrant/.zshrc-new
rm /home/vagrant/.zshrc
mv /home/vagrant/.zshrc-new /home/vagrant/.zshrc

