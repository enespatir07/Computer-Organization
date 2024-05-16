`timescale 1ns/1ns

module testbench();

  reg [31:0] A, B;
  wire [31:0] res;
  reg [2:0] Alu_Op;
  reg clock, reset;
  


  alu_32 alu_xyz(res,A,B,Alu_Op,clock,reset);



  initial begin
    A = 32'b00000000000000000000000000000000;
    B = 32'b11111111111111111111111111111111;
    Alu_Op = 3'b000;                         // And
    #10;
	 
 $display ("A = %b, B = %b, res = %b, Alu_Op = %b => And", A,B,res,Alu_Op);
    
    A = 32'b00000000000000000000000000000000;
    B = 32'b11111111111111111111111111111111;
    Alu_Op = 3'b001;								   //  Or
    #10;
	 
 $display ("A = %b, B = %b, res = %b, Alu_Op = %b => Or", A,B,res,Alu_Op);

    A = 32'b00000000000000000000000000000000;
    B = 32'b11111111111111111111111111111111;
    Alu_Op = 3'b010;								   //  Xor	
    #10;
	 
 $display ("A = %b, B = %b, res = %b, Alu_Op = %b => Xor", A,B,res,Alu_Op);

    A = 32'b00000000000000000000000000000000;
    B = 32'b11111111111111111111111111111111;
    Alu_Op = 3'b011;               			   // Nor
    #10;
 $display ("A = %b, B = %b, res = %b, Alu_Op = %b => Nor", A,B,res,Alu_Op);

    A = 32'b00000000000000000000000000000001;
    B = 32'b00000000000000000000000000000011;
    Alu_Op = 3'b100; 								// Slt
    #10;
 $display ("A = %b, B = %b, res = %b, Alu_Op = %b => Slt", A,B,res[0],Alu_Op);
    
	 A = 32'b00000000000000000000000000000011;
    B = 32'b00000000000000000000000000000011;
    Alu_Op = 3'b101;									// Add
    #10;
 $display ("A = %b, B = %b, res = %b, Alu_Op = %b => Add", A,B,res,Alu_Op);
    
	 A = 32'b00000000000000000000000000000101;
    B = 32'b00000000000000000000000000000011;
    Alu_Op = 3'b110;									// Sub
    #10;
 $display ("A = %b, B = %b, res = %b, Alu_Op = %b => Sub", A,B,res,Alu_Op);
 
	reset = 1;
	 #10
	 reset = 0;
	 clock = 0;
	 #10
	 A = 13;
    B = 5;
    Alu_Op = 3'b111;                         //	Mod
    #1000;
	 $display ("A = %b, B = %b, res = %b, Alu_Op = %b => Mod", A,B,res,Alu_Op);
    $stop;
  end

  // Clock generation
  always #10 clock = ~clock;

  // Monitor block to display ress


endmodule