`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 08:27:18 PM
// Design Name: 
// Module Name: MUX4T1_32
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


module MUX4T1_32(
    input [31:0] I0,
    input [31:0] I1,
    input [31:0] I2,
    input [31:0] I3,
    input [1:0] S,
    output [31:0] O0
    );
    
    assign O0 = S[1] ? (S[0]?I3:I2) : (S[0]?I1:I0);
endmodule
