module dffmux_tb;
  reg q,clock,reset;
  wire q;
  dffmux dut(reset,clock,d,q);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  always #5 clock=~clock;
  initial begin
    clock=1;
    reset=1;
    #10 
    reset=0;
  end
  initial begin
    d=0;
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #100 $finish;
  end
endmodule
