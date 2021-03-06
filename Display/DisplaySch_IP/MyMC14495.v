`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 11:51:09 PM
// Design Name: 
// Module Name: MyMC14495
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


module MyMC14495(D0, 
                 D1, 
                 D2, 
                 D3, 
                 LE, 
                 point, 
                 a, 
                 b, 
                 c, 
                 d, 
                 e, 
                 f, 
                 g, 
                 p);

    input D0;
    input D1;
    input D2;
    input D3;
    input LE;
    input point;
   output a;
   output b;
   output c;
   output d;
   output e;
   output f;
   output g;
   output p;
   
   wire XLXN_14;
   wire XLXN_35;
   wire XLXN_37;
   wire XLXN_43;
   wire XLXN_44;
   wire XLXN_45;
   wire XLXN_46;
   wire XLXN_47;
   wire XLXN_48;
   wire XLXN_49;
   wire XLXN_50;
   wire XLXN_51;
   wire XLXN_53;
   wire XLXN_54;
   wire XLXN_55;
   wire XLXN_56;
   wire XLXN_57;
   wire XLXN_58;
   wire XLXN_60;
   wire XLXN_62;
   wire XLXN_63;
   wire XLXN_66;
   wire XLXN_67;
   wire XLXN_68;
   wire XLXN_69;
   wire XLXN_71;
   wire XLXN_72;
   wire XLXN_73;
   wire XLXN_74;
   wire XLXN_75;
   wire XLXN_76;
   wire XLXN_77;
   
   INV  XLXI_1 (.I(D3), 
               .O(XLXN_14));
   INV  XLXI_2 (.I(D2), 
               .O(XLXN_37));
   INV  XLXI_3 (.I(D1), 
               .O(XLXN_35));
   INV  XLXI_4 (.I(D0), 
               .O(XLXN_43));
   AND4  XLXI_9 (.I0(D0), 
                .I1(XLXN_37), 
                .I2(XLXN_35), 
                .I3(XLXN_14), 
                .O(XLXN_44));
   AND4  XLXI_10 (.I0(XLXN_43), 
                 .I1(XLXN_35), 
                 .I2(D2), 
                 .I3(XLXN_14), 
                 .O(XLXN_60));
   AND4  XLXI_11 (.I0(D0), 
                 .I1(XLXN_35), 
                 .I2(D2), 
                 .I3(D3), 
                 .O(XLXN_53));
   AND4  XLXI_12 (.I0(D0), 
                 .I1(D1), 
                 .I2(XLXN_37), 
                 .I3(D3), 
                 .O(XLXN_45));
   AND4  XLXI_19 (.I0(D0), 
                 .I1(XLXN_35), 
                 .I2(D2), 
                 .I3(XLXN_14), 
                 .O(XLXN_69));
   AND3  XLXI_20 (.I0(XLXN_43), 
                 .I1(D1), 
                 .I2(D2), 
                 .O(XLXN_68));
   AND3  XLXI_21 (.I0(XLXN_43), 
                 .I1(D2), 
                 .I2(D3), 
                 .O(XLXN_66));
   AND3  XLXI_22 (.I0(D0), 
                 .I1(D1), 
                 .I2(D3), 
                 .O(XLXN_67));
   AND4  XLXI_23 (.I0(XLXN_43), 
                 .I1(D1), 
                 .I2(XLXN_37), 
                 .I3(XLXN_14), 
                 .O(XLXN_63));
   AND3  XLXI_24 (.I0(D1), 
                 .I1(D2), 
                 .I2(D3), 
                 .O(XLXN_62));
   AND3  XLXI_25 (.I0(D0), 
                 .I1(D1), 
                 .I2(D2), 
                 .O(XLXN_58));
   AND4  XLXI_26 (.I0(XLXN_43), 
                 .I1(D1), 
                 .I2(XLXN_37), 
                 .I3(D3), 
                 .O(XLXN_57));
   AND2  XLXI_43 (.I0(D0), 
                 .I1(XLXN_14), 
                 .O(XLXN_56));
   AND3  XLXI_44 (.I0(XLXN_35), 
                 .I1(D2), 
                 .I2(XLXN_14), 
                 .O(XLXN_55));
   AND3  XLXI_45 (.I0(D0), 
                 .I1(XLXN_35), 
                 .I2(XLXN_37), 
                 .O(XLXN_54));
   AND3  XLXI_46 (.I0(D0), 
                 .I1(XLXN_37), 
                 .I2(XLXN_14), 
                 .O(XLXN_51));
   AND3  XLXI_47 (.I0(D1), 
                 .I1(XLXN_37), 
                 .I2(XLXN_14), 
                 .O(XLXN_50));
   AND3  XLXI_48 (.I0(D0), 
                 .I1(D1), 
                 .I2(XLXN_14), 
                 .O(XLXN_49));
   AND3  XLXI_49 (.I0(XLXN_35), 
                 .I1(XLXN_37), 
                 .I2(XLXN_14), 
                 .O(XLXN_47));
   AND4  XLXI_50 (.I0(D0), 
                 .I1(D1), 
                 .I2(D2), 
                 .I3(XLXN_14), 
                 .O(XLXN_48));
   AND4  XLXI_51 (.I0(XLXN_43), 
                 .I1(XLXN_35), 
                 .I2(D2), 
                 .I3(D3), 
                 .O(XLXN_46));
   OR4  XLXI_52 (.I0(XLXN_45), 
                .I1(XLXN_53), 
                .I2(XLXN_60), 
                .I3(XLXN_44), 
                .O(XLXN_77));
   OR4  XLXI_53 (.I0(XLXN_67), 
                .I1(XLXN_66), 
                .I2(XLXN_68), 
                .I3(XLXN_69), 
                .O(XLXN_76));
   OR3  XLXI_56 (.I0(XLXN_62), 
                .I1(XLXN_63), 
                .I2(XLXN_66), 
                .O(XLXN_75));
   OR4  XLXI_57 (.I0(XLXN_57), 
                .I1(XLXN_58), 
                .I2(XLXN_60), 
                .I3(XLXN_44), 
                .O(XLXN_74));
   OR3  XLXI_58 (.I0(XLXN_54), 
                .I1(XLXN_55), 
                .I2(XLXN_56), 
                .O(XLXN_73));
   OR4  XLXI_59 (.I0(XLXN_49), 
                .I1(XLXN_50), 
                .I2(XLXN_51), 
                .I3(XLXN_53), 
                .O(XLXN_72));
   OR3  XLXI_60 (.I0(XLXN_46), 
                .I1(XLXN_48), 
                .I2(XLXN_47), 
                .O(XLXN_71));
   OR2  XLXI_61 (.I0(LE), 
                .I1(XLXN_77), 
                .O(a));
   OR2  XLXI_62 (.I0(LE), 
                .I1(XLXN_76), 
                .O(b));
   OR2  XLXI_63 (.I0(LE), 
                .I1(XLXN_75), 
                .O(c));
   OR2  XLXI_64 (.I0(LE), 
                .I1(XLXN_74), 
                .O(d));
   OR2  XLXI_65 (.I0(LE), 
                .I1(XLXN_73), 
                .O(e));
   OR2  XLXI_66 (.I0(LE), 
                .I1(XLXN_72), 
                .O(f));
   OR2  XLXI_67 (.I0(LE), 
                .I1(XLXN_71), 
                .O(g));
   INV  XLXI_86 (.I(point), 
                .O(p));
endmodule


