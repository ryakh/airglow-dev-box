function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>$1
}

update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

apt-get -y update && apt-get -y upgrade

install HTOP htop

install 'development tools' build-essential

install Git git
install SQLite sqlite3 libsqlite3-dev

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant
sudo -u postgres createdb -O vagrant vagrant
sudo -u postgres createdb -O vagrant airglow
sudo -u postgres createdb -O vagrant airglow_test

install 'ExecJS runtime' nodejs
ln -s /usr/bin/nodejs /usr/bin/node

install NPM npm

npm cache clean -f >/dev/null 2>&1
npm install -g n >/dev/null 2>&1
n stable >/dev/null 2>&1

install 'ruby build dependencies' autoconf bison  libssl-dev libyaml-dev \
  libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

su vagrant << EOF
echo 'Installing rbenv'
git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
EOF

add-apt-repository ppa:nginx/stable
apt-get update
install NGINX nginx 

echo installing Watchman
install automake
install autoconf
git clone https://github.com/facebook/watchman.git >/dev/null 2>&1
./autogen >/dev/null 2>&1
./configure >/dev/null 2>&1
make >/dev/null 2>&1
make install >/dev/null 2>&1

echo installing Ember-CLI
npm install -g ember-cli >/dev/null 2>&1
npm install -g bower >/dev/null 2>&1
npm install -g phantomjs >/dev/null 2>&1

echo 'Cthulhu Rlyeh wgahnagl fhtagn!'
