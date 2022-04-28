`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 06:31:39 AM
// Design Name: 
// Module Name: Sra32
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

module Sra1(
    input [31:0] in,
    output [31:0] out
    );
assign out[31] = in[31];
assign out[30:0] = in[31:1];
endmodule

module Sra2(
    input [31:0] in,
    output [31:0] out
    );
assign out[31:30] = {2{in[31]}};
assign out[29:0] = in[31:2];
endmodule

module Sra4(
    input [31:0] in,
    output [31:0] out
    );
assign out[31:28] = {4{in[31]}};
assign out[27:0] = in[31:4];
endmodule

module Sra8(
    input [31:0] in,
    output [31:0] out
    );
assign out[31:24] = {8{in[31]}};
assign out[23:0] = in[31:8];
endmodule

module Sra16(
    input [31:0] in,
    output [31:0] out
    );
assign out[31:16] = {16{in[31]}};
assign out[15:0] = in[31:16];
endmodule

module Sra32(
    input [31:0] a,
    input [4:0] b,
    output [31:0] c
    );
wire [31:0] w1,w2,w3,w4,w5,w6,w7,w8,w9;
Sra1 s1(.in(a),.out(w1));
MUX2T1_32 m1(.a(a),.b(w1),.ctrl(b[0]),.c(w2));
Sra2 s2(.in(w2),.out(w3));
MUX2T1_32 m2(.a(w2),.b(w3),.ctrl(b[1]),.c(w4));
Sra4 s3(.in(w4),.out(w5));
MUX2T1_32 m3(.a(w4),.b(w5),.ctrl(b[2]),.c(w6));
Sra8 s4(.in(w6),.out(w7));
MUX2T1_32 m4(.a(w6),.b(w7),.ctrl(b[3]),.c(w8));
Sra16 s5(.in(w8),.out(w9));
MUX2T1_32 m5(.a(w8),.b(w9),.ctrl(b[4]),.c(c));

endmodule
