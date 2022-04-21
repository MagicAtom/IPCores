`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 03:31:43 PM
// Design Name: 
// Module Name: tb_dmem
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


module tb_dmem(

    );
    reg clk = 1'b0;
    reg [9:0] MemAddress;
    reg [31:0] MemWriteData;
    reg [3:0] MemWriteMask;
    wire [31:0] MemReadData;
    DMem m1(
    .clk(clk),
    .MemAddress(MemAddress),
    .MemWriteData(MemWriteData),
    .MemWriteMask(MemWriteMask),
    .MemReadData(MemReadData)
    );
    always clk=#5 ~clk;
    initial begin
    #50;
    MemAddress = 10'b000000_0000;
    MemWriteData = 32'h0000_0001;
    MemWriteMask = 4'b1111;
    #50;
    MemWriteData = 32'h0700_0000;
    MemWriteMask = 4'b1000;
    #50;
    MemWriteData = 32'h0000_2345;
    MemWriteMask = 4'b0011;
    #50;
    MemAddress = 10'b000000_0100;
    MemWriteData = 32'hfedc_2345;
    MemWriteMask = 4'b1111;
    #50;
    MemAddress = 10'b000000_0000;
    MemWriteMask = 4'b0000;
    #50;
    MemAddress = 10'b000000_0100;
    #50;
    $stop;
    end
endmodule
