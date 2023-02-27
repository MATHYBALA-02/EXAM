module dff_posedge (input wire clk, input wire reset, input wire D, output reg Q);
    always @(posedge clk) begin
        if (reset) begin
            Q <= 1'b0;  // reset
        end else begin
            Q <= D;     // update output
        end
    end
endmodule
