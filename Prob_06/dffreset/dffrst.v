module dffrst(
  input reset,clock,d,
  output q);
  always@(posedge clock)
    begin
      if(!reset)
        q<=0;
      else
        q<=d;
    end
endmodule
