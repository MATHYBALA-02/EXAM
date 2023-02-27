module FIFO_Tb;
  wire [31:0] DATAOUT;
  wire full, empty;
  reg clock, reset, wn, rn;
  reg [31:0] DATAIN;  
  FIFO fifo(DATAOUT, full, empty, clock, reset, wn, rn, DATAIN);
  initial begin 
    $dumpfile("syncfifo.vcd"); 
    $dumpvars();
  end
  initial begin
    clock = 0; DATAIN = 32'd0;
    reset = 1; clock = 1; #5 ; clock = 0; #5;
    reset = 0;
    $display("Start testing");
    wn = 1; rn = 0;
    DATAIN = 32'd100;
    clock = 1; #5 ; clock = 0; #5;
    DATAIN = 32'd150;
    clock = 1; #5 ; clock = 0; #5;
    wn = 0; rn = 1;
    clock = 1; #5 ; clock = 0; #5;
    if ( DATAOUT === 32'd100 )
      $display("PASS %p ", DATAOUT);
    else
      $display("FAIL %p ", DATAOUT);
    clock = 1; #5 ; clock = 0; #5;
    if ( DATAOUT === 32'd150 )
      $display("PASS %p ", DATAOUT);
    else
      $display("FAIL %p ", DATAOUT);
    clock = 1; #5 ; clock = 0; #5;
    if ( empty === 1 )
      $display("PASS %p ", empty);
    else
      $display("FAIL %p ", empty);
  end
endmodule
