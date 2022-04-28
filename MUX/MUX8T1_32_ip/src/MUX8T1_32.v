`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 11:21:27 PM
// Design Name: 
// Module Name: MUX8T1_32
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

module MUX8T1_32(
    I0,I1,I2,I3,I4,I5,I6,I7,
    S,
    O0
    );
input [31:0] I0,I1,I2,I3,I4,I5,I6,I7;
input [2:0] S;
output reg [31:0] O0;

always @(*)
    begin
        case(S)
            4'b000: O0 <= I0; 
            4'b001: O0 <= I1; 
            4'b010: O0 <= I2; 
            4'b011: O0 <= I3; 
            4'b100: O0 <= I4; 
            4'b101: O0 <= I5; 
            4'b110: O0 <= I6; 
            4'b111: O0 <= I7; 
            default: O0<=32'h0000_0000;
        endcase
    end

endmodule