`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 07:49:34 PM
// Design Name: 
// Module Name: MUX16T1_32
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


module MUX16T1_32(
    I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,
    S,
    O0
    );
input [31:0] I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15;
input [3:0] S;
output reg [31:0] O0;

always @(*)
    begin
        case(S)
            4'b0000: O0 <= I0; 
            4'b0001: O0 <= I1; 
            4'b0010: O0 <= I2; 
            4'b0011: O0 <= I3; 
            4'b0100: O0 <= I4; 
            4'b0101: O0 <= I5; 
            4'b0110: O0 <= I6; 
            4'b0111: O0 <= I7; 
            4'b1000: O0 <= I8; 
            4'b1001: O0 <= I9; 
            4'b1010: O0 <= I10;
            4'b1011: O0<= I11; 
            4'b1100: O0 <= I12; 
            4'b1101: O0 <= I13;  
            4'b1110: O0 <= I14; 
            4'b1111: O0 <= I15; 
            default: O0<=32'h0000_0000;
        endcase
    end

endmodule
