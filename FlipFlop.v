`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2024 12:16:46 AM
// Design Name: 
// Module Name: FlipFlop
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


module FlipFlop(clk , reset , d , q);
    
input clk;
input reset;
input [7:0] d;
output reg [7:0] q;
    always @(posedge clk)
    begin
        if (reset)
            q <= 0;
        else
            q <= d;
    end  
endmodule
