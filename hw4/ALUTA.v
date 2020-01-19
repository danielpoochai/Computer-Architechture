//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALUTA(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input signed [64-1:0]  src1_i;
input signed [64-1:0]  src2_i;
input  [4-1:0]   ctrl_i;

output signed [64-1:0]	 result_o;
output           zero_o;

//Internal signals
reg  signed  [64-1:0]  result_o;
wire             zero_o;	

//Parameter
parameter  ALU_AND  = 4'b0000;
parameter  ALU_OR   = 4'b0001;
parameter  ALU_ADD  = 4'b0010;
parameter  ALU_SUB  = 4'b0110;
parameter  ALU_NOR  = 4'b1100;
parameter  ALU_SLT	= 4'b0111;

//Main function
assign zero_o = (result_o == 0); //if result_o == 0

always @(ctrl_i, src1_i, src2_i) begin
  case (ctrl_i)
    ALU_AND : result_o <= src1_i & src2_i;
    ALU_OR  : result_o <= src1_i | src2_i;
    ALU_ADD : result_o <= src1_i + src2_i;
    ALU_SUB : result_o <= src1_i - src2_i;
    ALU_NOR : result_o <= ~(src1_i & src2_i);
    ALU_SLT : result_o <= (src1_i < src2_i) ? 1 : 0;
    default : result_o <= 0;
  endcase
end


endmodule





                    
                    