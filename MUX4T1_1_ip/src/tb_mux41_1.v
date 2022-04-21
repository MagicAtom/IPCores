`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 08:19:26 PM
// Design Name: 
// Module Name: tb_mux41_1
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


module tb_mux41_1(

    );
reg a,b,c,d;
reg [1:0] S;
wire out;   
MUX4T1_1 m1(.I0(a),.I1(b),.I2(c),.I3(d),.S(S),.O0(out));
initial begin
#50;
a=0;b=1;c=1;d=0;
S=2'b00;
#50;
S=2'b01;
#50;
S=2'b11;
#50;
S=2'b10;
#50;
end
endmodule
