module and_gate(input wire a, b, output reg y);
  always @ (a, b) begin
    y = a & b;
  end
endmodule
