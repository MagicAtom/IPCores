`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2022 09:21:15 AM
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder(
   input [31:0] I0,
   output reg [5:0] O0
    );
    
   always @ (I0) begin
    if(I0[0] == 1) O0 = 5'b00000; 
    else if(I0[1] == 1) O0 = 5'b00001;
    else if(I0[2] == 1) O0 = 5'b00010;
    else if(I0[3] == 1) O0 = 5'b00011;
    else if(I0[4] == 1) O0 = 5'b00100;
    else if(I0[5] == 1) O0 = 5'b00101;
    else if(I0[6] == 1) O0 = 5'b00110;
    else if(I0[7] == 1) O0 = 5'b00111;
    else if(I0[8] == 1) O0 = 5'b01000;
    else if(I0[9] == 1) O0 = 5'b01001;
    else if(I0[10] == 1) O0 = 5'b01010;
    else if(I0[11] == 1) O0 = 5'b01011;
    else if(I0[12] == 1) O0 = 5'b01100;
    else if(I0[13] == 1) O0 = 5'b01101;
    else if(I0[14] == 1) O0 = 5'b01110;
    else if(I0[15] == 1) O0 = 5'b01111;
    else if(I0[16] == 1) O0 = 5'b10000;
    else if(I0[17] == 1) O0 = 5'b10001;
    else if(I0[18] == 1) O0 = 5'b10010;
    else if(I0[19] == 1) O0 = 5'b10011;
    else if(I0[20] == 1) O0 = 5'b10100;
    else if(I0[21] == 1) O0 = 5'b10101;
    else if(I0[22] == 1) O0 = 5'b10110;
    else if(I0[23] == 1) O0 = 5'b10111;
    else if(I0[24] == 1) O0 = 5'b11000;
    else if(I0[25] == 1) O0 = 5'b11001;
    else if(I0[26] == 1) O0 = 5'b11010;
    else if(I0[27] == 1) O0 = 5'b11011;
    else if(I0[28] == 1) O0 = 5'b11100;
    else if(I0[29] == 1) O0 = 5'b11101;
    else if(I0[30] == 1) O0 = 5'b11110;
    else if(I0[31] == 1) O0 = 5'b11111;
    else 
        O0 = 5'b00000;
   end
    
endmodule
