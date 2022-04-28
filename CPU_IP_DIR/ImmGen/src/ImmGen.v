`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 11:09:53 PM
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
    input [31:0] inst,
    input [2:0] immSel,
    output [31:0] imm
    );
    
    // i0 - I immdiate
    // i1 - S 
    // i2 - B
    // i3 - U
    // i4 - J
    wire [31:0] i0,i1,i2,i3,i4; 
    
    assign i0[11:0] = inst[31:20];
    assign i0[31:12] = inst[31] ? {20{1'b1}}:{20{1'b0}};
    
    assign i1[4:0] = inst[11:7];
    assign i1[10:5] = inst[30:25];
    assign i1[31:11] = inst[31] ? {21{1'b1}}:{21{1'b0}};
    
    assign i2[0] = 1'b0;
    assign i2[4:1] = inst[11:8];
    assign i2[10:5] = inst[30:25];
    assign i2[11] = inst[7];
    assign i2[31:12] = inst[31] ? {20{1'b1}}:{20{1'b0}};
    
    assign i3[11:0] = 12'b0;
    assign i3[31:12] = inst[31:12];
    
    assign i4[0] = 1'b0;
    assign i4[10:1] = inst[30:21];
    assign i4[11] = inst[20];
    assign i4[19:12] = inst[19:12];
    assign i4[31:20] = inst[31] ?  {12{1'b1}}:{12{1'b0}};
    
    
    MUX8T1_32_0 m1(
        .I0(i0),
        .I1(i1),
        .I2(i2),
        .I3(i3),
        .I4(i4),
        .I5(32'h0),
        .I6(32'h0),
        .I7(32'h0),
        .S(immSel),
        .O0(imm)
    );
    
endmodule
