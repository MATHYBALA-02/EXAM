module tristate_tb;
reg enable;
reg d;
wire y;
tristate uut(.enable(enable),.d(d),.y(y));
  initial begin
        // Enable the buffer and set input to 1
        enable = 1;
        d = 1;
        #10;

        // Verify that output is 1
        if (y !== 1) $error("Output was not 1 when enable is high and data_in is 1");

        // Set input to 0
        d = 0;
        #10;
	 // Verify that output is 0
        if (y !== 0) $error("Output was not 0 when enable is high and data_in is 0");

        // Disable the buffer
        enable = 0;
        #10;

        // Verify that output is high impedance
        if (y !== 'z) $error("Output was not high impedance when enable is low");
    end
initial begin
	$dumpfile("tristate.vcd");
	$dumpvars(1);
end
endmodule
