`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2022 09:46:13 AM
// Design Name: 
// Module Name: tb_priority_encoder
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


module tb_priority_encoder(

    );
    
    reg [31:0] I0;
    wire [4:0] O0;
    
    priority_encoder m1(.I0(I0),.O0(O0));
    
    initial begin
        #50;
        I0 = 32'h0000_0000;
        #50;
        I0 = 32'd1;
        #50;
        I0 = 32'd2;
        #50;
        I0 = 32'd4;
        #50;
        I0 = 32'd128;
        #50;
        I0 = 32'd32;
        #50;
        $stop;
    end
    
endmodule
