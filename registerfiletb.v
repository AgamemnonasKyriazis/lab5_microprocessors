module MCPU_Registerfiletb();
  
  parameter WORD_SIZE = 8;
  parameter OPERAND_SIZE = 4;
  parameter REGS_NUMBER_WIDTH = 4;
  
  reg [OPERAND_SIZE-1:0] op1, op2, op3;
  reg [WORD_SIZE-1:0] datatoload;
  reg [1:0] regsetcmd;
  reg regsetwb;
  
  wire [WORD_SIZE-1:0] RegOp1, alu1, alu2;
  
  MCPU_Registerfile #(.WORD_SIZE(WORD_SIZE), .OPERAND_SIZE(OPERAND_SIZE), .REGS_NUMBER_WIDTH(REGS_NUMBER_WIDTH)) regfileinst (
    .op1(op1),
    .op2(op2),
    .op3(op3),
    .datatoload(datatoload),
    .regsetcmd(regsetcmd),
    .regsetwb(regsetwb),
    
    .RegOp1(RegOp1),
    .alu1(alu1),
    .alu2(alu2)
  );
  
  initial begin
    regsetwb = 1'b0;
    
    #2
    op1 = 4'hC;
    datatoload = 8'h0;
    regsetcmd = 2'b10;
    regsetwb = ~regsetwb;
    #1
    regsetwb = ~regsetwb;
    
    #2 
    op1 = 4'hD;
    datatoload = 8'h1;
    regsetcmd = 2'b10;
    regsetwb = ~regsetwb;
    #1
    regsetwb = ~regsetwb;
    
    #2 
    op1 = 4'hE;
    datatoload = 8'h2;
    regsetcmd = 2'b10;
    regsetwb = ~regsetwb;
    #1
    regsetwb = ~regsetwb;
    
    #2
    op1 = 4'hC;
    op2 = 4'hD;
    op3 = 4'hE;
    regsetcmd = 2'b11;
    
    #2
    op1 = 4'hF;
    op2 = 4'hE;
    regsetcmd = 2'b01;
    regsetwb = ~regsetwb;
    #1
    regsetwb = ~regsetwb;
    
    #2
    op1 = 4'hF;
    op2 = 4'hD;
    op3 = 4'hE;
    regsetcmd = 2'b11;
    
  end
endmodule