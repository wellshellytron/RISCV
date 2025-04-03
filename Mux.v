`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 12:19:39 AM
// Design Name: 
// Module Name: mux21
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


module Mux(
    input S,
    input wire [31:0] D1,
    input wire [31:0] D2,
    output reg [31:0] Y 
    );
    
    //define behavior
always@(*) begin    
    if(S) begin
        Y <= D1;
    end 
    else begin
        Y <= D2;
    end
end
endmodule
