module muxtb;
reg a,c,sel;
wire b;
mux uut(.sel(sel),.a(a),.b(b),.c(c));
initial begin
       sel=1;	
	#5 a=1;
	#10 c=1;
end
initial begin
	$dumpfile("mux.vcd");
	$dumpvars(1);
end
endmodule
