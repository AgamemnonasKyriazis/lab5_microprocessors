module MCPU_Alutb();

parameter CMD_SIZE=2;
parameter WORD_SIZE=2;

reg [CMD_SIZE-1:0] opcode;
reg [WORD_SIZE-1:0] r1;
reg [WORD_SIZE-1:0] r2;
wire [WORD_SIZE-1:0] out;
wire OVERFLOW;

reg iscorrect;
reg [WORD_SIZE-1:0] res;
reg cf;

MCPU_Alu #(.CMD_SIZE(CMD_SIZE), .WORD_SIZE(WORD_SIZE)) aluinst (
.cmd(opcode), .in1(r1), .in2(r2), 
.out(out), .CF(OVERFLOW)
);

// Testbench code goes here
always #2 r1[0] = $random;
always #2 r2[0] = $random;
always #2 r1[1] = $random;
always #2 r2[1] = $random;

always #2 opcode[0] = $random;
always #2 opcode[1] = $random;

initial begin
  $display("@%0dns default is selected, opcode %b",$time,opcode);
end

always begin
case(opcode)
	0 : begin
	 res = #2 r1&r2;
	end
	1 : begin
	 res = #2 r1|r2;
	end	
	2 : begin
	 res = #2 r1^r2;
	end
	default : begin
	 {cf, res} = #2 r1+r2;
	end
endcase
end

always @(res, out)
  iscorrect = (res == out);

endmodule
