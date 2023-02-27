module testbench;
    // Declare signals for DFF inputs and outputs
    reg D, clk, reset;
    wire Q;
    
    // Instantiate DFF module
    dff_reset DFF_inst (.clk(clk), .reset(reset), .D(D), .Q(Q));
    
    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Stimulate the DFF
    initial begin
        reset = 1;
        #10 reset = 0;
        
        // Verify reset behavior
        #20 D = 1;
        #25 D = 0;
        #30 D = 1;
        #35 D = 0;
        #40 reset = 1;
        #45 reset = 0;
        #50 D = 1;
        #55 D = 0;
        #60 D = 1;
        #65 D = 0;
        
        // Verify normal operation
        #70 D = 1;
        #75 D = 0;
        #80 D = 1;
        #85 D = 0;
        
        #100 $finish; // End the simulation
    end
    
    // Print output values
    always @(posedge clk) begin
        $display("Time %t: D=%b, reset=%b, Q=%b", $time, D, reset, Q);
    end
endmodule
