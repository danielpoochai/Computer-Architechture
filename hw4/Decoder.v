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

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	Branch_o,
	MemRead_o,
	MemWrite_o,
	MemtoReg_o,
	Jal_o

	);
     
//I/O ports
input	[7-1:0]	instr_op_i;

output			RegWrite_o;
output	[2-1:0]	ALU_op_o;
output			ALUSrc_o;
output			Branch_o;
output			MemRead_o;
output			MemWrite_o;
output			MemtoReg_o;
output			Jal_o;


//Internal Signals
reg	[2-1:0]		ALU_op_o_nxt;
reg				ALUSrc_o_nxt;
reg				RegWrite_o_nxt;
reg				Branch_o_nxt;
reg				MemRead_o_nxt;
reg				MemWrite_o_nxt;
reg				MemtoReg_o_nxt;
reg             Jal_o_nxt;


assign RegWrite_o = RegWrite_o_nxt;
assign ALU_op_o = ALU_op_o_nxt;
assign ALUSrc_o = ALUSrc_o_nxt;
assign Branch_o = Branch_o_nxt;
assign MemRead_o = MemRead_o_nxt;
assign MemWrite_o = MemWrite_o_nxt;
assign MemtoReg_o = MemtoReg_o_nxt;
assign Jal_o = Jal_o_nxt;

//Parameter
localparam R_TYPE = 7'b0110011;
localparam I_TYPE = 7'b0010011;
localparam I_TYPE_LD = 7'b0000011;
localparam S_TYPE = 7'b0100011;
localparam B_TYPE = 7'b1100011;
localparam J_TYPE = 7'b1101111;

//Main function
always @ (*) begin

	ALU_op_o_nxt = ALU_op_o;
	Branch_o_nxt = Branch_o;
	MemRead_o_nxt = MemRead_o;
	MemtoReg_o_nxt = MemtoReg_o;
	MemWrite_o_nxt = MemWrite_o;
	ALUSrc_o_nxt = ALUSrc_o;
	RegWrite_o_nxt = RegWrite_o;
	Jal_o_nxt = Jal_o;

	case(instr_op_i)
		R_TYPE: //add sub and or slt
		begin
			ALU_op_o_nxt = 2'b10;

			Branch_o_nxt = 1'b0;
			MemRead_o_nxt = 1'b0;
			MemtoReg_o_nxt = 1'b0;
			MemWrite_o_nxt = 1'b0;
			ALUSrc_o_nxt = 1'b0;
			RegWrite_o_nxt = 1'b1;
			Jal_o_nxt = 1'b0;
		end
		I_TYPE: //addi slti
		begin
			ALU_op_o_nxt = 2'b00;

			Branch_o_nxt = 1'b0;
			MemRead_o_nxt = 1'b0;
			MemtoReg_o_nxt = 1'b0;
			MemWrite_o_nxt = 1'b0;
			ALUSrc_o_nxt = 1'b1;
			RegWrite_o_nxt = 1'b1;
			Jal_o_nxt = 1'b0;
		end

		I_TYPE_LD: //ld
		begin
			ALU_op_o_nxt = 2'b00;

			Branch_o_nxt = 1'b0;
			MemRead_o_nxt = 1'b1;
			MemtoReg_o_nxt = 1'b1;
			MemWrite_o_nxt = 1'b0;
			ALUSrc_o_nxt = 1'b1;
			RegWrite_o_nxt = 1'b1;
			Jal_o_nxt = 1'b0;
		end

		S_TYPE: //sd
		begin
			ALU_op_o_nxt = 2'b00;

			Branch_o_nxt = 1'b0;
			MemRead_o_nxt = 1'b0;
			MemtoReg_o_nxt = 1'b0;
			MemWrite_o_nxt = 1'b1;
			ALUSrc_o_nxt = 1'b1;
			RegWrite_o_nxt = 1'b0;
			Jal_o_nxt = 1'b0;
		end

		B_TYPE: //beq
		begin
			ALU_op_o_nxt = 2'b01;

			Branch_o_nxt = 1'b1;
			MemRead_o_nxt = 1'b0;
			MemtoReg_o_nxt = 1'b0;
			MemWrite_o_nxt = 1'b0;
			ALUSrc_o_nxt = 1'b0;
			RegWrite_o_nxt = 1'b0;
			Jal_o_nxt = 1'b0;
		end

		J_TYPE: //jal
		begin
			ALU_op_o_nxt = ALU_op_o;

			Branch_o_nxt = Branch_o;
			MemRead_o_nxt = MemRead_o;
			MemtoReg_o_nxt = MemtoReg_o;
			MemWrite_o_nxt = MemtoReg_o;
			ALUSrc_o_nxt = ALUSrc_o;
			RegWrite_o_nxt = RegWrite_o;
			Jal_o_nxt = 1'b1;
		end

	endcase
end

endmodule





                    
                    