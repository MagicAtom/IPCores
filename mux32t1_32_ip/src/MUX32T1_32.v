`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2022 10:20:35 AM
// Design Name: 
// Module Name: MUX32T1_32
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


module MUX32T1_32(
    I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,
    I16,I17,I18,I19,I20,I21,I22,I23,I24,I25,I26,I27,I28,I29,I30,I31,
    S,
    out
    );
input [31:0] I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17;
input [31:0] I18,I19,I20,I21,I22,I23,I24,I25,I26,I27,I28,I29,I30,I31;
input [4:0] S;
output reg [31:0] out;

always @(*)
    begin
        case(S)
            5'b0_0000: out <= I0; 
            5'b0_0001: out <= I1; 
            5'b0_0010: out <= I2; 
            5'b0_0011: out <= I3; 
            5'b0_0100: out <= I4; 
            5'b0_0101: out <= I5; 
            5'b0_0110: out <= I6; 
            5'b0_0111: out <= I7; 
            5'b0_1000: out <= I8; 
            5'b0_1001: out <= I9; 
            5'b0_1010: out <= I10;
            5'b0_1011: out <= I11; 
            5'b0_1100: out <= I12; 
            5'b0_1101: out <= I13;  
            5'b0_1110: out <= I14; 
            5'b0_1111: out <= I15; 
            5'b1_0000: out <= I16; 
            5'b1_0001: out <= I17; 
            5'b1_0010: out <= I18; 
            5'b1_0011: out <= I19;
            5'b1_0100: out <= I20;
            5'b1_0101: out <= I21;
            5'b1_0110: out <= I22;
            5'b1_0111: out <= I23;
            5'b1_1000: out <= I24;
            5'b1_1001: out <= I25;
            5'b1_1010: out <= I26;
            5'b1_1011: out <= I27;
            5'b1_1100: out <= I28;
            5'b1_1101: out <= I29;
            5'b1_1110: out <= I30;
            5'b1_1111: out <= I31;
            default: out<=32'h0000_0000;
        endcase
    end

endmodule
