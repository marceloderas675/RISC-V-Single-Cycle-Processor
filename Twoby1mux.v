//Mux 2 inputs 1 output

module TWOBYONEMUX 
(
    input  logic in0,
    input  logic in1,
    input  logic sel,
    output logic out
);

if (sel) begin
    out = in1;
end 
else begin
    out = in0;
end

endmodule