`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 11:53:07 PM
// Design Name: 
// Module Name: Mux4to1b4
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


module Mux4to1b4(I0, 
                 I1, 
                 I2, 
                 I3, 
                 s, 
                 o);

    input [3:0] I0;
    input [3:0] I1;
    input [3:0] I2;
    input [3:0] I3;
    input [1:0] s;
   output [3:0] o;
   
   wire XLXN_3;
   wire XLXN_4;
   wire XLXN_21;
   wire XLXN_22;
   wire XLXN_23;
   wire XLXN_24;
   wire XLXN_32;
   wire XLXN_33;
   wire XLXN_35;
   wire XLXN_36;
   wire XLXN_42;
   wire XLXN_43;
   wire XLXN_45;
   wire XLXN_46;
   wire XLXN_57;
   wire XLXN_58;
   wire XLXN_60;
   wire XLXN_61;
   wire XLXN_62;
   wire XLXN_63;
   wire XLXN_64;
   wire XLXN_65;
   
   INV  XLXI_1 (.I(s[0]), 
               .O(XLXN_3));
   AND2  XLXI_2 (.I0(XLXN_4), 
                .I1(XLXN_3), 
                .O(XLXN_62));
   AND2  XLXI_3 (.I0(XLXN_4), 
                .I1(s[0]), 
                .O(XLXN_63));
   AND2  XLXI_4 (.I0(s[1]), 
                .I1(XLXN_3), 
                .O(XLXN_64));
   AND2  XLXI_5 (.I0(s[1]), 
                .I1(s[0]), 
                .O(XLXN_65));
   INV  XLXI_6 (.I(s[1]), 
               .O(XLXN_4));
   AND2  XLXI_7 (.I0(I0[0]), 
                .I1(XLXN_62), 
                .O(XLXN_21));
   AND2  XLXI_8 (.I0(I1[0]), 
                .I1(XLXN_63), 
                .O(XLXN_22));
   AND2  XLXI_9 (.I0(I2[0]), 
                .I1(XLXN_64), 
                .O(XLXN_23));
   AND2  XLXI_10 (.I0(I3[0]), 
                 .I1(XLXN_65), 
                 .O(XLXN_24));
   OR4  XLXI_11 (.I0(XLXN_24), 
                .I1(XLXN_23), 
                .I2(XLXN_22), 
                .I3(XLXN_21), 
                .O(o[0]));
   AND2  XLXI_17 (.I0(I0[1]), 
                 .I1(XLXN_62), 
                 .O(XLXN_32));
   OR4  XLXI_18 (.I0(XLXN_36), 
                .I1(XLXN_35), 
                .I2(XLXN_33), 
                .I3(XLXN_32), 
                .O(o[1]));
   AND2  XLXI_19 (.I0(I1[1]), 
                 .I1(XLXN_63), 
                 .O(XLXN_33));
   AND2  XLXI_20 (.I0(I2[1]), 
                 .I1(XLXN_64), 
                 .O(XLXN_35));
   AND2  XLXI_21 (.I0(I3[1]), 
                 .I1(XLXN_65), 
                 .O(XLXN_36));
   AND2  XLXI_27 (.I0(I0[2]), 
                 .I1(XLXN_62), 
                 .O(XLXN_42));
   OR4  XLXI_28 (.I0(XLXN_46), 
                .I1(XLXN_45), 
                .I2(XLXN_43), 
                .I3(XLXN_42), 
                .O(o[2]));
   AND2  XLXI_29 (.I0(I1[2]), 
                 .I1(XLXN_63), 
                 .O(XLXN_43));
   AND2  XLXI_30 (.I0(I2[2]), 
                 .I1(XLXN_64), 
                 .O(XLXN_45));
   AND2  XLXI_31 (.I0(I3[2]), 
                 .I1(XLXN_65), 
                 .O(XLXN_46));
   AND2  XLXI_42 (.I0(I0[3]), 
                 .I1(XLXN_62), 
                 .O(XLXN_57));
   OR4  XLXI_43 (.I0(XLXN_61), 
                .I1(XLXN_60), 
                .I2(XLXN_58), 
                .I3(XLXN_57), 
                .O(o[3]));
   AND2  XLXI_44 (.I0(I1[3]), 
                 .I1(XLXN_63), 
                 .O(XLXN_58));
   AND2  XLXI_45 (.I0(I2[3]), 
                 .I1(XLXN_64), 
                 .O(XLXN_60));
   AND2  XLXI_46 (.I0(I3[3]), 
                 .I1(XLXN_65), 
                 .O(XLXN_61));
endmodule
