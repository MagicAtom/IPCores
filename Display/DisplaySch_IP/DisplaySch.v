`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 11:51:31 PM
// Design Name: 
// Module Name: DisplaySch
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


module DisplaySch(clk_100mhz, 
               LEs, 
               num, 
               points, 
               RSTN, 
               AN, 
               SEGMENT);

    input clk_100mhz;
    input [3:0] LEs;
    input [15:0] num;
    input [3:0] points;
    input RSTN;
   output [3:0] AN;
   output [7:0] SEGMENT;
   
   wire [31:0] clkdiv;
   wire [3:0] I0;
   wire [3:0] I2;
   wire [3:0] I3;
   wire [3:0] o;
   wire XLXN_5;
   wire XLXN_6;
   wire [3:0] XLXN_34;
   
   assign I0 = 4'hE;
   assign I2 = 4'hB;
   assign I3 = 4'h7;
   assign XLXN_34 = 4'hD;
   Mux4to1b4  XLXI_1 (.I0(num[15:12]), 
                     .I1(num[11:8]), 
                     .I2(num[7:4]), 
                     .I3(num[3:0]), 
                     .s(clkdiv[18:17]), 
                     .o(o[3:0]));
   Mux4to1  XLXI_2 (.I0(LEs[3]), 
                   .I1(LEs[2]), 
                   .I2(LEs[1]), 
                   .I3(LEs[0]), 
                   .s(clkdiv[18:17]), 
                   .o(XLXN_5));
   Mux4to1  XLXI_3 (.I0(points[3]), 
                   .I1(points[2]), 
                   .I2(points[1]), 
                   .I3(points[0]), 
                   .s(clkdiv[18:17]), 
                   .o(XLXN_6));
   MyMC14495  XLXI_4 (.D0(o[0]), 
                     .D1(o[1]), 
                     .D2(o[2]), 
                     .D3(o[3]), 
                     .LE(XLXN_5), 
                     .point(XLXN_6), 
                     .a(SEGMENT[0]), 
                     .b(SEGMENT[1]), 
                     .c(SEGMENT[2]), 
                     .d(SEGMENT[3]), 
                     .e(SEGMENT[4]), 
                     .f(SEGMENT[5]), 
                     .g(SEGMENT[6]), 
                     .p(SEGMENT[7]));
   clkdiv  XLXI_6 (.clk(clk_100mhz), 
                  .rst(RSTN), 
                  .clkdiv(clkdiv[31:0]));
   Mux4to1b4  XLXI_7 (.I0(I0[3:0]), 
                     .I1(XLXN_34[3:0]), 
                     .I2(I2[3:0]), 
                     .I3(I3[3:0]), 
                     .s(clkdiv[18:17]), 
                     .o(AN[3:0]));
endmodule
