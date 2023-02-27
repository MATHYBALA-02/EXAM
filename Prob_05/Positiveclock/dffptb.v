module testbench;
    // Declare signals for DFF inputs and outputs
    reg D, clk, reset;
    wire Q;
    
    // Instantiate DFF module
    dff_posedge DFF_inst (.clk(clk), .reset(reset), .D(D), .Q(Q));
    initial begin
      $dumpfile("dffp.vcd");
      $dumpvars(1);
    end
    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Stimulate the DFF
    initial begin
        reset = 1;
        #10 reset = 0;
        #15 reset = 1;
        #20 D = 1;
        #25 D = 0;
        #30 D = 1;
        #35 D = 0;
        #40 D = 1;
 		#45 D = 0;
        #50 $finish; // End the simulation
    end
    
    // Print output values
    always @(posedge clk) begin
        $display("Time %t: D=%b, Q=%b", $time, D, Q);
    end
endmodule
