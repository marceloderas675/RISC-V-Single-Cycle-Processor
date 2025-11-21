//adder_32b

module adder_32b

(
    input  logic [31:0] in0,
    input  logic [31:0] in1,
    output logic [31:0] sum
);

sum = in0 + in1;

endmodule