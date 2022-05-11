`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 07:48:26 PM
// Design Name: 
// Module Name: tb_branch_comp
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


module tb_branch_comp();
    reg [31:0] data1,data2;
    reg BrUn;
    wire BrEq,BrLt;
    
branch_comp U1(
    .RegReadData1(data1),
    .RegReadData2(data2),
    .BrUn(BrUn),
    .BrEq(BrEq),
    .BrLt(BrLt)
    );
    
    initial begin
        #50;
        data1 = 32'h0000_0000;
        data2 = 32'h0000_0000;
        BrUn = 1'b0;
        #50;
        data1 = 32'hffff_fffc;
        data2 = 32'hffff_ffff;
        BrUn = 1'b1;
        #50;
        BrUn = 1'b0;
        #50;
        data1 = 32'hffff_ffff;
        data2 = 32'hffff_fffc;
        #50;
        data2 = 32'h0000_00001;
        #50;
        $stop;
    end
endmodule
