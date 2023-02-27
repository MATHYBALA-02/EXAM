module testbench;
    // Declare signals for DFF inputs and outputs
    reg D, clk, reset, enable;
    wire Q;
    
    // Instantiate DFF module
    dff_enable DFF_inst (.clk(clk), .reset(reset), .enable(enable), .D(D), .Q(Q));
   
    initial begin
	   $dumpfile("denrst.vcd");
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
        
        // Enable is low, so output should remain unchanged
        #20 D = 1;
        #25 D = 0;
        #30 D = 1;
        #35 D = 0;
        
        // Enable is high, so output should update
        #40 enable = 1;
        #45 D = 1;
        #50 D = 0;
        #55 D = 1;
        #60 D = 0;
        
        // Disable again, so output should remain unchanged
        #70 enable = 0;
        #75 D = 1;
        #80 D = 0;
        #85 D = 1;
        #90 D = 0;
        
        #100 $finish; // End the simulation
    end
    
    // Print output values
    always @(posedge clk) begin
        $display("Time %t: D=%b, enable=%b, Q=%b", $time, D, enable, Q);
    end
endmodule
