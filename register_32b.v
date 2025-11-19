//register 32b

module register_32b
(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [31:0] d,
    output logic [31:0] q,
);

always_ff @(posedge clk) begin
    if (rst) begin
        q <= 32'b0;
    end 
    else if (en) begin
        q <= d;
    end
end




endmodule