`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 01:55:31 PM
// Design Name: 
// Module Name: tb_regfile
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


module tb_regfile(

    );
    reg clk=0,rst=0;
    reg RegWEn;
    reg [4:0] WriteReg,ReadReg1,ReadReg2;
    reg [31:0] RegWriteData;
    wire [31:0] RegReadData1,RegReadData2;
    wire [31:0] reg_ra;
    wire [31:0] reg_sp;
    wire [31:0] reg_a0;
    wire [31:0] reg_a1;
    wire [31:0] reg_t0;
    wire [31:0] reg_t1;
    wire [31:0] reg_t2;
    wire [31:0] reg_s0;
    wire [31:0] reg_s1; 
   Reg m1(
        .clk(clk),
        .rst(rst),
        .RegWEn(RegWEn),
        .ReadReg1(ReadReg1),
        .ReadReg2(ReadReg2),
        .WriteReg(WriteReg),
        .RegWriteData(RegWriteData),
        .RegReadData1(RegReadData1),
        .RegReadData2(RegReadData2),
        .reg_ra(reg_ra),              // output wire [31 : 0] reg_ra
        .reg_sp(reg_sp),              // output wire [31 : 0] reg_sp
        .reg_a0(reg_a0),              // output wire [31 : 0] reg_a0
        .reg_a1(reg_a1),              // output wire [31 : 0] reg_a1
        .reg_s0(reg_s0),              // output wire [31 : 0] reg_s0
        .reg_s1(reg_s1),              // output wire [31 : 0] reg_s1
        .reg_t0(reg_t0),              // output wire [31 : 0] reg_t0
        .reg_t1(reg_t1),              // output wire [31 : 0] reg_t1
        .reg_t2(reg_t2)              // output wire [31 : 0] reg_t2    
        );
        
    always clk = #10 ~clk;
            
    initial begin
        rst = 1;
        ReadReg1 = 0;
        ReadReg2 = 0;
        WriteReg = 0;
        RegWriteData = 0;
        RegWEn = 0;
        #100;
        rst = 0;
        ReadReg1= 0;
        ReadReg2 = 0;
        RegWEn = 1;
        WriteReg[4:0] = 5'h05;
        RegWriteData[31:0] = 32'ha5a5a5a5;
        #50;
        WriteReg[4:0] = 0; // test x0
        #50;
        WriteReg[4:0] = 5'h0a;
        RegWriteData[31:0] = 32'hdcdcdcdc;
        #50;
        RegWEn = 0;
        #100;
        ReadReg1[4:0] = 5'h05;
        ReadReg2[4:0] = 5'h0a;
        #50;
        ReadReg1[4:0] = 5'h1f;
        #50;
        $stop;
    end
endmodule
