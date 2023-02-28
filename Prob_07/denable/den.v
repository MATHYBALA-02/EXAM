module den(
  input clock,enable,d,
  wire gclk,
  output q);
  assign gclk=clock&enable;
  always@(posedge clk)
    begin
      q=d;
    end
endmodule
