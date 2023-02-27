module andgatetb();
reg a,b;
wire y;
and_gate dut(.a(a),.b(b),.y(y));
initial begin
	a=0;b=0;
	#5 a=1;b=0;
	#5 a=0;b=1;
	#5 a=1;b=1;
	#5 $finish;
end
initial begin
	$dumpfile("andgate.vcd");
	$dumpvars(1);
end

always@(y)
begin
	$display("a=%b, b=%b, y=%b",a,b,y);
end
endmodule
