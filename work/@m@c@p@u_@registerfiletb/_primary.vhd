library verilog;
use verilog.vl_types.all;
entity MCPU_Registerfiletb is
    generic(
        WORD_SIZE       : integer := 8;
        OPERAND_SIZE    : integer := 4;
        REGS_NUMBER_WIDTH: integer := 4
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WORD_SIZE : constant is 1;
    attribute mti_svvh_generic_type of OPERAND_SIZE : constant is 1;
    attribute mti_svvh_generic_type of REGS_NUMBER_WIDTH : constant is 1;
end MCPU_Registerfiletb;
