`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 07:52:02 PM
// Design Name: 
// Module Name: tb_mux16t1_32
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


module tb_mux16t1_32(

    );
    
    reg [31:0] I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15;
    reg [3:0] ALUSel;
    wire [31:0] out;
    
    MUX16T1_32 m1(I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,ALUSel,out);
    
    initial begin
    #50;
    I0 = 0;I1 = 1;I2 = 2;I3 = 3; I4 = 4;I5 = 5;I6 = 6;I7 = 7;
    I8 = 8;I9 = 9;I10 = 10;I11 = 11; I12 = 12;I13 = 13;I14 = 14;I15 = 15;   
    ALUSel = 4'b0000;
    #50;
    ALUSel = 4'b0001;
    #50;
    ALUSel = 4'b0100;
    #50;
    ALUSel = 4'b0101;
    #50;
    ALUSel = 4'b1001;
    #50;
    ALUSel = 4'b1100;
    #50;
    ALUSel = 4'b1101;
    #50;
    ALUSel = 4'b1110;
    #50;    
    $stop;
    end
endmodule
