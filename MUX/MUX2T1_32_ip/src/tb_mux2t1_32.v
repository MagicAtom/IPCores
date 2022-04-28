`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 11:00:11 PM
// Design Name: 
// Module Name: tb_mux2t1_32
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


module tb_mux2t1_32(
   
    );
    reg [31:0] I0,I1;
    reg S;
    wire [31:0] O0;
    MUX2T1_32 m1(.I0(I0),.I1(I1),.S(S),.O0(O0));
    initial begin
    #50;
    I0 = 0; I1 = 1;
    S = 0;
    #50;
    S = 1;
    #50;
    $stop;
    end
endmodule
