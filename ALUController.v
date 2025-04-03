
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2024 07:40:59 PM
// Design Name: 
// Module Name: ALUController
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


module ALUController(
    ALUOp, 
    Funct7, 
    Funct3, 
    Operation
    );
    
    input [1:0] ALUOp;
    input [6:0] Funct7;
    input [2:0] Funct3;
    output reg [3:0] Operation = 0;
       
    always @(*) begin
        case(Funct3)
            3'b111: begin
            Operation = 4'b0000;
            end
            3'b110: begin
            Operation = 4'b0001;
            end
            3'b100: begin
            Operation = 4'b1100;
            end
            3'b010: begin
                if(ALUOp == 2'b01) begin
                    Operation = 4'b0010;
                end
                else begin
                    Operation = 4'b0111;
                end
            end
            3'b000: begin
                if(Funct7 == 7'b0100000) begin
                    Operation = 4'b0110;
                end
                else begin
                    Operation = 4'b0010;
                end
            end
        endcase
    end

endmodule
