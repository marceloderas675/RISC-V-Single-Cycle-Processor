//IMMEDIATE GENERATOR

module IMMEDIATE_GEN 
(
    input  logic [31:0] inst,
    input  logic [2:0]  imm_type,
    output logic [31:0] imm
);

logic [31:0] prod1;
assign prod1[20:0] = {21{inst[31]}};
  
always_comb begin
    
imm = 'x;

if (!imm_type[2] && !imm_type[1] && !imm_type[0]) begin //I type
    imm [31:11] = prod1[20:0];
    imm [10:5]  = inst[30:25];
    imm [4:1]   = inst[24:21];
    imm [0]     = inst[20];
end
else if (!imm_type[2] && !imm_type[1] && imm_type[0]) begin //S Type
    imm [31:11] = prod1[20:0];
    imm [10:5]  = inst[30:25];
    imm [4:1]   = inst[11:8];
    imm [0]     = inst[7];
end
else if (!imm_type[2] && imm_type[1] && !imm_type[0]) begin //J Type
    imm [31:20] = prod1[11:0];
    imm [19:12] = inst[19:12];
    imm [11]    = inst[20];
    imm [10:5]  = inst[30:25];
    imm [4:1]   = inst[24:21];
    imm [0]     = 1'b0;
end
else if (!imm_type[2] && imm_type[1] && imm_type[0]) begin //B type
    imm [31:12] =  prod1[19:0];
    imm [11]    =  inst[7];
    imm [10:5]  =  inst[30:25];
    imm [4:1]   =  inst[11:8];
    imm [0]     =  1'b0;
end
else if (imm_type[2] && !imm_type[1] && !imm_type[0]) begin //U Type
    imm [30:20] =  prod1[10:0];
    imm [19:12] =  inst[19:12];
    imm [11:0]  =  12'b0;
    imm [31]    =  inst[31];
end

//x's imm, $isunknown(imm_type)

end

// prod1[31:21] is unused
// prod1[31:21] is undriven
// inst[6:0] is unused

endmodule