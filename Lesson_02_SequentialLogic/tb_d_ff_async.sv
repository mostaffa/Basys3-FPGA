module tb_d_ff_async;

    // Testbench signals
    logic clk;
    logic rst;
    logic d;
    logic q;

    // Instantiate the Unit Under Test (UUT)
    d_ff_async uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Clock generator: toggle every 5 time units (10 unit period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus and VCD dumping
    initial begin
        // Setup waveform dumping for GTKWave
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_d_ff_async);

        // 1. Initial State: apply reset
        rst = 1; d = 0;
        #12; // Wait for a bit
        
        // 2. Release reset
        rst = 0; 
        
        // 3. Apply data at various times
        #10; d = 1; 
        #10; d = 0;
        #12; d = 1;
        
        // 4. Test ASYNCHRONOUS reset mid-cycle
        // We wait an odd number of time units so it hits when the clock is steady
        #13; rst = 1; 
        #8;  rst = 0;
        
        #20;
        $finish; // End the simulation
    end

endmodule
