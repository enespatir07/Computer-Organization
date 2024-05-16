module sub_32(R,Cout,CnMinus1,A,B);

input [31:0] A,B;
output [31:0] R;
output Cout;
output CnMinus1;


wire [31:0] bNot;
not_32 notx(bNot,B);
adder_32 adderx(A,bNot,1'b1,R,Cout);


endmodule











module not_32(R,A);
input [31:0] A;
output [31:0] R;

not not0(R[0],A[0]);
not not1(R[1],A[1]);
not not2(R[2],A[2]);
not not3(R[3],A[3]);
not not4(R[4],A[4]);
not not5(R[5],A[5]);
not not6(R[6],A[6]);
not not7(R[7],A[7]);
not not8(R[8],A[8]);
not not9(R[9],A[9]);
not not10(R[10],A[10]);
not not11(R[11],A[11]);
not not12(R[12],A[12]);
not not13(R[13],A[13]);
not not14(R[14],A[14]);
not not15(R[15],A[15]);
not not16(R[16],A[16]);
not not17(R[17],A[17]);
not not18(R[18],A[18]);
not not19(R[19],A[19]);
not not20(R[20],A[20]);
not not21(R[21],A[21]);
not not22(R[22],A[22]);
not not23(R[23],A[23]);
not not24(R[24],A[24]);
not not25(R[25],A[25]);
not not26(R[26],A[26]);
not not27(R[27],A[27]);
not not28(R[28],A[28]);
not not29(R[29],A[29]);
not not30(R[30],A[30]);
not not31(R[31],A[31]);


endmodule