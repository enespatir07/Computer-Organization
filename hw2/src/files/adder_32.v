`timescale 1ns / 1ps
module adder_32(a,b, cin, sum,cout);
input [31:0] a,b;
input cin;
output [31:0] sum;
output cout;
wire c1,c2,c3,c4,c5,c6,c7;

adder_4 cla1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1));
adder_4 cla2 (.a(a[7:4]), .b(b[7:4]), .cin(c1), .sum(sum[7:4]), .cout(c2));
adder_4 cla3(.a(a[11:8]), .b(b[11:8]), .cin(c2), .sum(sum[11:8]), .cout(c3));
adder_4 cla4(.a(a[15:12]), .b(b[15:12]), .cin(c3), .sum(sum[15:12]), .cout(c4));
adder_4 cla5 (.a(a[19:16]), .b(b[19:16]), .cin(c4), .sum(sum[19:16]), .cout(c5));
adder_4 cla6 (.a(a[23:20]), .b(b[23:20]), .cin(c5), .sum(sum[23:20]), .cout(c6));
adder_4 cla7(.a(a[27:24]), .b(b[27:24]), .cin(c6), .sum(sum[27:24]), .cout(c7));
adder_4 cla8(.a(a[31:28]), .b(b[31:28]), .cin(c7), .sum(sum[31:28]), .cout(cout));

endmodule





module adder_4(a,b, cin, sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;

wire [3:0] p,g,c;

xor xor_1(p[0],a[0],b[0]);
xor xor_2(p[1],a[1],b[1]);
xor xor_3(p[2],a[2],b[2]);
xor xor_4(p[3],a[3],b[3]);

and and__1(g[0],a[0],b[0]);
and and__2(g[1],a[1],b[1]);
and and__3(g[2],a[2],b[2]);
and and__4(g[3],a[3],b[3]);



or my_or(c[0],cin,0);

and and_1(a1,p[0],cin); 
or or_2(c[1],g[0],a1);       //  c[1]= g[0]|(p[0]&c[0]);

and  and_2(a2,p[1],g[0]);
and_4input and_3(a3,p[1],p[0],cin,1);
or_4input  or_3(c[2],g[1],a2,a3,0);  //c[2]= g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];


and  and_4(a4,p[2],g[1]);
and_4input and_5(a5,p[2],p[1],g[0],1);
and_4input and_7(a6,p[2],p[1],p[0],cin);
or_4input  or_5(c[3],g[2],a4,a5,a6);  //c[3]= g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];


and and_8(a7,p[3],g[2]);
and_4input and_9(a8,p[3],p[2],g[1],1);
and_4input and_10(a9,p[3],p[2],p[1],g[0]);
and_4input and_11(a10,p[3],p[2],p[1],p[0]);
and  and_12(a11,a10,cin);
or_4input  or_6(a12,a7,a8,a9,a11);
or   or_7(cout,g[3],a12);     //cout= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&c[0];




xor xor_5(sum[0],p[0],c[0]);
xor xor_6(sum[1],p[1],c[1]);
xor xor_7(sum[2],p[2],c[2]);
xor xor_8(sum[3],p[3],c[3]);

endmodule










module or_4input(output res, input a1, a2, a3, a4);
    wire intermediate_result1, intermediate_result2, intermediate_result3;

    // Implementing 2-input OR gates
    or gate1 (intermediate_result1, a1, a2);
    or gate2 (intermediate_result2, a3, a4);

    // Implementing another 2-input OR gate using the previous results
    or gate3 (res, intermediate_result1, intermediate_result2);
endmodule



module and_4input(output res, input a1, a2, a3, a4);
    wire intermediate_result1, intermediate_result2, intermediate_result3;

    // Implementing 2-input AND gates
    and gate1 (intermediate_result1, a1, a2);
    and gate2 (intermediate_result2, a3, a4);

    // Implementing another 2-input AND gate using the previous results
    and gate3 (res, intermediate_result1, intermediate_result2);

endmodule