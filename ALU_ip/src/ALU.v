`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 05:41:34 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] ALUSel,
    input [31:0] a,
    input [31:0] b,
    output [31:0] c
    );

// we go through all process including 
// and choose which to output
wire [31:0] addc,subc,umulc,mulc;
wire [31:0] uhighbits,highbits;
wire [31:0] sllc,srlc,srac;
wire [31:0] andc,orc,xorc;
wire [31:0] umhigh,mhigh;
wire [31:0] cmpc; 

Adder32 m1(.cin(1'b0),.A(a),.B(b),.S(addc)); //0000
Adder32 m2(.cin(1'b1),.A(a),.B(b),.S(subc)); //0001
TopMul  m3(.ctrl(1'b0),.a(a),.b(b),.c(mulc),.highbits(mhigh)); //0_0010
TopMul  m4(.ctrl(1'b1),.a(a),.b(b),.c(umulc),.highbits(umhigh)); //0_0011
Sll32 m5(.a(a),.b(b[4:0]),.c(sllc)); // Shift left logic 0_0110
Srl32 m6(.a(a),.b(b[4:0]),.c(srlc)); // Shift right logic 0_1001
Sra32 m7(.a(a),.b(b[4:0]),.c(srac)); // Shift right arithmetic 0_1010
assign andc = a&b;
assign orc = a|c;
assign xorc = a^b;
Comparator m8(.a(a),.b(b),.c(cmpc));
// add sll slt 3 xor srl or and
// mul mulh 0 mulhu sub sra 0 bsel

MUX16T1_32_0 m9(.I0(addc),.I1(sllc),.I2(cmpc),.I3(32'h0000_0000),
    .I4(xorc),.I5(srlc),.I6(orc),.I7(andc),.I8(mulc),
    .I9(mhigh),.I10(32'h0000_0000),.I11(umhigh),.I12(subc),
    .I13(srac),.I14(32'h0000_0000),.I15(b),.S(ALUSel),
    .O0(c));

endmodule
