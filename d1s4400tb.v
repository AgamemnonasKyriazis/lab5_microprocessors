module d1s4400tb();

reg tb_a;
reg tb_b;
reg tb_c;

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
	forever #5 {tb_a, tb_b, tb_c} = tb_dut_inputs + 1;
end
endmodule
