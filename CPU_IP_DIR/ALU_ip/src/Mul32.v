`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2022 11:38:10 PM
// Design Name: 
// Module Name: Mul32
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

module HAdder(a,b,s,c);
input a,b;
output s,c;
assign s = a^b;
assign c = a&b;
endmodule

module Mul2(a,b,c);
input [1:0] a,b;
output [3:0] c;
wire [3:0] temp;
assign c[0] = a[0] & b[0];
assign temp[0] = a[1] & b[0];
assign temp[1] = a[0] & b[1];
assign temp[2] = a[1] & b[1];
HAdder ha1(.a(temp[0]),.b(temp[1]),.s(c[1]),.c(temp[3]));
HAdder ha2(.a(temp[2]),.b(temp[3]),.s(c[2]),.c(c[3]));
endmodule

module Mul4(a,b,c);
input [3:0] a,b;
output [7:0] c;
wire [3:0] q0,q1,q2,q3,q4,temp1;
wire [5:0] q5,q6,temp4,temp2,temp3;
Mul2 mul2_0(.a(a[1:0]),.b(b[1:0]),.c(q0[3:0]));
Mul2 mul2_1(.a(a[3:2]),.b(b[1:0]),.c(q1[3:0]));
Mul2 mul2_2(.a(a[1:0]),.b(b[3:2]),.c(q2[3:0]));
Mul2 mul2_3(.a(a[3:2]),.b(b[3:2]),.c(q3[3:0]));
assign temp1 ={2'b0,q0[3:2]};
assign q4 = q1[3:0]+temp1;
assign temp2 ={2'b0,q2[3:0]};
assign temp3 ={q3[3:0],2'b0};
assign q5 = temp2+temp3;
assign temp4={2'b0,q4[3:0]};
assign q6 = temp4+q5;  
assign c[1:0]=q0[1:0];
assign c[7:2]=q6[5:0];
endmodule

module Mul8(a,b,c);
input [7:0]a,b;
output [15:0]c;
wire [15:0]q0,q1,q2,q3;
wire [7:0]q4,temp1;
wire [11:0] q5,q6,temp2,temp3,temp4;
Mul4 m1(a[3:0],b[3:0],q0[15:0]);
Mul4 m2(a[7:4],b[3:0],q1[15:0]);
Mul4 m3(a[3:0],b[7:4],q2[15:0]);
Mul4 m4(a[7:4],b[7:4],q3[15:0]);
assign temp1 ={4'b0,q0[7:4]};
assign q4 = q1[7:0]+temp1;
assign temp2 ={4'b0,q2[7:0]};
assign temp3 ={q3[7:0],4'b0};
assign q5 = temp2+temp3;
assign temp4={4'b0,q4[7:0]};   
assign q6 = temp4+q5;   
assign c[3:0]=q0[3:0];
assign c[15:4]=q6[11:0];
endmodule

module Mul16(a,b,c);
input [15:0]a,b;
output [31:0]c;
wire [15:0]q0,q1,q2,q3,q4,temp1;
wire [31:0]c;
wire [23:0]q5,q6,temp2,temp3,temp4;
Mul8 m1(a[7:0],b[7:0],q0[15:0]);
Mul8 m2(a[15:8],b[7:0],q1[15:0]);
Mul8 m3(a[7:0],b[15:8],q2[15:0]);
Mul8 m4(a[15:8],b[15:8],q3[15:0]);
assign temp1 ={8'b0,q0[15:8]};
assign q4 = q1[15:0]+temp1;
assign temp2 ={8'b0,q2[15:0]};
assign temp3 ={q3[15:0],8'b0};
assign q5 = temp2+temp3;
assign temp4={8'b0,q4[15:0]};
assign q6 = temp4 + q5;
assign c[7:0]=q0[7:0];
assign c[31:8]=q6[23:0];
endmodule

module Mul32(a,b,c);
input [31:0]a,b;
output [63:0]c;
wire [31:0]q0,q1,q2,q3,q4,temp1;
wire [47:0]q5,q6,temp2,temp3,temp4;
Mul16 m1(.a(a[15:0]),.b(b[15:0]),.c(q0[31:0]));
Mul16 m2(.a(a[31:16]),.b(b[15:0]),.c(q1[31:0]));
Mul16 m3(.a(a[15:0]),.b(b[31:16]),.c(q2[31:0]));
Mul16 m4(.a(a[31:16]),.b(b[31:16]),.c(q3[31:0]));
assign temp1 ={16'b0,q0[31:16]};
assign q4 = q1[31:0]+temp1;
assign temp2 ={16'b0,q2[31:0]};
assign temp3 ={q3[31:0],16'b0};
assign q5 = temp2+temp3;
assign temp4={16'b0,q4[31:0]};
assign q6 = temp4 + q5;
assign c[15:0]=q0[15:0];
assign c[63:16]=q6[47:0];
endmodule