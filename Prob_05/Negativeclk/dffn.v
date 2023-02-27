module dffn(clk_n, d, q);
  input clk_n, d;
  output q;
  reg q;

  always @(negedge clk_n) begin
    q <= d;
  end
endmodule
