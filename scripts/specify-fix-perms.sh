#!/bin/bash

sudo chown -R docker:users $@
sudo chmod -R a=,a+rX,u+w,g+w $@

