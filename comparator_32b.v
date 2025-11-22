//comparator

module comparator_32b 
(
    input logic [31:0] in0,
    input logic [31:0] in1,
    output logic [31:0] out,
);

if (in0 == in1) begin
    out = 1'b1
end
else begin
    out = 1'b0
end

endmodule