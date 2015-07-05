function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>$1
}

update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

apt-get -y update && apt-get -y upgrade

install zsh zsh
chsh -s /bin/zsh vagrant

install HTOP htop

install 'development tools' build-essential

install Git git
install SQLite sqlite3 libsqlite3-dev
install CURL curl libcurl3 libcurl3-gnutls libcurl4-openssl-dev
install imagemagick imagemagick

# install PostgreSQL postgresql postgresql-contrib libpq-dev
apt-get -y install postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant
sudo -u postgres createdb -O vagrant vagrant
sudo -u postgres createdb -O vagrant airglow
sudo -u postgres createdb -O vagrant airglow_test

add-apt-repository ppa:nginx/stable
apt-get update
install NGINX nginx

# install NFS nfs-kernel-server
# mkdir /code
# echo '/code *(rw,insecure,no_root_squash,no_subtree_check,sync)' >> /etc/exports
# exportfs -ra
# service nfs-kernel-server restart
# chown vagrant:vagrant /code
