# Module 2: Sequential Logic & Clocks

## Core Concepts
Unlike combinational logic (where outputs react instantly to input changes), **sequential logic** introduces memory and state. Outputs only change in response to a specific event, typically the edge of a **clock** signal.

### Software Analogy
- **Combinational Logic:** Pure functions where outputs depend purely on current arguments (e.g., `def add(a, b): return a + b`).
- **Sequential Logic:** Functions with internal state or a state machine that updates on a regular tick/event loop (e.g., a class method modifying `self.state` during a main loop iteration).

### SystemVerilog Syntax for Sequential Logic
For sequential logic, we use the `always_ff` block triggered by a clock edge:
```systemverilog
always_ff @(posedge clk) begin
    // Sequential logic here
end
```

### Blocking vs. Non-Blocking Assignments
This is one of the most critical paradigm shifts from software:
- `=` (Blocking): Executes sequentially, just like software. Used in `always_comb`.
- `<=` (Non-blocking): Evaluates all right-hand sides immediately, but updates all left-hand sides simultaneously at the very end of the time step. Used in `always_ff` to model parallel flip-flops updating precisely on the clock edge.

### Resets
Resets initialize the state of your hardware.
- **Synchronous Reset:** Evaluated only on the clock edge.
- **Asynchronous Reset:** Evaluated immediately when the reset signal changes, regardless of the clock.

---
## Resources
- [SystemVerilog `always_ff` IEEE 1800 Standard](https://ieeexplore.ieee.org/document/8299595)
- [Nonblocking Assignments in Verilog (Cummings Paper)](http://www.sunburst-design.com/papers/CummingsSNUG2000Boston_NBA.pdf)

### Code Examples from this Lesson

**Synchronous Reset D Flip-Flop**
```systemverilog
always_ff @(posedge clk) begin
    if (rst) q <= 1'b0;
    else     q <= d;
end
```

**Asynchronous Reset D Flip-Flop**
```systemverilog
always_ff @(posedge clk, posedge rst) begin
    if (rst) q <= 1'b0;
    else     q <= d;
end
```
