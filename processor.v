`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2024 08:08:37 PM
// Design Name: 
// Module Name: processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
    module processor(
    input clk,
    input reset,
    output [31:0] Result
);

    wire regwrite;
    wire alusrc;
    wire memread;
    wire memwrite;
    wire memtoreg;
    wire [6:0] opcode;
    wire [6:0] f7;
    wire [2:0] f3;
    wire [3:0] op;
    wire [31:0] aluresult;
    wire [1:0] aluop;

    Datapath datapath_p(
        .clk(clk),
        .reset(reset),
        .alu_result(aluresult),
        .reg_write(regwrite),
        .mem2reg(memtoreg),
        .alu_src(alusrc),
        .mem_write(memwrite),
        .mem_read(memread),
        .opcode(opcode),
        .funct7(f7),
        .funct3(f3),
        .alu_cc(op)
    );

    assign Result = aluresult;

    Controller controller_p(
        .Opcode(opcode),
        .ALUSrc(alusrc),
        .Memtoreg(memtoreg),
        .RegWrite(regwrite),
        .MemRead(memread),
        .MemWrite(memwrite),
        .ALUOp(aluop)
    );

    ALUController alucon(
        .ALUOp(aluop),
        .Funct7(f7),
        .Funct3(f3),
        .Operation(op)
    );

endmodule