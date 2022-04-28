`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2022 10:25:56 AM
// Design Name: 
// Module Name: tb_mux32t1_32
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


module tb_mux32t1_32();

reg [31:0] I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17;
reg [31:0] I18,I19,I20,I21,I22,I23,I24,I25,I26,I27,I28,I29,I30,I31;
reg [4:0] s;
wire [31:0] out;

MUX32T1_32 m1(I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17,I18,
    I19,I20,I21,I22,I23,I24,I25,I26,I27,I28,I29,I30,I31,s,out);

initial begin
#50;
I0 = 0;I1 = 1;I2 = 2;I3 = 3; I4 = 4;I5 = 5;I6 = 6;I7 = 7;
I8 = 8;I9 = 9;I10 = 10;I11 = 11; I12 = 12;I13 = 13;I14 = 14;I15 = 15;
I16 = 16;I17 = 17;I18 = 18;I19 = 19; I20 = 20;I21 = 21;I22 = 22;I23 = 23;
I24 = 24;I25 = 25;I26 = 26;I27 = 27; I28 = 28;I29 =29;I30 = 30;I31 = 31;
s =5'b00000;
#50;
s=5'b00001;
#50;
s=5'b11111;
#50;
s=5'b10111;
#50;
s=5'b01011;
end

endmodule
