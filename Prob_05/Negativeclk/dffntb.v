module dffn_tb;
  reg clk_n, d;
  wire q;

  dffn_tb dut(clk_n, d, q);
  initial begin
	  $dumpfile("dffn.vcd");
  end
  initial begin
    clk_n = 0;
    d = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;
    $finish;
  end
  always #5 clk_n = ~clk_n;
  always @(negedge clk_n) begin
    $display("d=%d q=%d", d, q);
  end
endmodule
