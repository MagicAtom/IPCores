`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 10:52:11 PM
// Design Name: 
// Module Name: control_logic
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
 

module control_logic(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    input BrEq,
    input BrLt,
    output PCSel,
    output RegWEn,
    output [2:0] ImmSel,
    output BrUn,
    output ASel,
    output BSel,
    output [3:0] ALUSel,
    output MemWEn,
    output [1:0] WBSel,
    output isR,
    output isL,
    output isS,
    output isJ,
    output isI
    );
    
    wire [5:0] RomInput;
    wire [15:0] signals;
    
    dist_mem_gen_0 m1(.a(RomInput[5:0]),.spo(signals[15:0]));
    assign RegWEn = signals[0];
    assign ImmSel = signals[3:1];
    assign BrUn = signals[4];
    assign ASel = signals[5];
    assign BSel = signals[6];
    assign ALUSel = signals[10:7];
    assign MemWEn = signals[11];
    assign WBSel = signals[13:12];
    
    
    wire isSpecial;
    wire isjal,isjalr,isAuipc,isLui;
    
    assign isR = (opcode==7'h33) ? 1:0;
    assign isL = (opcode == 7'h03) ? 1:0;
    assign isI = opcode == 7'h13 ? 1:0;
    assign isS = opcode == 7'h23 ? 1:0;
    assign isB = opcode == 7'h63 ? 1:0;
    ;
    assign isAuipc = opcode == 7'h17 ? 1:0;
    assign isLui = opcode == 7'h37 ? 1:0;
    assign isjal = opcode == 7'h6f ? 1:0;
    assign isjalr = opcode == 7'h67 ? 1:0;
    assign isSpecial = (isAuipc || isLui || isjal || isjalr);
    
    // funct3 
    wire isZero,isOne,isTwo,isThree,isFour,isFive,isSix,isSeven;
    assign isZero = (funct3==3'd0)? 1:0;
    assign isOne = (funct3==3'd1)? 1:0;
    assign isTwo = (funct3==3'd2)? 1:0;
    assign isThree = (funct3==3'd3)? 1:0;
    assign isFour = (funct3==3'd4)? 1:0;
    assign isFive = (funct3==3'd5)? 1:0;
    assign isSix = (funct3==3'd6)? 1:0;
    assign isSeven = (funct3==3'd7)? 1:0;
    
    //funct7
    wire isFunc0,isFunc1,isFunc32;
    assign isFunc0 = (funct7 == 7'b0) ? 1:0;
    assign isFunc1 = (funct7 == 7'd1) ? 1:0;
    assign isFunc32 = (funct7 == 7'h20) ? 1:0;
    
    wire isAdd,isMul,isSub,isSll,isMulh,isMulhu,isSlt,isXor,isSrl,isSra,isOr,isAnd;
    wire isLb,isLh,isLw;
    wire isAddi,isSlli,isSlti,isXori,isSrli,isSrai,isOri,isAndi;
    wire isSb,isSh,isSw;
    wire isBeq,isBne,isBlt,isBge,isBltu,isBgeu;
    wire [31:0] encoder_in;
    wire [5:0] encoder_out;
//    assign encoder_in = {isAdd,isMul,isSub,isSll,isMulh,isMulhu,isSlt,isXor,isSrl,isSra,isOr,isAnd,
//        isLb,isLh,isLw,isAddi,isSlli,isSlti,isXori,isSrli,isSrai,isOri,isAndi,
//        isSb,isSh,isSw,isBeq,isBne,isBlt,isBge,isBltu,isBgeu};
    assign encoder_in = {
        isBgeu,isBltu,isBge,isBlt,isBne,isBeq,
        isSw,isSh,isSb,isAndi,isOri,isSrai,isSrli,isXori,isSlti,isSlli,isAddi,isLw,isLh,isLb,
        isAnd,isOr,isSra,isSrl,isXor,isSlt,isMulhu,isMulh,isSll,isSub,isMul,isAdd
    };
    PriorityEncoder_32 m2(.I0(encoder_in),.O0(encoder_out));
    
    // R type
    assign isAdd =  (isR==1 && isZero==1 && isFunc0==1) ? 1:0;
    assign isMul =  (isR==1 && isZero==1 && isFunc1==1) ? 1:0;
    assign isSub =  (isR==1 && isZero==1 && isFunc32==1) ? 1:0;
    assign isSll =  (isR==1 && isOne==1  && isFunc0==1) ? 1:0;
    assign isMulh=  (isR==1 && isOne==1  && isFunc1==1) ? 1:0;
    assign isMulhu= (isR==1 && isThree==1 && isFunc1==1) ? 1:0;
    assign isSlt =  (isR==1 && isTwo==1  && isFunc0==1) ? 1:0;
    assign isXor =  (isR==1 && isFour==1 && isFunc0==1) ? 1:0;
    assign isSrl =  (isR==1 && isFive==1 && isFunc0==1) ? 1:0;
    assign isSra =  (isR==1 && isFive==1 && isFunc32==1) ? 1:0;
    assign isOr  =  (isR==1 && isSix==1  && isFunc0==1) ? 1:0;
    assign isAnd =  (isR==1 && isSeven==1 && isFunc0==1) ? 1:0;
    
    // Load instruction
    assign isLb = (isL==1 && isZero==1) ? 1:0;
    assign isLh = (isL==1 && isOne==1) ? 1:0;
    assign isLw = (isL==1 && isTwo==1) ? 1:0;
    // Store instruction
    assign isSb = (isS==1 && isZero==1) ? 1:0;
    assign isSh = (isS==1 && isOne==1) ? 1:0;
    assign isSw = (isS==1 && isTwo==1) ? 1:0;
    
    // I type instruction
    assign isAddi = (isI==1 && isZero==1) ? 1:0;
    assign isSlli = (isI==1 && isOne==1 && isFunc0==1) ? 1:0;
    assign isSlti = (isI==1 && isTwo==1) ? 1:0;
    assign isXori = (isI==1 && isFour==1) ? 1:0;
    assign isSrli = (isI==1 && isFive==1 && isFunc0==1) ? 1:0;
    assign isSrai = (isI==1 && isFive==1 && isFunc32==1) ? 1:0;
    assign isOri = (isI==1 && isSix==1) ? 1:0;
    assign isAndi = (isI==1 && isSeven==1) ? 1:0;
    
    // B type instruction
    assign isBeq = (isB==1 && isZero==1) ? 1:0;
    assign isBne = (isB==1 && isOne==1) ? 1:0;
    assign isBlt = (isB==1 && isFour==1) ? 1:0;
    assign isBge = (isB==1 && isFive==1) ? 1:0;
    assign isBltu = (isB==1 && isSix==1) ? 1:0;
    assign isBgeu = (isB==1 && isSeven==1) ? 1:0;
    
    // pc signals 
    wire isJump,isBranch;
    assign PCSel = (isJump==1 || isBranch==1)?1:0;
    assign isJump = (isjal == 1 || isjalr==1) ? 1:0;
    assign isBranch = ((isBeq==1&&BrEq==1) || (isBne==1&&BrEq==0) || 
                        ((isBlt==1 || isBltu==1) && BrLt==1) ||
                        ((isBge==1 || isBgeu==1) && BrLt==0) 
                        ) ? 1:0;
    // 
    assign RomInput[5:0] = (isSpecial==0) ? {1'b0,encoder_out[4:0]} : 
                        (isAuipc==1) ? 6'd32 :
                        (isLui==1) ? 6'd32+1 :
                        (isjal==1) ? 6'd32+2 :
                        (isjalr==1) ? 6'd32+3 : 
                        0;
    assign isJ = isJump;
endmodule
