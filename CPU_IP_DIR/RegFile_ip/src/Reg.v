`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 10:40:26 AM
// Design Name: 
// Module Name: Reg
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


module Reg(
    clk,  
    rst,  
    RegWEn, 
    ReadReg1,
    ReadReg2,
    WriteReg,
    RegWriteData,
    RegReadData1,  
    RegReadData2
    );
    input clk,rst,RegWEn;
    input [4:0] ReadReg1, ReadReg2, WriteReg;
    input [31:0] RegWriteData;
    output[31:0] RegReadData1,RegReadData2;
    wire [31:0] rdata1,rdata2;
    integer i;
    
    reg [31:0] register [1:31];
    assign RegReadData1 = (ReadReg1==0)?0:register[ReadReg1];
    assign RegReadData2 = (ReadReg2==0)?0:register[ReadReg2];
    
    always @ (posedge clk or posedge rst) 
    begin
        if(rst==1) for(i=1;i<32;i=i+1) register[i] <= 0;
        else if ((WriteReg!=0)&&(RegWEn==1)) register[WriteReg] <= RegWriteData;
    end
    
endmodule
