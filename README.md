# 4-Bit Counter — Verilog and Yosys

## Overview
A 4-bit synchronous counter with an asynchronous active-high reset.

## Design
- RTL: counter.v
- Testbench: tb_counter.v
- Simulator: Icarus Verilog
- Synthesis tool: Yosys

## Verification
The testbench confirms reset behavior, increments from 0 to 15,
and wraps back to 0.

## Synthesis
Yosys successfully processed the design.
The optimized RTL statistics report one $add cell and one $adff cell.
See synthesis_report.txt for the full report.

## Future work
- Add assertions and more test cases.
- Explore technology mapping.
- Extend the design into a UART or SPI controller.
