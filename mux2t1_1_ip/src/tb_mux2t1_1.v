`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2022 10:57:25 AM
// Design Name: 
// Module Name: tb_mux2t1_1
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


module tb_mux2t1_1();
reg I0,I1,s;
wire out;
MUX2T1_1 m1(I0,I1,s,out);
initial begin
#50;
I0 = 1;I1=0; s=0;
#50;
s=1;
#50;
$stop;
end
endmodule
