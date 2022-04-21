`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2022 08:53:58 PM
// Design Name: 
// Module Name: MUX2T1
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


module MUX2T1_32(
    input [31:0] a,
    input [31:0] b,
    input ctrl,
    output [31:0] c
    );
 
assign c=ctrl?b:a; 
endmodule
