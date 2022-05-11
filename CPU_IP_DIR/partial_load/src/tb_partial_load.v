`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 02:28:08 PM
// Design Name: 
// Module Name: tb_partial_load
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


module tb_partial_load(
      
    );
    
    reg [31:0] inst,mem_addr,data_from_mem;
    wire [31:0] data_to_reg;
    
    partial_load U1(
        .inst(inst),
        .mem_addr(mem_addr),
        .data_from_mem(data_from_mem),
        .data_to_reg(data_to_reg)
    );
    
    initial begin
    #50;
    inst = 32'h0; mem_addr = 32'h0; data_from_mem = 32'h0;
    #50;
    data_from_mem = 32'h12345678;
    inst = 32'h00000503; // lb 0 
    #50;
    inst = 32'h00100503; //lb 1
    mem_addr = 32'h0000_0001;
    #50;
    inst = 32'h00200503; //lb 2
    mem_addr = 32'h0000_0002;
    #50;
    inst = 32'h00300503; //lb 3
    mem_addr = 32'h0000_0003;
    #50;
    mem_addr = 32'h0000_0000;
    inst = 32'h00001503;
    #50;
    mem_addr = 32'h0000_0001;
    inst = 32'h00101503;
    #50;    
    mem_addr = 32'h0000_0002;
    inst = 32'h00201503;
    #50;
    mem_addr = 32'h0000_0000;
    inst = 32'h00002503;
    #50;
    $stop;
    end
    
endmodule
