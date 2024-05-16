module xor_32 (R,A,B);
input [31:0] A,B;
output [31:0] R;

xor xor0(R[0],A[0],B[0]);
xor xor1(R[1],A[1],B[1]);
xor xor2(R[2],A[2],B[2]);
xor xor3(R[3],A[3],B[3]);
xor xor4(R[4],A[4],B[4]);
xor xor5(R[5],A[5],B[5]);
xor xor6(R[6],A[6],B[6]);
xor xor7(R[7],A[7],B[7]);
xor xor8(R[8],A[8],B[8]);
xor xor9(R[9],A[9],B[9]);
xor xor10(R[10],A[10],B[10]);
xor xor11(R[11],A[11],B[11]);
xor xor12(R[12],A[12],B[12]);
xor xor13(R[13],A[13],B[13]);
xor xor14(R[14],A[14],B[14]);
xor xor15(R[15],A[15],B[15]);
xor xor16(R[16],A[16],B[16]);
xor xor17(R[17],A[17],B[17]);
xor xor18(R[18],A[18],B[18]);
xor xor19(R[19],A[19],B[19]);
xor xor20(R[20],A[20],B[20]);
xor xor21(R[21],A[21],B[21]);
xor xor22(R[22],A[22],B[22]);
xor xor23(R[23],A[23],B[23]);
xor xor24(R[24],A[24],B[24]);
xor xor25(R[25],A[25],B[25]);
xor xor26(R[26],A[26],B[26]);
xor xor27(R[27],A[27],B[27]);
xor xor28(R[28],A[28],B[28]);
xor xor29(R[29],A[29],B[29]);
xor xor30(R[30],A[30],B[30]);
xor xor31(R[31],A[31],B[31]);

endmodule