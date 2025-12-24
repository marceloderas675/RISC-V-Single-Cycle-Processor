//IMMEDIATE GENERATOR

module IMMEDIATE_GEN 
    (
        input  logic [31:0] inst,
        input  logic [2:0]  imm_type,
        output logic [31:0] imm
    );
  
    always_comb begin
        case (imm_type)
            3'b000: // I-type
                imm = {{20{inst[31]}}, inst[31:20]};

            3'b001: // S-type
                imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};

            3'b010: // B-type
                imm = {{19{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};

            3'b011: // J-type
                imm = {{11{inst[31]}}, inst[19:12], inst[20], inst[30:25], inst[24:21], 1'b0};

            3'b100: //U-type
                imm = {inst[31:12], 12'b0};

            default:
                imm = 32'b0;
        endcase

    end 

endmodule