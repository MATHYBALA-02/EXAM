module dffrst_tb;
  reg d,clock,reset;
  wire q;
  dffrst dut(reset,clock,d,q)
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  always #10 clock=~clock;
  initial begin
    clock=0;
    reset=1;
    #10 reset=0;
  end
  initial begin
    d=0;
    #5 d=1;
    #5 d=1;
    #5 d=0;
    #5 d=1;
    #5 d=0;
    #5 d=1;
    #5 d=1;
    #100 $finish;
  end
endmodule
