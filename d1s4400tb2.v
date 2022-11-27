module d1s4400tb2();

reg tb_a;
reg tb_b;
reg tb_c;
// d_correct
reg d_correct;

wire [2:0] tb_dut_inputs;

wire tb_d;

d1s4400 dut (
	.a(tb_a),
	.b(tb_b),
	.c(tb_c),
	.d(tb_d)
);

assign tb_dut_inputs = {tb_a, tb_b, tb_c};

initial begin
	{tb_a, tb_b, tb_c} = 3'b000;
	forever begin
		#5 {tb_a, tb_b, tb_c} = tb_dut_inputs + 1;
	end
end

always @ (tb_dut_inputs) begin
	#2 
	if( (tb_dut_inputs == 3'b110 && tb_d == 1'b1) || (tb_dut_inputs != 3'b110 && tb_d == 1'b0))
		d_correct = 1'b1;
	else
		d_correct = 1'b0;
end
endmodule
