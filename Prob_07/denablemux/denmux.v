module denmux(
  input d,enable,clock,
  output reg q,op);
  always@(*)
    begin
      case(enable)
        1:op=d;
        0:op=invalid;
      endcase
    end
  always@(posedge clock)
    begin
      q=op;
    end
endmodule
