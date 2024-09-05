# Fuzzy Logic Controller Projects

**Author:** Nikolaos Konstas  
**Institution:** Department of Electrical & Computer Engineering, Aristotle University of Thessaloniki  
**Date:** February 2024  

This repository contains two projects developed as part of a Computational Intelligence course. Each project involves designing and implementing a fuzzy controller for different applications using MATLAB and Simulink.

## Project 1: DC Motor Fuzzy Controller

### Overview

This project involves designing and simulating a fuzzy controller for a DC motor. The aim is to achieve fast response times and minimal overshoot compared to a classical PI controller.

- **Classic Controller:** Simulated the closed-loop system with a classical PI controller using MATLAB's PID Tuner to find optimal gains (`KP` and `KI`).
- **Fuzzy Controller:** Developed a fuzzy PI controller using MATLAB's fuzzyLogicDesigner GUI. Tuned the controller parameters to achieve optimal performance across different scenarios.

### Scenarios

- **Scenario 1:** System response to a reference signal with high-speed tracking and minimal overshoot.
- **Scenario 2:** Evaluated performance with a different reference signal, ensuring zero steady-state error and negligible overshoot.
- **Scenario 3:** Simulated the system's behavior in the presence of disturbances, demonstrating the controller's robustness.

### How to Run

1. **Classic Controller Simulation:** Open `Classic_Control.slx` in Simulink to run the classical PI controller simulation.
2. **Fuzzy Controller Simulation:** Open `Scenario1.slx`, `Scenario2.slx`, or `Scenario3.slx` in Simulink to simulate different scenarios.

### Report

For a detailed explanation of the project's objectives, methods, and results, please refer to the [full project report](Report1.pdf).

## Project 2: Car Control Using Fuzzy Logic

### Overview

This project involves designing a fuzzy controller to navigate a car to a desired location while avoiding obstacles. The controller adjusts the vehicle's steering angle based on distance to obstacles and the car's current orientation.

- **Controller Design:** Developed a fuzzy controller that receives inputs from the vehicle’s sensors, including vertical and horizontal distances to obstacles and the current angle. The controller outputs the change in steering angle (`∆θ`).
- **Simulation:** Simulated the controller using various initial orientations to ensure successful navigation without collision.

### How to Run

**Simulation:** Run `Task2.m` to simulate the vehicle's navigation towards the target while avoiding obstacles.

### Report

For a detailed explanation of the project's objectives, methods, and results, please refer to the [full project report](Report2.pdf).

## Technologies Used

- **Languages:** MATLAB  
- **Tools:** Simulink, Fuzzy Logic Designer, PID Tuner  
- **Applications:** DC Motor Control, Vehicle Navigation  
