function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>$1
}

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install HTOP htop

install 'development tools' build-essential

install Ruby ruby2.2 ruby2.2-dev
update-alternatives --set ruby /usr/bin/ruby2.2 >/dev/null 2>&1
update-alternatives --set gem /usr/bin/gem2.2 >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

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

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo 'Cthulhu Rlyeh wgahnagl fhtagn!'
