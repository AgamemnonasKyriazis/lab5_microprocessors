module MCPU_Alutb();

parameter CMD_SIZE=2;
parameter WORD_SIZE=2;

reg [CMD_SIZE-1:0] opcode;
reg [WORD_SIZE-1:0] r1;
reg [WORD_SIZE-1:0] r2;
wire [WORD_SIZE-1:0] out;
wire OVERFLOW;

reg iscorrect;
reg [WORD_SIZE-1:0] out_tb;
reg OVERFLOW_tb;

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

always @(out, OVERFLOW)
case(opcode)
	2'b00 : iscorrect = ((r1&r2) == out);
	2'b01 : iscorrect = ((r1|r2) == out);		
	2'b10 : iscorrect = ((r1^r2) == out);			
	default : iscorrect = ({OVERFLOW, out} == r1+r2);		
endcase

parameter  [CMD_SIZE-1:0]  CMD_AND  = 0; //2'b00
parameter  [CMD_SIZE-1:0]  CMD_OR   = 1; //2'b01
parameter  [CMD_SIZE-1:0]  CMD_XOR   = 2; //2'b10
parameter  [CMD_SIZE-1:0]  CMD_ADD   = 3; //2'b11

always @(opcode, r1, r2)
case(opcode)
	CMD_AND : out_tb = r1&r2;
	CMD_OR : out_tb = r1|r2;		
	CMD_XOR : out_tb = r1^r2;			
	default : {OVERFLOW_tb, out_tb} = r1+r2;
endcase
endmodule
