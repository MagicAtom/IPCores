`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 06:31:39 AM
// Design Name: 
// Module Name: Sll32
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


module Sll1(
    input [31:0] in,
    output [31:0] out
    );
assign out[0] = 1'b0;
assign out[31:1] = in[30:0];
endmodule

module Sll2(
    input [31:0] in,
    output [31:0] out
    );
assign out[1:0] = 2'b0;
assign out[31:2] = in[29:0];
endmodule

module Sll4(
    input [31:0] in,
    output [31:0] out
    );
assign out[3:0] = 4'b0;
assign out[31:4] = in[27:0];
endmodule

module Sll8(
    input [31:0] in,
    output [31:0] out
    );
assign out[7:0] = 8'b0;
assign out[31:8] = in[23:0];
endmodule

module Sll16(
    input [31:0] in,
    output [31:0] out
    );
assign out[15:0] = 16'b0;
assign out[31:16] = in[15:0];
endmodule

module Sll32(
    input [31:0] a,
    input [4:0] b,
    output [31:0] c
    );
//assign c = a << b;
wire [31:0] w1,w2,w3,w4,w5,w6,w7,w8,w9;

Sll1 s1(.in(a),.out(w1));
MUX2T1_32_0 m1(.I0(a),.I1(w1),.S(b[0]),.O0(w2));
Sll2 s2(.in(w2),.out(w3));
MUX2T1_32_0 m2(.I0(w2),.I1(w3),.S(b[1]),.O0(w4));
Sll4 s3(.in(w4),.out(w5));
MUX2T1_32_0 m3(.I0(w4),.I1(w5),.S(b[2]),.O0(w6));
Sll8 s4(.in(w6),.out(w7));
MUX2T1_32_0 m4(.I0(w6),.I1(w7),.S(b[3]),.O0(w8));
Sll16 s5(.in(w8),.out(w9));
MUX2T1_32_0 m5(.I0(w8),.I1(w9),.S(b[4]),.O0(c));

endmodule
