`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 05:58:43 AM
// Design Name: 
// Module Name: TopMul
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


module TopMul(
    input ctrl,
    input [31:0] a,
    input [31:0] b,
    output [31:0] c,
    output [31:0] highbits
    );

wire [63:0] result,out;
wire [31:0] tmpA;
wire [31:0] tmpB;
assign tmpA = (ctrl==0&&a[31]==1)? 32'h8000_0000-{1'b0,a[30:0]}:a;
assign tmpB = (ctrl==0&&b[31]==1)? 32'h8000_0000-{1'b0,b[30:0]}:b;
Mul32 m1(.a(tmpA),.b(tmpB),.c(result));
assign out = (ctrl==0&&a[31]^b[31]==1)?{1'b1,~result[62:0]+1'b1}:result;
assign c[31:0] = out[31:0];
assign highbits[31:0] = out[63:32];
endmodule
