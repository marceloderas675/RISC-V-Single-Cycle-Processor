//multiplier

module multiplier 
(
    input  logic [31:0] in0,
    input  logic [31:0] in1,
    output logic [31:0] prod
);

assign prod = in0 * in1;

endmodule