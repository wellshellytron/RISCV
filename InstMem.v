`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2024 04:48:01 PM
// Design Name: 
// Module Name: InstMem
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


module InstMem (
input [7:0] addr ,
output [31:0] instruction
);

reg [31:0] memory [63:0];

initial begin
memory[0] = 32'h00007033 ;//andx0 ,x0 ,x032'h00000000

memory[1] = 32'h00100093 ;//addi x1 ,x0 ,132'h00000001

memory[2] = 32'h00200113 ;//addix2 ,x0 ,232'h00000002

memory[3]=32'h00308193 ;//addix3 ,x1 ,332'h00000004

memory[4]=32'h00408213 ;//addix4 ,x1 ,432'h00000005

memory[5]=32'h00510293 ;//addix5 ,x2 ,532'h00000007

memory[6] = 32'h00610313 ;//addix6 ,x2 ,632'h00000008

memory[7] = 32'h00718393 ;//addix7 ,x3 ,732'h0000000B

memory[8] = 32'h00208433 ;//addx8 ,x1 ,x232'h00000003

memory[9] = 32'h404404b3 ;//subx9 ,x8 ,x432'hfffffffe

memory[10] = 32'h00317533 ;//andx10 ,x2 ,x332'h00000000

memory[11] = 32'h0041e5b3 ;//orx11 ,x3 ,x432'h00000005

memory[12] = 32'h0041a633 ;//ifx3islessthanx4 ,thenx12=1

//32'h00000001

memory[13]=32'h007346b3 ;//norx13 ,x6 ,x732'hfffffff4

memory[14]=32'h4d34f713 ;//andix14 ,x9 ,"4 D3 "32'h000004d2

memory[15]=32'h8d35e793 ;//orix15 ,x11 ,"8 D3 "32'hfffff8d7

memory[16]=32'h4d26a813 ;//ifx13islessthan32'h000004d2 ,thenx16=1

//32'h00000000

memory[17]=32'h4d244893 ;//norix17 ,x8 ,"4 D2 "32'hfffffb2c

memory[18] = 32'h02b02823; // sw r11, 48(r0) alu result = 32'h00000030

memory[19] = 32'h03002603; // lw r12, 48(r0) alu result = 32'h00000030 , r12 = 32'h00000005
end

assign instruction = memory[addr[7:2]];

endmodule
