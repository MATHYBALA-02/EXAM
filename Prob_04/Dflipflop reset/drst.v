module dff_reset (input clk, input reset,input D, output reg Q);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q = 0;  // reset
        end else begin
            Q = D;     // update output if enable is high
        end
    end
endmodule
