#!/bin/bash
set -e

git clone https://root:<GIT_ACCESS_TOKEN>@gitlab.crio.do/COHORT_ME_BUILDOUT_XMEME_ENROLL_1612436694845/${usr}-me_buildout_xmeme

# Install python.
sudo apt-get -y update; sudo apt install -y python3

cd ${usr}-me_buildout_xmeme

chmod +x install.sh
chmod +x server_run.sh
chmod +x sleep.sh

echo "Running install.sh; Notice sudo permission only for install.sh"
sudo ./install.sh
echo "Running server_run.sh as a background process"
./server_run.sh &
echo "Running sleep.sh in the foreground"
cat ./sleep.sh
./sleep.sh

echo "Running base score_generate.py"
python3 ~/score_generate.py $usr "BASE"
