module MCPU_Alutb2();

parameter CMD_SIZE=2;
parameter WORD_SIZE=8;

reg [CMD_SIZE-1:0] opcode;
reg [WORD_SIZE-1:0] r1;
reg [WORD_SIZE-1:0] r2;
wire [WORD_SIZE-1:0] out;
wire OVERFLOW;

MCPU_Alu #(.CMD_SIZE(CMD_SIZE), .WORD_SIZE(WORD_SIZE)) aluinst (opcode, r1, r2, out, OVERFLOW);

// Testbench code goes here
always begin
#3 r1=4; #3 r1=4; #3 r1=0; #3 r1=0;
end

always begin
#3 r2=4; #3 r2=4; #3 r2=0; #3 r2=0;
end

initial begin
  $display("@%0dns default is selected, opcode %b",$time,opcode);
end

reg iscorrect;
reg [WORD_SIZE-1:0] result;
reg result_OVERFLOW;
always @(opcode, r1, r2) begin
	#2
	case(opcode)
		0 : begin
			result = r1&r2;
		end
		1 : begin
			result = r1|r2;		
		end
		2 : begin
			result = r1^r2;			
		end
		3 : begin
			{result_OVERFLOW, result} = r1+r2;		
		end
	endcase

	if(result == out)
		iscorrect = 1;
	else
		iscorrect = 0;
end
endmodule
