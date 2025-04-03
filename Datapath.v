module Datapath # (
parameter PC_W = 8 , // Program Counter
parameter INS_W = 32 , // Instruction Width
parameter RF_ADDRESS = 5 , // Register File Address
parameter DATA_W = 32 , // Data WriteData
parameter DM_ADDRESS = 9 , // Data Memory Address
parameter ALU_CC_W = 4 // ALU Control Code Width
)(
input clk , // CLK in Datapath figure
input reset , // Reset in Datapath figure
input reg_write , // RegWrite in Datapath figure
input mem2reg , // MemtoReg in Datapath figure
input alu_src , // ALUSrc in Datapath figure
input mem_write , // MemWrite in Datapath Figure
input mem_read , // MemRead in Datapath Figure
input [ ALU_CC_W -1:0] alu_cc , // ALUCC in Datapath Figure
output [6:0] opcode , // opcode in Datapath Figure
output [6:0] funct7 , // Funct7 in Datapath Figure
output [2:0] funct3 , // Funct3 in Datapath Figure
output [ DATA_W -1:0] alu_result // Datapath_Result in Datapath Figure
);
// Write your code here

    wire [PC_W-1:0] pc;
    wire [PC_W-1:0] sum;
    FlipFlop pc_ff (
        .clk(clk),
        .reset(reset),
        .d(sum),
        .q(pc)
    );

    assign sum = pc + 4;
    
    wire [DATA_W-1:0] instruction_dp;
   
    InstMem instmem_dp (
        .addr(pc),
        .instruction(instruction_dp)
    );
    
    assign opcode = instruction_dp [6:0];
    assign funct3 = instruction_dp [14:12];
    assign funct7 = instruction_dp [31:25];

    
    wire [DATA_W-1:0] reg1;
    wire [DATA_W-1:0] reg2;
    wire [DATA_W-1:0] mux2out;
    wire [RF_ADDRESS-1:0] wrt_addr_wire;
    wire [RF_ADDRESS-1:0] rd_addr_wire1;
    wire [RF_ADDRESS-1:0] rd_addr_wire2;
    
    assign wrt_addr_wire = instruction_dp[11:7];
    assign rd_addr_wire1 = instruction_dp[19:15];
    assign rd_addr_wire2 = instruction_dp[24:20];
    
    RegFile regfile_dp(
    .clk(clk),
    .reset(reset),
    .rg_wrt_en(reg_write),
    .rg_wrt_addr(wrt_addr_wire),
    .rg_rd_addr1(rd_addr_wire1),
    .rg_rd_addr2(rd_addr_wire2),
    .rg_wrt_data(mux2out),
    .rg_rd_data1(reg1),
    .rg_rd_data2(reg2)
    );
    wire [DATA_W-1:0] immout;
    wire [DATA_W-1:0] instcode;
    assign instcode = instruction_dp [DATA_W-1:0];
    ImmGen immgen_dp(
    .InstCode(instcode),
    .ImmOut(immout)
    );
    wire [DATA_W-1:0] mux1out;
    Mux mux1_dp(
    .S(alu_src),
    .D1(immout),
    .D2(reg2),
    .Y(mux1out)
    );
    
    wire [DATA_W-1:0] aluresult;
    ALU alu_dp(
    .A_in(reg1),
    .B_in(mux1out),
    .ALU_Sel(alu_cc),
    .ALU_Out(aluresult)
    );
    assign alu_result = aluresult;
    
    wire [DATA_W-1:0] datamemread;
    wire [DM_ADDRESS-1:0] dm_address;
    assign dm_address = alu_result [8:0];
    DataMem datamem_dp(
    .MemRead(mem_read),
    .MemWrite(mem_write),
    .addr(dm_address),
    .write_data(reg2),
    .read_data(datamemread)
    );
    
    Mux mux2_dp(
    .S(mem2reg),
    .D1(datamemread),
    .D2(aluresult),
    .Y(mux2out)
    );
    
    
endmodule // Datapath