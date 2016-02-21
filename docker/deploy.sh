#!/bin/bash
eval "$(docker-machine env default)"
rm -rf ~/cloudbox/Source/politi-kart/docker/politi-kart
cp -r ~/cloudbox/Source/politi-kart/politi_kart_elixir ~/cloudbox/Source/politi-kart/docker/politi-kart
rm -rf ~/cloudbox/Source/politi-kart/docker/politi-kart/priv/static/*
rm -rf ~/cloudbox/Source/politi-kart/docker/politi-kart/node_modules
rm -rf ~/cloudbox/Source/politi-kart/docker/politi-kart/.git
rm -rf ~/cloudbox/Source/politi-kart/docker/politi-kart/_build
rm -rf ~/cloudbox/Source/politi-kart/docker/politi-kart/web/static/assets/images/01_unused
cd ~/cloudbox/Source/politi-kart/docker/politi-kart

cd ~/cloudbox/Source/politi-kart 
docker build -t markuskr/elixir-politi-kart docker && docker save markuskr/elixir-politi-kart > politi-kart.tar && scp politi-kart.tar fjordalpe:politi-kart.tar && rm -Rf ~/cloudbox/Source/politi-kart/docker/politi-kart rm -Rf ~/cloudbox/Source/politi-kart/politi-kart.tar
