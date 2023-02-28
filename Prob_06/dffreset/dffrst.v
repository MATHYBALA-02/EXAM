module dffrst(
  input reset,clock,d,
  output reg q);
  always@(posedge clock)
    begin
      if(!reset)
        q<=0;
      else
        q<=d;
    end
endmodule
