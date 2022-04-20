`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2022 10:55:18 AM
// Design Name: 
// Module Name: MUX2T1_1
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


module MUX2T1_1(
    I0,
    I1,
    s,
    out
    );
    input I0;
    input I1;
    input s;
    output out;
    assign out = s ? I1:I0;
endmodule
