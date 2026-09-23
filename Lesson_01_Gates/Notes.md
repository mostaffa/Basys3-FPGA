# Lesson 1 Notes: Combinational Logic & SystemVerilog Basics

## 1. The Paradigm Shift
- **Software vs. Hardware:** Software executes sequentially line-by-line. In hardware description languages (SystemVerilog), you are not writing software; you are describing physical circuits that operate continuously and in parallel.

## 2. Continuous Assignments (`assign`)
- **Purpose:** Used for basic combinational logic (logic without memory or clocks). The output depends entirely and immediately on the current inputs.
- **Syntax:**
  ```systemverilog
  assign output_signal = input_1 & input_2; // Logical AND
  ```
- **Operators:** Standard bitwise operators include `&` (AND), `|` (OR), `^` (XOR).
- **Physical Wires:** An output signal physically represents a wire. This means you can tap into it and use it as an input for the next gate.
  - Example: `assign out_xor = out_and ^ c;`

## 3. Procedural Combinational Logic (`always_comb`)
- **Purpose:** Used for more complex routing logic that resembles software syntax (like `if-else` or `case` statements) but synthesizes physically into combinational logic gates (like multiplexers).
- **Example (2-to-1 Multiplexer):**
  ```systemverilog
  always_comb begin
      if (sel) begin
          y = d1;
      end else begin
          y = d0;
      end
  end
  ```
- **Rule:** Never use `assign` inside an `always_comb` block.

## 4. Tooling & Verification
- **Editor:** VS Code is the industry standard. The "Verilog-HDL/SystemVerilog" extension (by `mshr-h`) is recommended for syntax highlighting.
- **Syntax Checking (Verilator):** 
  - Command: `verilator -Wall --lint-only <filename.sv>`
  - Function: Strictly verifies syntax and hardware rules without compiling an executable simulation.
- **Simulation & Waveforms (Icarus Verilog & GTKWave):**
  - Requires a **Testbench** (covered in Module 4) to drive inputs over time.
  - Compile: `iverilog -g2012 -o sim.vvp module.sv testbench.sv`
  - Simulate: `vvp sim.vvp` (Generates a `.vcd` file)
  - View Waveform: `gtkwave dump.vcd`

## 5. Resources
- **Concepts to remember for quizzes:** The difference between sequential software execution and concurrent hardware evaluation.
- **Syntax to remember for quizzes:** `assign` vs `always_comb` usage.
- **Commands to remember for exams:** 
  - Verilator linting: `verilator -Wall --lint-only [file]`
  - Icarus Verilog flow: `iverilog` -> `vvp` -> `gtkwave`
- **Hardware mappings:** `assign` = gates; `if-else` inside `always_comb` = multiplexer.
