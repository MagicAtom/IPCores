`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 07:20:41 AM
// Design Name: 
// Module Name: tb_ALU
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
module tb_ALU;

reg [4:0] ALUSel;
reg [31:0] a,b;
wire [31:0] c;

reg clk = 1'b0;
always clk = #5 ~clk;
ALU alu(.ALUSel(ALUSel),.a(a),.b(b),.c(c));
initial begin
iteration(32'hffffffff,32'h0000_0001,32'h0000_0001,4'b0010,`__LINE__);
end

task iteration(
input [31:0] ia,ib,
input [31:0] expected_result,
input [3:0] control_bits,
input integer linenum
);
begin
@(negedge clk)
begin
	a = ia;
	b = ib;
	ALUSel=control_bits;
end
@(posedge clk)
begin
if ((expected_result == c))
	$display ("Success : %d",linenum);

else
	$display ("Failed %d : Expected_result = %h, Result = %h \n ",linenum,expected_result,c);
end
end
endtask

endmodule
