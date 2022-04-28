`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 10:58:52 PM
// Design Name: 
// Module Name: MUX2T1_32
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
    input [31:0] I0,
    input [31:0] I1,
    input S,
    output [31:0] O0
    );
    assign O0 = S ? I1:I0;
endmodule
