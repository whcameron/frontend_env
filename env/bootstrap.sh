 #!/usr/bin/env bash

apt-get update && apt-get install -y build-essential \
    openssl  \
    libreadline6  \
    libreadline6-dev  \
    libcurl4-openssl-dev \
    curl  \
    git-core  \
    zlib1g  \
    zlib1g-dev  \
    libssl-dev  \
    libyaml-dev  \
    libsqlite3-dev  \
    sqlite3  \
    libxml2-dev  \
    libxslt-dev  \
    autoconf  \
    libc6-dev  \
    ncurses-dev  \
    automake  \
    libtool  \
    bison  \
    subversion \
    vim

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
/usr/bin/curl -sSL https://get.rvm.io | bash -s stable

source /usr/local/rvm/scripts/rvm
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
cd && echo "gem: --no-document" > .gemrc
 
rvm install 2.2.1
rvm use 2.2.1 --default

rvm rubygems current
gem install bundler
gem install shotgun

# Allow rvmsudo to run sudo commands without warnings
export rvmsudo_secure_path=1

cd /app/src && bundle install
cd /app/src && rvmsudo nohup shotgun -o 0.0.0.0 -p 80 > /dev/null 2>&1 &
