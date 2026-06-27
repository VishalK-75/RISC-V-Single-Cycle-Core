# Single-Cycle 32-bit RISC-V Processor Core

A digital hardware design and implementation of a non-pipelined, single-cycle processor core based on the open-source **RISC-V (RV32I) Instruction Set Architecture**, modeled entirely in **Verilog HDL**.

## 🛠️ Microarchitectural Overview
* **Single-Cycle Execution path:** Every instruction—from fetch to writeback—completes its entire structural lifecycle within exactly one clock cycle.
* **Deterministic critical path:** Optimized for foundational clarity; the clock period is constrained strictly by the propagation delay of the longest data routing path (typically a load instruction interfacing with Data Memory).
* **Simplified Control Structures:** Bypasses complex hazards, data forwarding paths, stall interlocks, and branch flushing networks completely, since instructions execute one at a time.
* **32-bit RV32I Datapath:** Includes an instruction memory interface, an immediate sign-extend block, a 32-bit Arithmetic Logic Unit (ALU), a synchronous 32x32-bit Register File, and a synchronous Data Memory block.

## 📁 Workspace Layout
* `/src` : Synthesizable Verilog design modules (`RISCV_SingleCycle_Top.v`, `Control_Unit.v`, `ALU.v`, etc.)
* `/sim` : Functional validation testbenches and hex source verification program arrays.

## 🚀 How to Run
Compile your Verilog source modules using your hardware description simulator of choice and review the execution tracking clock-by-clock by loading the output trace file directly into **GTKWave**.
