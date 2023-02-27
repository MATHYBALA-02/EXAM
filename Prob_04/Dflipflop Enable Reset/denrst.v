module dff_enable (input wire clk, input wire reset, input wire enable, input wire D, output reg Q);
    always @(posedge clk) begin
        if (reset) begin
            Q <= 1'b0;  // reset
        end else if (enable) begin
            Q <= D;     // update output if enable is high
        end
    end
endmodule
