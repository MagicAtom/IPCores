`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 11:23:15 PM
// Design Name: 
// Module Name: tb_mux8t1_32
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


module tb_mux8t1_32(

    );
    
    reg [31:0] I0,I1,I2,I3,I4,I5,I6,I7;
    reg [2:0] S;
    wire [31:0] O0;
    
     MUX8T1_32 m1(
        I0,I1,I2,I3,I4,I5,I6,I7,
        S,
        O0
    );
    initial begin
    #50;
    I0 = 32'd0; I1=32'd1; I2 = 32'd2; I3=32'd3;
    I4 = 32'd4; I5=32'd5; I6 = 32'd6; I7=32'd7;
    #50;
    S = 3'd1;
    #50;
    S = 3'd2;
    #50;
    S = 3'd5;
    #50;
    end
endmodule
