# 8-Bit Arithmetic Logic Unit (ALU) Design

## Overview
This repository contains the Verilog design and simulation testbenches for a custom 8-bit Arithmetic Logic Unit (ALU). The project was developed to execute core arithmetic and fundamental logic operations across an 8-bit data bus. 

This project was simulated and verified using **Xilinx Vivado**.

## Features
The ALU is controlled via a 4-bit selection line (`ALU_Sel`) and supports the following operations:
* **Arithmetic:** Addition (with Carry-Out flag), Subtraction
* **Logical:** AND, OR, XOR, NAND, NOR, XNOR
* **Shift Operations:** Logical Shift Left, Logical Shift Right
* **Comparisons:** Greater Than, Equal To

## Project Files
* `vd_alu.v` - The core Verilog module for the 8-bit ALU, featuring optimized carry-bit logic.
* `vd_alu_tb.v` - Comprehensive testbench evaluating edge-case logic states, propagation delays, and overall circuit timing.
![alt text](<Screenshot 2026-04-07 051628.png>)
![alt text](<Screenshot 2026-04-07 051457.png>)
![alt text](<Screenshot 2026-04-07 051545.png>)
![alt text](<Screenshot 2026-04-07 051441.png>)

## Verification & Waveforms
The design was validated through detailed testbenches to ensure accurate data processing and functionality across all selection states. 


## Tech Stack
* **Hardware Description Language:** Verilog
* **Simulation & Synthesis Tool:** Xilinx Vivado
