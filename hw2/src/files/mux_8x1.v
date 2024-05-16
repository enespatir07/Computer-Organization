module mux_8x1(res, A, B, C, D, E, F, G, H, Sel);
  input [31:0] A, B, C, D, E, F, G, H;
  input [2:0] Sel;
  output [31:0] res;

  wire [31:0] x1, x2, x3, x4, x5, x6;

  mux_2x1 mux1(x1, A, B, Sel[0]);
  mux_2x1 mux2(x2, C, D, Sel[0]);
  mux_2x1 mux3(x3, E, F, Sel[0]);
  mux_2x1 mux4(x4, G, H, Sel[0]);
  mux_2x1 mux5(x5, x1, x2, Sel[1]);
  mux_2x1 mux6(x6, x3, x4, Sel[1]);
  mux_2x1 mux7(res, x5, x6, Sel[2]);

endmodule










module mux_2x1(res,A,B,Sel);
input [31:0] A,B;
input Sel;
output [31:0] res; 


mux_2x1_1bit mux1(res[0],A[0],B[0],Sel);
mux_2x1_1bit mux2(res[1],A[1],B[1],Sel);
mux_2x1_1bit mux3(res[2],A[2],B[2],Sel);
mux_2x1_1bit mux4(res[3],A[3],B[3],Sel);
mux_2x1_1bit mux5(res[4],A[4],B[4],Sel);
mux_2x1_1bit mux6(res[5],A[5],B[5],Sel);
mux_2x1_1bit mux7(res[6],A[6],B[6],Sel);
mux_2x1_1bit mux8(res[7],A[7],B[7],Sel);
mux_2x1_1bit mux9(res[8],A[8],B[8],Sel);
mux_2x1_1bit mux10(res[9],A[9],B[9],Sel);
mux_2x1_1bit mux11(res[10],A[10],B[10],Sel);
mux_2x1_1bit mux12(res[11],A[11],B[11],Sel);
mux_2x1_1bit mux13(res[12],A[12],B[12],Sel);
mux_2x1_1bit mux14(res[13],A[13],B[13],Sel);
mux_2x1_1bit mux15(res[14],A[14],B[14],Sel);
mux_2x1_1bit mux16(res[15],A[15],B[15],Sel);
mux_2x1_1bit mux17(res[16],A[16],B[16],Sel);
mux_2x1_1bit mux18(res[17],A[17],B[17],Sel);
mux_2x1_1bit mux19(res[18],A[18],B[18],Sel);
mux_2x1_1bit mux20(res[19],A[19],B[19],Sel);
mux_2x1_1bit mux21(res[20],A[20],B[20],Sel);
mux_2x1_1bit mux22(res[21],A[21],B[21],Sel);
mux_2x1_1bit mux23(res[22],A[22],B[22],Sel);
mux_2x1_1bit mux24(res[23],A[23],B[23],Sel);
mux_2x1_1bit mux25(res[24],A[24],B[24],Sel);
mux_2x1_1bit mux26(res[25],A[25],B[25],Sel);
mux_2x1_1bit mux27(res[26],A[26],B[26],Sel);
mux_2x1_1bit mux28(res[27],A[27],B[27],Sel);
mux_2x1_1bit mux29(res[28],A[28],B[28],Sel);
mux_2x1_1bit mux30(res[29],A[29],B[29],Sel);
mux_2x1_1bit mux31(res[30],A[30],B[30],Sel);
mux_2x1_1bit mux32(res[31],A[31],B[31],Sel);


endmodule








module mux_2x1_1bit(res, A, B, Sel);
  input A, B;
  input Sel;
  output res;

  wire notS;
  wire AandNotS, BandS;

  not not1(notS, Sel);
  and and1(AandNotS, A, notS);
  and and2(BandS, B, Sel);
  or result(res, AandNotS, BandS);

endmodule