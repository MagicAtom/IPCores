/*
4 * 4-bit CLA --> 2 * 16-bit CLA --> 32-bit CLA
*/
module Adder1(
	input A,
	input B,
	input cin,
	output S,
	output G,
	output P);
	
	assign S = A ^ B ^ cin;
	assign G = A & B;
	assign P = A | B;
endmodule

module CLA4(
	input [3:0] P,
	input [3:0] G,
	input cin,
	output [3:0] c,
	output Gout,
	output Pout);
	
	assign c[0] = G[0] | (P[0] & cin);
	assign c[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
	assign c[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
	assign c[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |
			 (P[3] & P[2] & P[1] & P[0] & cin);
	assign Gout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
	assign Pout = P[3] & P[2] & P[1] & P[0];
endmodule

module Adder4(
	input [3:0] A,
	input [3:0] B,
	input cin,
	output [3:0] S,
	output Gout,
	output Pout,
	output cout);

	wire [3:0] G;
	wire [3:0] P;
	wire [3:0] c;
	CLA4 c0(
		.P(P),
		.G(G),
		.cin(cin),
		.c(c),
		.Gout(Gout),
		.Pout(Pout));
	Adder1 a1(
		.A(A[0]),
		.B(B[0]),
		.cin(cin),
		.S(S[0]),
		.G(G[0]),
		.P(P[0]));
	genvar i;
	generate
		for(i = 1; i <= 3; i = i+1) begin: adder_gen
			Adder1 ai(
			.A(A[i]),
			.B(B[i]),
			.cin(c[i-1]),
			.S(S[i]),
			.G(G[i]),
			.P(P[i]));
		end
	endgenerate
	assign cout = c[3];
endmodule

module Adder16(
	input [15:0] A,
	input [15:0] B,
	input cin,
	output [15:0] S,
	output Gout,
	output Pout,
	output cout);

	wire [3:0] G;
	wire [3:0] P;
	wire [3:0] c;
	CLA4 c0(
		.P(P),
		.G(G),
		.cin(cin),
		.c(c),
		.Gout(Gout),
		.Pout(Pout));
	Adder4 a2(
		.A(A[3:0]),
		.B(B[3:0]),
		.cin(cin),
		.S(S[3:0]),
		.Gout(G[0]),
		.Pout(P[0]));
	genvar i;
	generate
		for(i = 1; i <= 3; i = i+1) begin: adder4_gen
			Adder4 a4(
			.A(A[4*i+3:4*i]),
			.B(B[4*i+3:4*i]),
			.cin(c[i-1]),
			.S(S[4*i+3:4*i]),
			.Gout(G[i]),
			.Pout(P[i]));
		end
	endgenerate
	assign cout = c[3];
endmodule

//(cin == 1)? A-B : A+B
module Adder32(
	input [31:0] A,
	input [31:0] B,
	input cin,
	output [31:0] S,
	output cout,
	output CF,
	output ZF,
	output OF,
	output SF);

	assign SF = S[31];
	assign ZF = ~|S;
	assign CF = cout ^ cin;
	wire [31:0] B_in;
	wire [31:0] B_sb;
	assign B_in = (cin==1)? (~B[31:0]) : B[31:0];
	assign B_sb = B_in + 1;
	assign OF = (A[31]==B_sb[31]) && (S[31]!=A[31]);
	wire [1:0] G;
	wire [1:0] P;
	wire ci;
	Adder16 add16_1(
	.A(A[15:0]),
	.B(B_in[15:0]),
	.cin(cin),
	.S(S[15:0]),
	.Gout(G[0]),
	.Pout(P[0]));
	Adder16 add16_2(
	.A(A[31:16]),
	.B(B_in[31:16]),
	.cin(ci),
	.S(S[31:16]),
	.Gout(G[1]),
	.Pout(P[1]));
	assign ci = G[0] | P[0] & cin;
	assign cout = G[1] | P[1] & G[0] | P[1] & P[0] & cin;
endmodule
