//register file for reading and writing

module register_file_32b 
(
    input  logic clk,
    input  logic wen,
    input  logic [4:0] waddr,
    input  logic [31:0] wdata,
    input  logic [4:0] raddr0,
    output logic [31:0] rdata0,
    input  logic [4:0] raddr1,
    output logic [31:0] rdata1
);

    logic [31:0] regfile [32];

    always_ff @(posedge clk) begin

        if (wen) begin
            regfile[waddr] <= wdata;
        end
    end

    always_comb begin
        regfile[5'b00000] = 32'b0;
        rdata0 = regfile[raddr0];
        rdata1 = regfile[raddr1];
    end

endmodule