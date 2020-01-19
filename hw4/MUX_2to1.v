`timescale 1ns / 1ps
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Luke
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
     
module MUX_2to1(
               data0_i,
               data1_i,
               select_i,
               data_o
               );

parameter size = 0;			   
			
//I/O ports               
input   [size-1:0] data0_i;          
input   [size-1:0] data1_i;
input              select_i;
output  [size-1:0] data_o; 

//Internal Signals
reg     [size-1:0] data_o_nxt;

assign data_o = data_o_nxt;

//Main function
always@ (*)
begin
	case(select_i)
		1'b0:
		begin
			data_o_nxt = data0_i;
		end
		1'b1:
		begin
			data_o_nxt = data1_i;
		end
	endcase
end

endmodule      
          
          