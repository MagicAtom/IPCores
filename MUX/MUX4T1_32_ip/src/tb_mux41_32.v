`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 08:29:50 PM
// Design Name: 
// Module Name: tb_mux41_32
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


module tb_mux41_32(
    
    );
    reg [31:0] a,b,c,d;
    reg [1:0] S;
    wire [31:0] out;
    MUX4T1_32 m1(.I0(a),.I1(b),.I2(c),.I3(d),.S(S),.O0(out));
    
    initial begin
    #50;
    a=1; b=2; c=3; d=4;
    S=0;
    #50;
    S=1;
    #50;
    S=2;
    #50;
    S=3;
    #50;
    $stop;
    end
    
endmodule
