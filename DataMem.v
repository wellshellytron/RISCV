`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2024 04:34:19 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem(MemRead, MemWrite, addr, write_data, read_data);
input MemRead;
input MemWrite;
input [8:2] addr;
input wire [31:0] write_data;
output reg [31:0] read_data;

reg [31:0] memory [127:0];

integer i; 
    initial begin
        read_data <= 32'b0;
        for (i = 0; i < 128; i = i + 1)
            memory[i] = i;
    end
 
always @(*) begin
        if (MemRead) begin
            read_data = memory[addr];
        end
end

always @(posedge MemWrite) begin
        if (MemWrite) begin
            memory[addr] = write_data;
        end
    end

endmodule
