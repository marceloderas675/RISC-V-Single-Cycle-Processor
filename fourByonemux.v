//mux with 4 inputs and one output

module FOURBYONEMUX 
(
    input  logic in0,
    input  logic in1,
    input  logic in2,
    input  logic in3,
    input  logic [1:0] sel,
    output logic out
);

always @(*) begin
    if (sel == 2'b00) begin
        out = in0;
    end
    else if (sel == 2'b01) begin
        out = in1;
    end
    else if (sel == 2'b10) begin
        out = in2;
    end
    else if (sel == 2'b11) begin
        out = in3
    end
end

endmodule