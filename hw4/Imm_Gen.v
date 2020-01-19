`timescale 1ns / 1ps
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Imm_Gen(
    instr_i,
    signed_extend_o
    );
               
//I/O ports
input   [32-1:0] instr_i;
output  [64-1:0] signed_extend_o;

//Internal Signals
reg     [64-1:0] signed_extend_o_nxt;

//Sign extended
localparam R_TYPE = 7'b0110011;
localparam I_TYPE = 7'b0010011;
localparam I_TYPE_LD = 7'b0000011;
localparam S_TYPE = 7'b0100011;
localparam B_TYPE = 7'b1100011;
localparam J_TYPE = 7'b1101111;

assign signed_extend_o = signed_extend_o_nxt;

always @ (*) 
begin
	case(instr_i[6:0])
		I_TYPE: //addi slti 
		begin
			signed_extend_o_nxt = {{52{instr_i[31]}}, {instr_i[31:20]}};
		end
		I_TYPE_LD: //ld
		begin
			signed_extend_o_nxt = {{52{instr_i[31]}}, {instr_i[31:20]}};
		end
		S_TYPE: //sd
		begin
			signed_extend_o_nxt = {{52{instr_i[31]}}, {instr_i[31:25]}, {instr_i[11:7]}};
		end
		B_TYPE: //beq
		begin
			signed_extend_o_nxt = {{51{instr_i[31]}},{instr_i[31]},{instr_i[7]},{instr_i[30:25]},{instr_i[11:8]},{1{1'b0}}};
		end
		J_TYPE:
		begin
			signed_extend_o_nxt = {{43{instr_i[31]}},{instr_i[31]},{instr_i[19:12]},{instr_i[20]},{instr_i[30:21]},{1{1'b0}}};
		end
		default:
		begin
			signed_extend_o_nxt = 64'd0;
		end
	endcase
end


          
endmodule      
     