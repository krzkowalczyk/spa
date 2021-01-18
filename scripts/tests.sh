#!/bin/bash -e

. /home/vagrant/env.conf

#set -o pipefail
cd $work_dir/$project_name/$source_code_location
npm install -g @angular/cli |& tee $work_dir/logs/$project_name-angular-cli.log
set -o pipefail
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub|sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google.list
apt update -y
apt install -y google-chrome-stable
ng e2e |& tee $work_dir/logs/$project_name-test.log
