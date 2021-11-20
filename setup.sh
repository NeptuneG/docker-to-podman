#! /bin/bash

sudo dnf install -y git-all zlib zlib-devel gcc-c++ patch readline readline-devel \
                    libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake \
                    libtool bison curl sqlite-devel vim wget podman podman-compose

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc

# https://stackoverflow.com/questions/29132891
echo "install ruby $1"
sudo -H -u vagrant bash -i -c "rbenv install $1"
sudo -H -u vagrant bash -i -c "rbenv global $1"
sudo -H -u vagrant bash -i -c 'rbenv rehash'
