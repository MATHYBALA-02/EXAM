module tristate(
	input enable,d,
	output reg y);
always@(enable,d) begin
	if(enable)
	begin
		y<=d;
	end
	else 
	begin
		y<='z;
	end
end
endmodule
