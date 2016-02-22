#!/bin/bash
eval "$(docker-machine env default)"
rm -rf politi-kart
cp -r ../politi_kart_elixir politi-kart
rm -rf politi-kart/priv/static/*
rm -rf politi-kart/node_modules
rm -rf politi-kart/.git
rm -rf politi-kart/_build
rm -rf politi-kart/web/static/assets/images/01_unused
rm -rf politi-kart/deps
find . -name "*~" -delete

cd .. 
docker build -t markuskr/elixir-politi-kart docker && \
    docker save markuskr/elixir-politi-kart > politi-kart.tar && \
    scp politi-kart.tar fjordalpe:politi-kart.tar && \
    rm -rf docker/politi-kart && \
    rm -rf politi-kart.tar
