module alu_32(res, A, B, Alu_Op, clock, reset);

  input [31:0] A, B;
  input [2:0] Alu_Op;
  output [31:0] res;
  input wire clock, reset;

  wire [3:0] unused_signals; 
  wire out_SLT;
  wire [31:0] out_NOR,out_OR,out_SUB, out_MOD,out_AND, out_XOR, out_ADD;

  sub_32 subx(out_SUB, unused_signals[2], unused_signals[3], A, B);
  and_32 andx(out_AND, A, B);
  adder_32 adderx(A,B,0,out_ADD,unused_signals[2]);
  nor_32 norx(out_NOR, A, B);
  mod_32 modx(clock, reset, out_MOD, A, B);
  or_32 orx(out_OR, A, B);
  xor_32 xorx(out_XOR, A, B);
  slt_32 sltx(out_SLT, A, B,out_SUB[31]);

  mux_8x1 mux(res, out_AND, out_OR, out_XOR, out_NOR, {32{out_SLT}}, out_ADD, out_SUB, out_MOD, Alu_Op);

endmodule