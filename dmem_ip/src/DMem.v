`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 02:41:33 PM
// Design Name: 
// Module Name: DMem
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


module DMem(
    clk,
    MemAddress,
    MemWriteData,
    MemWriteMask,
    MemReadData
    );
    input clk;
    input [9:0] MemAddress;
    input [31:0] MemWriteData;
    input [3:0] MemWriteMask;
    output [31:0] MemReadData;
    
    blk_mem_gen_0 m1 (
    .clka(clk),   
    .wea(MemWriteMask[0]),      
    .addra(MemAddress), 
    .dina(MemWriteData[7:0]),    
    .douta(MemReadData[7:0]) 
    );
    
    blk_mem_gen_0 m2 (
    .clka(clk),    
    .wea(MemWriteMask[1]),      
    .addra(MemAddress),  
    .dina(MemWriteData[15:8]),    
    .douta(MemReadData[15:8]) 
    );
    
    blk_mem_gen_0 m3 (
    .clka(clk),   
    .wea(MemWriteMask[2]),     
    .addra(MemAddress),  
    .dina(MemWriteData[23:16]),    
    .douta(MemReadData[23:16])  
    );
    
    blk_mem_gen_0 m4 (
    .clka(clk),    
    .wea(MemWriteMask[3]),     
    .addra(MemAddress), 
    .dina(MemWriteData[31:24]),    
    .douta(MemReadData[31:24]) 
    );
    
    
endmodule
