///adding some comment

`include "Single Cycle Processor/immgen.v"
`include "Single Cycle Processor/Twoby1mux.v"
`include "Single Cycle Processor/register_file_32b.v"
`include "Single Cycle Processor/alu_32b.v"
`include "Single Cycle Processor/adder_32b.v"
`include "Single Cycle Processor/register_32b.v"
`include "Single Cycle Processor/multiplier_32b.v"

module datapath 

(
    input logic clk,
    input logic rst,
    output logic [4:0] m_addr,
    input logic [31:0] m_data,
    input logic pc_en

);

//pc

wire [31:0] incrementFour;
wire [31:0] incrementedByFour;

register_32b pc_register 
(
    .clk (clk),
    .rst (rst),
    .en (pc_en)
    .d (incrementedByFour),
    .q (incrementFour)
);

assign m_addr = incrementedByFour;

adder_32b plusFour 
(
    .in0 (incrementFour),
    .in1 (32'b100),
    .sum (incrementedByFour)
);

//choose instruction

register_file_32b regfile 
(
    .clk (),
    .wen (),
    
);

TWOBYONEMUX readOrIMM 
(
    .in0 (),
    .in1 (),
    .sel (),
    .out ()
);

endmodule