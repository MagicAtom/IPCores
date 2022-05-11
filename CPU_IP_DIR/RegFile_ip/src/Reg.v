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
    RegReadData2,
    reg_ra,
    reg_sp,
    reg_a0,
    reg_a1,
    reg_s0,
    reg_s1,
    reg_t0,
    reg_t1,
    reg_t2
    );
    input clk,rst,RegWEn;
    input [4:0] ReadReg1, ReadReg2, WriteReg;
    input [31:0] RegWriteData;
    output[31:0] RegReadData1,RegReadData2;
    output [31:0] reg_ra,reg_sp,reg_a0,reg_a1,reg_s0,reg_s1,reg_t0,reg_t1,reg_t2;
    wire [31:0] rdata1,rdata2;
    integer i;
    
    reg [31:0] register [1:31];
    assign RegReadData1 = (ReadReg1==0)?0:register[ReadReg1];
    assign RegReadData2 = (ReadReg2==0)?0:register[ReadReg2];
    
    always @ (posedge clk or posedge rst) 
    begin
        if(rst==1) begin
             register[5'd1]<=0;
             register[5'd2]<=32'h0000_0c00; //sp
             for(i=3;i<32;i=i+1) register[i] <= 0;
         end
        else if ((WriteReg!=0)&&(RegWEn==1)) register[WriteReg] <= RegWriteData;
    end
    
    assign reg_ra = register[5'b00001];
    assign reg_sp = register[5'd2];
    assign reg_s0 = register[5'd8];
    assign reg_s1 = register[5'd9];
    assign reg_a0 = register[5'd10];
    assign reg_a1 = register[5'd11];
    assign reg_t0 = register[5'd5];
    assign reg_t1 = register[5'd6];
    assign reg_t2 = register[5'd7];
endmodule
