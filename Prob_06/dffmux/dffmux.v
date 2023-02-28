module dffmux(
  input d,clock,reset,
  output reg q);
  always@(*)
    begin
      case(reset)
        1:op=d;
        0:op=1'b0;
      endcase
    end
  always@(posedge clock)
    begin
      q=op;
    end
endmodule
