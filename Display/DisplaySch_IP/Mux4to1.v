`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 11:50:44 PM
// Design Name: 
// Module Name: Mux4to1
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


module Mux4to1(I0, 
               I1, 
               I2, 
               I3, 
               s, 
               o);

    input I0;
    input I1;
    input I2;
    input I3;
    input [1:0] s;
   output o;
   
   wire XLXN_6;
   wire XLXN_9;
   wire XLXN_13;
   wire XLXN_14;
   wire XLXN_15;
   wire XLXN_16;
   wire XLXN_21;
   wire XLXN_22;
   wire XLXN_23;
   wire XLXN_24;
   
   INV  XLXI_1 (.I(s[0]), 
               .O(XLXN_6));
   INV  XLXI_2 (.I(s[1]), 
               .O(XLXN_9));
   AND2  XLXI_3 (.I0(XLXN_9), 
                .I1(XLXN_6), 
                .O(XLXN_13));
   AND2  XLXI_4 (.I0(XLXN_9), 
                .I1(s[0]), 
                .O(XLXN_14));
   AND2  XLXI_5 (.I0(s[1]), 
                .I1(XLXN_6), 
                .O(XLXN_15));
   AND2  XLXI_6 (.I0(s[1]), 
                .I1(s[0]), 
                .O(XLXN_16));
   AND2  XLXI_7 (.I0(I0), 
                .I1(XLXN_13), 
                .O(XLXN_21));
   AND2  XLXI_8 (.I0(I1), 
                .I1(XLXN_14), 
                .O(XLXN_22));
   AND2  XLXI_9 (.I0(I2), 
                .I1(XLXN_15), 
                .O(XLXN_23));
   AND2  XLXI_10 (.I0(I3), 
                 .I1(XLXN_16), 
                 .O(XLXN_24));
   OR4  XLXI_11 (.I0(XLXN_24), 
                .I1(XLXN_23), 
                .I2(XLXN_22), 
                .I3(XLXN_21), 
                .O(o));
endmodule

