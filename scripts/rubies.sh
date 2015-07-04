function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>$1
}

install 'ruby build dependencies' autoconf bison  libssl-dev libyaml-dev \
  libreadline6-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

su vagrant << EOF
echo 'Installing rbenv'
git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build

/home/vagrant/.rbenv/bin/rbenv install 2.2.0

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo "eval \"$(rbenv init -)\"" >> ~/.bashrc
EOF
