module MCPUtb2();


reg reset, clk;


MCPU cpuinst (clk, reset);


initial begin
  reset=1;
  #10  reset=0;
end

always begin
  #5 clk=0; 
  #5 clk=1; 
end


/********OUR ASSEMBLER*****/

integer file, i;
reg[cpuinst.WORD_SIZE-1:0] memi;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R0  = 0; //4'b0000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R1  = 1; //4'b0001
parameter  [cpuinst.OPERAND_SIZE-1:0]  R2  = 2; //4'b0010
parameter  [cpuinst.OPERAND_SIZE-1:0]  R3  = 3; //4'b0011
parameter  [cpuinst.OPERAND_SIZE-1:0]  R4  = 4; //4'b0100
parameter  [cpuinst.OPERAND_SIZE-1:0]  R5  = 5; //4'b0101
parameter  [cpuinst.OPERAND_SIZE-1:0]  R6  = 6; //4'b0110
parameter  [cpuinst.OPERAND_SIZE-1:0]  R7  = 7; //4'b0111
parameter  [cpuinst.OPERAND_SIZE-1:0]  R8  = 8; //4'b1000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R9  = 9; //4'b1001
parameter  [cpuinst.OPERAND_SIZE-1:0]  RA  = 10; //4'b1010
parameter  [cpuinst.OPERAND_SIZE-1:0]  RB  = 11; //4'b1011
parameter  [cpuinst.OPERAND_SIZE-1:0]  RC  = 12; //4'b1100
parameter  [cpuinst.OPERAND_SIZE-1:0]  RD  = 13; //4'b1101
parameter  [cpuinst.OPERAND_SIZE-1:0]  RE  = 14; //4'b1110
parameter  [cpuinst.OPERAND_SIZE-1:0]  RF  = 15; //4'b1111

initial
begin

    for(i=0;i<256;i=i+1)
    begin
      cpuinst.raminst.mem[i]=0;
    end
	 
	 for(i=0; i<16; i=i+1)
	 begin
		cpuinst.regfileinst.R[i]=0;
	 end  
                                                                                 //memory address: instruction
    i=0;  	cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R0, 8'b0100_0100};  //0: R0=0x44;
    i=i+1;	cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R1, 8'b0000_0000};  //1: R1=0x00;
	 
	 i=i+1;	cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R0, 8'b0110_0100};	//2: mem[100]=R0;
	 i=i+1;	cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R1, 8'b0110_0101};	//3: mem[101]=R1;
	 
	 i=i+1;	cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R2, 8'b0110_0100};	//4: R2=mem[100];
	 i=i+1;	cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R3, 8'b0110_0101};	//5: R3=mem[101];
	 
	 i=i+1;	cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R4, R3, R2};                 //6: R4=R3+R2;
	 
	 i=i+1;	cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R5, R3, R2};                 //7: R5=R3^R2;
	     
    
    file = $fopen("program.list","w");
    for(i=0;i<cpuinst.raminst.RAM_SIZE;i=i+1)
    begin
      memi=cpuinst.raminst.mem[i];
      
      $fwrite(file, "%b_%b_%b_%b\n", 
        memi[cpuinst.INSTRUCTION_SIZE-1:cpuinst.INSTRUCTION_SIZE-cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*3-1:2*cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*2-1:cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE-1:0]);
    end
    $fclose(file);
end

endmodule