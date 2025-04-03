`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2024 01:40:38 PM
// Design Name: 
// Module Name: Controller
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
module Controller(
    Opcode,
    ALUSrc, 
    Memtoreg,  
    RegWrite, 
    MemRead, 
    MemWrite,
    ALUOp
    );   
    input [6:0] Opcode;
    output reg ALUSrc;
    output reg Memtoreg;
    output reg RegWrite;
    output reg MemRead;
    output reg MemWrite;
    output reg [1:0] ALUOp;
    /*
    assign ALUSrc = 0;
    assign Memtoreg = 0;
    assig
    */
    
    always @(*) begin
        case(Opcode)
            7'b0110011: begin
            Memtoreg = 0;
            MemWrite = 0;
            MemRead = 0;
            ALUSrc = 0;
            RegWrite = 1;
            ALUOp = 2'b10;
            end
            7'b0010011: begin
            Memtoreg = 0;
            MemWrite = 0;
            MemRead = 0;
            ALUSrc = 1;
            RegWrite = 1;
            ALUOp = 2'b00;
            end
            7'b0000011: begin
            Memtoreg = 1;
            MemWrite = 0;
            MemRead = 1;
            ALUSrc = 1;
            RegWrite = 1;
            ALUOp = 2'b01;
            end
            7'b0100011: begin
            Memtoreg = 0;
            MemWrite = 1;
            MemRead = 0;
            ALUSrc = 1;
            RegWrite = 0;
            ALUOp = 2'b01;
            end
        endcase
    end
    
            
     
endmodule