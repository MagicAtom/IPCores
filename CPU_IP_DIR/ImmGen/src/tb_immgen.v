`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 11:48:17 PM
// Design Name: 
// Module Name: tb_immgen
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


module tb_immgen(

    );
    reg [31:0] inst;
    reg [2:0] immSel;
    wire [31:0] imm;
    ImmGen m1(
        inst,
        immSel,
        imm
    );
    initial begin
    inst = 32'd0; immSel=3'b0;
    #50;
    immSel = 3'b011;
    inst = 32'h1000_0E17; // auipc x28,65536 expect Imm to be 10000_000. U type
    #50;
    immSel = 3'b010;
    inst = 32'h000E_0C63; // beq x28,x0,24 expect Imm to be 0001_1000 = 24 = 0x18. B type
    #50;
    immSel = 3'b000;
    inst = 32'hFFFE_0E13; // addi x28,x28,-1 expect Imm to be FFFF_FFFF = -1 I type
    #50;
    immSel =3'b100;
    inst = 32'hFEDF_F06F; // jal x0,-20 expect Imm to be FFFF_FFFEC = -20 J type
    #50;
    immSel = 3'b001;
    inst = 32'h0131_2623; // sw s3,12(sp) expect Imm to be 0000_1100=12 S type
    #50;
    $stop;
    end
    
    
endmodule
