module MCPU_RAMControllertb2();

parameter WORD_SIZE=16;
parameter ADDR_WIDTH=2;
parameter RAM_SIZE=1<<ADDR_WIDTH;

reg we, re;
reg [WORD_SIZE-1:0] datawr;
reg [ADDR_WIDTH-1:0] addr;
reg [ADDR_WIDTH-1:0] instraddr;

reg [WORD_SIZE-1:0] datard;
reg [WORD_SIZE-1:0] instrrd;

wire [WORD_SIZE-1:0] datard_tb;
wire [WORD_SIZE-1:0] instrrd_tb;

MCPU_RAMController #(.WORD_SIZE(WORD_SIZE), .ADDR_WIDTH(ADDR_WIDTH)) tb_ram (
	.we(we), .re(re),
	.datawr(datawr), .addr(addr), .instraddr(instraddr),
	.datard(datard_tb), .instrrd(instrrd_tb)
);

reg [WORD_SIZE-1:0] memCopy[RAM_SIZE-1:0];

always #5 datawr = 16'b0100_0100_0000_0000;

integer i;
initial begin
	for(i = 0; i < RAM_SIZE; i = i + 1) begin
	#5
		we = 1;
		re = 0;
		addr = i;
	end
	for(i = 0; i < RAM_SIZE; i = i + 1) begin
	#5
		we = 0;
		re = 1;
		addr = i;
	end
end

always @ (addr or we or re or datawr)
begin
  if(we)begin
    memCopy[addr]=datawr;
  end
  if(re) begin
    datard=memCopy[addr];
  end
end
endmodule