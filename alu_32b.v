//alu to perform arithmetic and binary operations

`include "Single Cycle Processor/adder_32b"
`include "Single Cycle Processor/TWOBYONEMUX"
`include "Single Cycle Processor/comparator_32b"

module alu_32b 

(
    input logic  [31:0] in0, 
    input logic  [31:0] in1,
    input logic         alu_sel;
    output logic [31:0] out

);

wire [31:0] out1;
wire [31:0] out2;

//equality bits are off

comparator_32b equal 
(
    .in0 (in0),
    .in1 (in1),
    .out (out1)
);

adder_32b sum 
(
    .in0 (in0),
    .in1 (in1),
    .sum (out2)
);

TWOBYONEMUX mux00 
(
    .in0 (out1),
    .in1 (out2)
    .sel (alu_sel),
    .out (out)
);

endmodule