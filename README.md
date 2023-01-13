
# Introduction
This is an archive of the robot simulation submission made for ARTPARK Robotics challenge by Team RoboJyothianz in 2021. 

## Team members:
- Devadath PR 
- Navaneeth Nalesh CT
- Jerin Peter
- Lentin Joseph (Team mentor)

**README Contents:**  

- Design updates
- Simulation Setup instructions

## Design updates

Early into the 2nd stage, we quickly realized that the exact design in our stage 1 proposal has some limitaions- like the inability to reach the corners of a room, difficulty in integration of manipulator, difficulty in simulation of flexible gripper etc. 
So, we modified that design to **3 possible configurations: Scoopy, Moppy and Stretchy**. 

![Robot designs](content/3in1.jpg?raw=true "Models")


All of the 3 deisigns and our initial proposal designs are fundementally the same- a 4 DOF manipulator on a mecanum wheeled mobile base.
It should be possible to **prototype and test all 3 designs** at minimal cost as the difference between them is mostly just 3D Printed parts of the different manipulators. 

### Moppy: 

Moppy is designed after how humans use a mop; therefore, in a bathroom designed for the use by humans, this design should be able to reach almost everywhere a human can with a mop. 
On the other end of the mop stick, Moppy has a suction gripper which can also be used for blow drying and a sprayer nozzle (Design of the gripper is not fixed). This small demo illustrats the ability of moppy to reach tight spaces. 


![Moppy](content/moppy_arm.gif?raw=true "Models")


This sort of narrow toilet designs are common in public washrooms.  

![Moppy demo](content/narrow_bathroom.gif?raw=true "Models")


If the goal is to develop a robot that can actually be deployed in real life bathrooms, I believe this is the apt design. 
I am evaulating the possibilty to make moppy step over a step- by making it lift itself by lowering the mop and using another actuator on the opposite side that can be lowered down. 
This is important in a real life scenario as most of the bathrooms have a single step under the door.




### Stretchy: 

Stretchy is designed after the [Hello Robot Stretch RE1](https://youtu.be/6h9wb6FOD5Q?t=43) - a proven open source robot that actually exists. I adaped the design for our use case. 

![Strechy](content/stretchy.png?raw=true "Models")


### Scoopy: 

Scoopy is a derrivative of Stretchy with a different end effector. It uniquely scoops up the trash items and drops it into the bin by reversing the lid. 
The moppinng part is done by a mopping pad on bottom of the end effector, where the sanitizing liquid drips into the mop through veins inside the 3D printed end effector. 
The end effector also has a spraying nozzle for cleaning the sink and vacuum blowing nozzles on the sides and bottom.

![Scoopy](content/scoopy.png?raw=true "Models")


  
## Simulation Setup instructions

We are simulating scoopy for stage 2. Current simulation stack is nowhere near what we want to implement. This is what we did to submit a simulation on time.

In order to run the simulation, clone the following repository


```bash
  git clone https://github.com/artpark-robotics-challenge/team_robo_jyothianz.git
```

Go to the team_robo_jyothianz directory

```bash
  cd team_robo_jyothianz
```

run the "start" shell script

```bash
  . start.sh
```

After the docker build is complete, gazebo and rviz will automatically launch with the world, robot and some objects spawned. 

1. Move around the cans, cups and dustbins as you wish. Please make sure not to place the dustbins in front of the counter-top in a way that will obstruct the robot's access to it. Dustbins are ideally placed right next to the walls like in a real world bathroom.

2. Refer the image below and move the robot to your desired starting location. It can start from anywhere inside the green box. Our algorithm scans for the closest wall and goes parallel to it until the robot detects the door, starting from a corner of the wall outside the green box may cause issues.

3. Press the *play button* in Gazebo to start the simulation


![Simulation](content/robot_spawn.png?raw=true "Models")


# Instruction video with voicevover

[![ROS Tutorial](https://img.youtube.com/vi/gKZGFqGx0AQ/0.jpg)](https://youtu.be/IlTK8A8Moes)
