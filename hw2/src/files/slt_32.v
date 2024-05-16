module slt_32(res, A, B, sub_RES);
  output [31:0] res;
  input [31:0] A, B;
  input sub_RES;

  wire temp;
  wire carry_out_less_than;

  and (temp, sub_RES, 1'b1);
  adder_32 slt_func(32'b0, 32'b0, temp, res, carry_out_less_than);
endmodule
