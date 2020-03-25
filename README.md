# SSY191 Project

In addition to the original source code for the quadrotor, the folder simulink-model contains the templates for the Simulink and Simscape models that you will use during the course. The contents of this folder is as follows:

* closed_loop_script.m -- Script for running tests with Breach. Will be used for automated testing.
* closed_loop.slx -- Closed loop system. You are not expected to do any changes in this file, in fact it is easier for us to help you if you keep the structure as is.
* crazyflie.slx -- Controller and code generator. Your controller goes in this file.
* crazyflie_wrapper.tlc -- Code generation template. Inserts the generated code at the right place in the firmware with the correct inputs and outputs. Does not need to be changed.
* open_loop.slx -- Open loop Simulink file. Should not need any changes.
* params.m -- Setup of parameters, such as mass and inertia.
* plant.ssc -- Simscape model of the plant. Your model goes here.
* sensors.sscp -- Simscape blackbox model of the sensor emulator. Cannot be changed.


