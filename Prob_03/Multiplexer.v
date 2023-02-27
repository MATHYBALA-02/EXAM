module mux(input a,c,sel,
	output reg b);
always@(*) begin
	if(sel==0)
	begin
		b=a;
	end
	else 
	begin
		b=c;
	end
end
endmodule
