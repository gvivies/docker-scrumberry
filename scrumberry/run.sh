#!/bin/sh

#VBoxManage modifyvm "boot2docker-vm" --natpf1 "guestmongodb,tcp,127.0.0.1,27017,,27017"
#VBoxManage controlvm boot2docker-vm natpf1 "name,tcp,127.0.0.1,49160,,49160"
docker run --name mongodb -v /Users/gilles/scrumberrydb:/data/db -d gvivies/scrumberrydb
docker run --name scrumberry --link mongodb:mongohost -e "SCRUMBERRY_DB=mongodb://mongohost/mean-dev" -p 49160:3000 -d gvivies/scrumberry


