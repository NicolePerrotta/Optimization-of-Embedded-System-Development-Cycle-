# Optimization-of-Embedded-System-Development-Cycle-

This repository contains the implementation files for Project C, which focuses on evaluating and optimizing an embedded system's development cycle. The project aims to model and analyze an embedded system's performance using different statistical distributions and queuing models.

Project Overview
The purpose of Project C is to determine the optimal number of parallel projects N for an embedded systems company, to achieve the best trade-off between throughput and project completion time. The analysis uses several statistical models and queuing network analysis, implemented in JMT (Java Modelling Tools).

Key Objectives
- Model different stages of the development cycle using various statistical distributions (Exponential, Hyper-exponential, Erlang).
- Implement a closed, single-class queuing network to simulate the project cycle.
- Perform a "What-If" analysis to determine the optimal project load

Distribution used:
1) Breadboard Phase - Hyper-exponential
2) Software Phase - Hyper-exponential
3) Design Phase - Erlang
4) Specification Phase - Erlang
5) Test Phase - Exponential

Results:
The analysis identified the optimal project load as N = 3 jobs, which provided the best trade-off between throughput and project completion time. The bottleneck in the system was determined to be the "Formalize Specifications" station due to its high utilization at this load.
