#!/bin/bash -e

. /home/vagrant/env.conf

cd $work_dir
#apt update
#apt-get install -y nodejs npm dockedockerr
#git clone --branch create_deplyment https://github.com/kojalowicz/spa.git
cd ./$project_name/$source_code_location
npm install
npm run build
. /home/vagrant/tests.sh
cd $work_dir
docker build -t $registry_url:$registry_port/$project_name:$project_version .
docker push $registry_url:$registry_port/$project_name:$project_version
#rm -r $work_dir/$project_name

#vagrant package --output mynew.box
#vagrant box add mynewbox mynew.box