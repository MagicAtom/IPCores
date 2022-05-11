`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 03:04:51 PM
// Design Name: 
// Module Name: branch_comp
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


module branch_comp(
    input [31:0] RegReadData1,
    input [31:0] RegReadData2,
    input BrUn,
    output BrEq,
    output BrLt
    );
    
    assign BrEq = (RegReadData1 == RegReadData2) ? 1:0;
    assign BrLt = (BrUn==1) ?  ( (RegReadData1 < RegReadData2) ? 1 : 0)
                            : ( $signed(RegReadData1) < $signed(RegReadData2))? 1:0;
endmodule
