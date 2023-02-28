module denmux_tb;
  reg d,enable,clock;
  wire q;
  denmux dut(d,enable,clock,q);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  always #5 clock=~clock;
  initial begin
    clock=0;
    enable=1;
    #5 enable=0;
    #5 enable=1;
  end
  initial
    begin
      d=0;
      #10 d=1;
      #10 d=0;
      #10 d=0;
      #10 d=1;
      #100 $finish;
    end
endmodule
