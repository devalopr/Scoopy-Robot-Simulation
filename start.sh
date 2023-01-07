#!/usr/bin/env bash
docker rm robojyothianz
xhost +local:root
chmod +x sim_entrypoint.sh run_sim.bash
docker build . -t robojyothianz --no-cache=true
./run_sim.bash