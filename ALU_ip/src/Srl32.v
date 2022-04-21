`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 06:31:39 AM
// Design Name: 
// Module Name: Srl32
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

module Srl1(
    input [31:0] in,
    output [31:0] out
    );
assign out[31] = 1'b0;
assign out[30:0] = in[31:1];
endmodule

module Srl2(
    input [31:0] in,
    output [31:0] out
    );
assign out[31:30] = 2'b0;
assign out[29:0] = in[31:2];
endmodule

module Srl4(
    input [31:0] in,
    output [31:0] out
    );
assign out[31:28] = 4'b0;
assign out[27:0] = in[31:4];
endmodule

module Srl8(
    input [31:0] in,
    output [31:0] out
    );
assign out[31:24] = 8'b0;
assign out[23:0] = in[31:8];
endmodule

module Srl16(
    input [31:0] in,
    output [31:0] out
    );
assign out[31:16] = 16'b0;
assign out[15:0] = in[31:16];
endmodule


module Srl32(
    input [31:0] a,
    input [4:0] b,
    output [31:0] c
    );
//assign c = a>>b;
//assign c = a << b;
wire [31:0] w1,w2,w3,w4,w5,w6,w7,w8,w9;

Srl1 s1(.in(a),.out(w1));
MUX2T1_32 m1(.a(a),.b(w1),.ctrl(b[0]),.c(w2));
Srl2 s2(.in(w2),.out(w3));
MUX2T1_32 m2(.a(w2),.b(w3),.ctrl(b[1]),.c(w4));
Srl4 s3(.in(w4),.out(w5));
MUX2T1_32 m3(.a(w4),.b(w5),.ctrl(b[2]),.c(w6));
Srl8 s4(.in(w6),.out(w7));
MUX2T1_32 m4(.a(w6),.b(w7),.ctrl(b[3]),.c(w8));
Srl16 s5(.in(w8),.out(w9));
MUX2T1_32 m5(.a(w8),.b(w9),.ctrl(b[4]),.c(c));
endmodule
