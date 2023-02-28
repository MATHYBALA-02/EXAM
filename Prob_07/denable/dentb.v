module den_tb;
  reg clock,enable,d;
  wire q;
  den_tb dut(clock,enable,d,q);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  initial begin
    always #5 clock=~clock;
  end
  initial begin
    d=0;
    clock=1;
    #5 d=1;
    #5 d=0;
    #5 d=1;
    #5 d=1;
    #5 d=0;
    #100 $finish;
  end
endmodule
