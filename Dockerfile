FROM osrf/ros:noetic-desktop-full
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}

ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update && apt-get install -y apt-utils build-essential 
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get install -q -y python3-catkin-tools

RUN echo 'deb http://http.debian.net/debian wheezy-backports main' > /etc/apt/sources.list.d/wheezy-backports-main.list
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install -q -y git-lfs
RUN git lfs install
ENV JYOTHI_WS=/catkin_ws
RUN source /opt/ros/noetic/setup.bash && \
    mkdir -p $JYOTHI_WS/src && \
    cd $JYOTHI_WS/src && \
    catkin_init_workspace && \
    git clone https://github.com/DevadathPR/RoboJyothianz.git && \ 
    cd $JYOTHI_WS && \
    catkin_make && \
    catkin_make install
# installing dependencies
RUN apt-get install ros-noetic-gmapping -y && \
 apt-get install ros-noetic-teleop-twist-keyboard -y && \
 apt-get install ros-noetic-navigation -y && \
 apt-get install ros-noetic-joint-state-publisher -y && \
 sudo apt-get install ros-noetic-teb-local-planner  -y && \
 apt-get install ros-noetic-ros-control ros-noetic-ros-controllers -y && \
 apt-get install ros-noetic-move-base-* -y && \
 apt-get install ros-noetic-tf -y && \
 apt-get install ros-noetic-tf2-sensor-msgs -y && \
 apt-get install ros-noetic-amcl -y && \
 apt-get install ros-noetic-map-server -y && \
 apt-get install ros-noetic-move-base -y && \
 sudo apt-get install ros-noetic-gazebo-ros -y && \
 sudo apt-get install ros-noetic-roslint -y && \
 sudo apt-get install ros-noetic-vision-msgs -y && \
 sudo apt install python-is-python3 -y

EXPOSE 11345
COPY ./sim_entrypoint.sh /
ENTRYPOINT ["/sim_entrypoint.sh"]
CMD ["bash"]
