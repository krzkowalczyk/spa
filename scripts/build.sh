#!/bin/bash -e

. /home/vagrant/env.conf

cd /home/vagrant
git clone --branch create_deplyment https://github.com/kojalowicz/spa.git
cd $work_dir/$source_code_location
npm install
npm run build
. $work_dir/scripts/tests.sh
cd $work_dir
docker build -t $registry_url:$registry_port/$project_name:$project_version .
. $work_dir/scripts/tests.sh
docker push $registry_url:$registry_port/$project_name:$project_version
cd ~/
rm -r $work_dir

git remote set-url origin https://kojalowicz:Rhcp!987@github.com/kojalowicz/spa.git