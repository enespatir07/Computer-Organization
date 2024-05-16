module mod_32(input wire clk, input wire reset ,output reg [31:0] out,input [31:0] a, b);
    parameter S0=0;
    parameter S1=1;
    parameter S2=2;
    reg [1:0] state;
    reg [1:0] next_state;
    reg [31:0] temp;

    always@(posedge clk) begin
        if(reset) begin
            state <= S0;
            end
        else 
        state <= next_state;
    end


    always @(posedge clk) begin
    case(state)
        S0:begin
        next_state <= S1;
            end
        S1:begin
            if(temp >= b) begin
            next_state <= S1;
            end
            else begin 
            next_state <= S2;
            end
        end
        S2:begin
			next_state <= S2;
		  end
				
            default next_state <= S0;
            endcase

        end




	always @(posedge clk) begin
		 if(state == S0)
				temp <= a;
		  else if(state == S1 && temp >= b)
				temp <= temp -b;
        else if(state == S2)
				out <= temp;
		  
		  end
endmodule