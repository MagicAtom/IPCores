`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 08:16:51 PM
// Design Name: 
// Module Name: MUX4T1_1
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


module MUX4T1_1(
    input I0,
    input I1,
    input I2,
    input I3,
    input [1:0] S,
    output O0
    );
    assign O0 = S[1] ? (S[0] ? I3:I2) : (S[0] ? I1 : I0);
endmodule
