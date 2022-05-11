`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 11:25:40 AM
// Design Name: 
// Module Name: partial_load
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


module partial_load(
    input [6:0] opcode,
    input [2:0] funct3,
    input [31:0] mem_addr,
    input [31:0] data_from_mem,
    output [31:0] data_to_reg
    );
   
    wire [1:0] low2bits;
    wire [31:0] aligned_addr;
    
    wire [31:0] lb_res,lh_res,lw_res;
    
    assign low2bits = mem_addr[1:0];
    assign aligned_addr = {mem_addr[31:2],2'b0};
    
    assign lw_res = data_from_mem;
    
    wire [31:0] b1,b2,b3,b4,b5;
    assign b1 = {24'b0,data_from_mem[7:0]};
    assign b2 = {24'b0,data_from_mem[15:8]};
    assign b3 = {24'b0,data_from_mem[23:16]};
    assign b4 = {24'b0,data_from_mem[31:24]};
    MUX4T1_32_0 U1(
          .I0(b1),  
          .I1(b2),  
          .I2(b3), 
          .I3(b4),  
          .S(low2bits),  
          .O0(b5)  
    );
    assign lb_res[31:0] = b5[7] == 1 ? {24'hffffff,b5[7:0]} : {24'h0,b5[7:0]};
    
    wire [31:0] h1,h2,h3,h4;
    assign h1 = {16'b0,data_from_mem[15:0]};
    assign h2 = {16'b0,data_from_mem[23:8]};
    assign h3 = {16'b0,data_from_mem[31:16]};
    MUX4T1_32_0 U2(
        .I0(h1),  
        .I1(h2),  
        .I2(h3),  
        .I3(32'h0000_0000), 
        .S(low2bits),   
        .O0(h4)  
    );
    assign lh_res[31:0] = h4[15] == 1 ? {16'hffff,h4[15:0]} : {16'h0,h4[15:0]};    
    
    MUX4T1_32_0 U3(
        .I0(lb_res),  
        .I1(lh_res),  
        .I2(lw_res),  
        .I3(32'h0000_0000), 
        .S(funct3[1:0]),   
        .O0(data_to_reg)  
    );
    
endmodule

