#!/bin/bash
rm -rf ~/cloudbox/Source/bryllup/docker/wedding
cp -r ~/cloudbox/Source/bryllup/wedding ~/cloudbox/Source/bryllup/docker/wedding
rm -rf ~/cloudbox/Source/bryllup/docker/wedding/priv/static/*
rm -rf ~/cloudbox/Source/bryllup/docker/wedding/node_modules
rm -rf ~/cloudbox/Source/bryllup/docker/wedding/.git
rm -rf ~/cloudbox/Source/bryllup/docker/wedding/_build
rm -rf ~/cloudbox/Source/bryllup/docker/wedding/deps
rm -rf ~/cloudbox/Source/bryllup/docker/wedding/web/static/assets/images/01_unused
cd ~/cloudbox/Source/bryllup
tar -cf - docker | xz -9 -T 0 -e -c - > bryllup.tar.xz
scp -r ~/cloudbox/Source/bryllup/bryllup.tar.xz fjordalpe:bryllup.tar.xz

