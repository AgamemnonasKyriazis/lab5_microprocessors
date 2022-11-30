onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MCPUtb2/reset
add wave -noupdate /MCPUtb2/clk
add wave -noupdate /MCPUtb2/file
add wave -noupdate /MCPUtb2/i
add wave -noupdate -radix hexadecimal /MCPUtb2/memi
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/opcode
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/operand1
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/operand2
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/operand3
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/alu_cmd
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/alu_in1
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/alu_in2
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/alu_out
add wave -noupdate /MCPUtb2/cpuinst/CARRY
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/pc
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/regset_cmd
add wave -noupdate /MCPUtb2/cpuinst/regset_wb
add wave -noupdate -radix hexadecimal -childformat {{{/MCPUtb2/cpuinst/regdatatoload[15]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[14]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[13]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[12]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[11]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[10]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[9]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[8]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[7]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[6]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[5]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[4]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[3]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[2]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[1]} -radix hexadecimal} {{/MCPUtb2/cpuinst/regdatatoload[0]} -radix hexadecimal}} -subitemconfig {{/MCPUtb2/cpuinst/regdatatoload[15]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[14]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[13]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[12]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[11]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[10]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[9]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[8]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[7]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[6]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[5]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[4]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[3]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[2]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[1]} {-height 15 -radix hexadecimal} {/MCPUtb2/cpuinst/regdatatoload[0]} {-height 15 -radix hexadecimal}} /MCPUtb2/cpuinst/regdatatoload
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/RegOp1
add wave -noupdate /MCPUtb2/cpuinst/RAMWE
add wave -noupdate /MCPUtb2/cpuinst/RAMRE
add wave -noupdate -radix unsigned /MCPUtb2/cpuinst/RAMADDR
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/RAMDWRITE
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/RAMDREAD
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/IADDR
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/IREAD
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/wb_cmd
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/instruction
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/MemOrConstant
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/state
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/next_state
add wave -noupdate -radix hexadecimal /MCPUtb2/cpuinst/STATE_AS_STR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {181 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 238
configure wave -valuecolwidth 120
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {152 ps} {296 ps}
