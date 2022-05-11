`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2022 02:22:42 PM
// Design Name: 
// Module Name: tb_control_logic
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


module tb_control_logic(

    );
    reg [31:0] inst;
    reg BrEq;
    reg BrLt;
    wire [5:0] test;
    wire PCSel,ts;
    control_logic m1(
        .inst(inst),
        .BrEq(BrEq),
        .BrLt(BrLt),
        .PCSel(PCSel)
    );
    
    initial begin
    inst = 32'h0; BrEq=1'b0; BrLt=1'b0;
    #50;
    inst = 32'h00C58533; // 1_add 
    #20;
    inst = 32'h02C58533; // 2_mul
    #20; 
    inst = 32'h40C58533; // 3_sub
    #20;
    inst = 32'h00C59533; // 4_sll
    #20;
    inst = 32'h02C59533; // 5_mulh
    #20;
    inst = 32'h02C5B533; // 6_mulhu
    #20;
    inst = 32'h00C5A533; // 7_slt
    #20;
    inst = 32'h00C5C533; // 8_xor
    #20;    
    inst = 32'h00C5D533; // 9_srl
    #20;
    inst = 32'h40C5D533; // 10_sra
    #20; 
    inst = 32'h00C5E533; // 11_or
    #20;
    inst = 32'h00C5F533; // 12_and
    #20;
    inst = 32'h00010503; // 13_lb
    #20;
    inst = 32'h00011583; // 14_lh
    #20;
    inst = 32'h00012583; // 15_lw
    #20;
    inst = 32'h00150513; // 16_addi
    #20;
    inst = 32'h00451513; // 17_slli
    #20;
    inst = 32'h00252513; // 18_slti
    #20;
    inst = 32'h00354513; // 19_xori
    #20;
    inst = 32'h00155513; // 20_srl
    #20;
    inst = 32'h40155513; // 21_sra
    #20;
    inst = 32'h00056513; // 22_or
    #20;
    inst = 32'h00F57513; // 23_and
    #20; 
    inst = 32'h00A10023; // 24_sb
    #20;
    inst = 32'h00A11023; // 25_sh
    #20;
    inst = 32'h00A12023; // 26_sw
    #20;
    inst = 32'h00050263; BrEq=1; BrLt=0; // Beq;
    #20;
    inst = 32'h00051263; BrEq=0; BrLt=1; // Bne;
    #20;
    inst = 32'h00054263; BrEq=0; BrLt=1; //blt 
    #20;
    inst = 32'h00055263; BrEq=1; BrLt=0; //bge
    #20;
    inst = 32'h00056263; BrEq=0; BrLt=1; // bltu
    #20;
    inst = 32'h00057263; BrEq=0; BrLt=0; // bgeu;
    #20;
    inst = 32'h00000533;
    #20;
    inst = 32'h03039517;
    #20;
    inst = 32'h03039537;
    #20;
    inst = 32'h0040006F;
    #20;
    inst = 32'h00050067;
    #20;
    inst = 32'h00000533;
   $stop;
    end;
    
endmodule
