`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 07:21:15 PM
// Design Name: 
// Module Name: partial_store
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


module partial_store(
    opcode,
    funct3,
    MemWEn,
    MemAddress,
    DataFromReg,
    MemWriteMask,
    DataToMem
    );
    input MemWEn;
    input [31:0] DataFromReg;
    input [9:0] MemAddress;
    output [3:0] MemWriteMask;
    output [31:0] DataToMem;
    
    input [6:0] opcode;
    input [2:0] funct3;
    wire [1:0] low2bits;
    
    wire [31:0] ByteData;
    wire [31:0] HalfData;
    wire [31:0] WordData;
    wire [31:0] ByteOut;
    wire [31:0] HalfOut;
    wire [31:0] WordOut;
    wire [31:0] ByteMask;
    wire [31:0] HalfMask;
    wire [31:0] WordMask;
    wire [31:0] ExtendedMask,MaskRes;
    
    assign WordData = DataFromReg;
    assign HalfData = {16'b0,DataFromReg[15:0]};
    assign ByteData = {24'b0,DataFromReg[7:0]};
   
    assign low2bits = MemAddress[1:0];    
    
    // Byte part
    wire [31:0] bd1,bd2,bd3,bd4;
    assign bd1 = {24'b0,ByteData[7:0]};
    assign bd2 = {16'b0,ByteData[7:0],8'b0};
    assign bd3 = {8'b0,ByteData[7:0],16'b0};
    assign bd4 = {ByteData[7:0],24'b0};
    MUX4T1_32_0 m1(.I0(bd1),.I1(bd2),.I2(bd3),.I3(bd4),.S(low2bits),.O0(ByteOut));
    MUX4T1_32_0 m2(.I0(32'h0000_0001),.I1(32'h0000_0002),.I2(32'h0000_0004),.I3(32'h0000_0008),.S(low2bits),.O0(ByteMask));
    // Halfword part
    wire [31:0] hd1,hd2;
    assign hd1 = {16'b0,HalfData[15:0]};
    assign hd2 = {HalfData[15:0],16'd0};
    MUX2T1_32_0 m3(.I0(hd1),.I1(hd2),.S(low2bits[1]),.O0(HalfOut));
    MUX2T1_32_0 m4(.I0(32'h0000_0003),.I1(32'h0000_000c),.S(low2bits[1]),.O0(HalfMask));
    // Word part
    assign WordOut = DataFromReg;
    assign WordMask = 32'h0000_000f;
    MUX4T1_32_0 m5(.I0(ByteData),.I1(HalfData),.I2(WordData),.I3(32'h0),.S(funct3[1:0]),.O0(DataToMem));
    MUX4T1_32_0 m6(.I0(ByteMask),.I1(HalfMask),.I2(WordMask),.I3(32'h0),.S(funct3[1:0]),.O0(ExtendedMask));
    MUX2T1_32_0 m7(.I0(32'h0000_0000),.I1(ExtendedMask),.S(MemWEn),.O0(MaskRes));
    assign MemWriteMask = MaskRes[3:0];
    
endmodule