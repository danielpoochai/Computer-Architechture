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

module ALU_Ctrl(
          funct3_i,
		  funct7_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [3-1:0] funct3_i;
input      [7-1:0] funct7_i;
input      [2-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o_nxt;

//Parameter

//Select exact operation
assign ALUCtrl_o = ALUCtrl_o_nxt;

always @ (*) 
begin
	ALUCtrl_o_nxt = ALUCtrl_o;
	case(ALUOp_i)
		2'b00:
		begin
			case(funct3_i)
				3'b011: //ld sd
				begin
					ALUCtrl_o_nxt = 4'b0010;
				end
				3'b000: //addi
				begin
					ALUCtrl_o_nxt = 4'b0010;
				end
				3'b010: //slti
				begin
					ALUCtrl_o_nxt = 4'b0111;
				end
			endcase
			
		end
		2'b01: //beq
		begin
			ALUCtrl_o_nxt = 4'b0110;
		end
		2'b10: //R-type 
		begin
			case(funct7_i)
				7'b0100000: //sub
				begin
					ALUCtrl_o_nxt = 4'b0110;
				end
				7'b0000000: //add and or
				begin
					case(funct3_i)
						3'b000: //add
						begin
							ALUCtrl_o_nxt = 4'b0010;
						end
						3'b111: //and
						begin
							ALUCtrl_o_nxt = 4'b0000;
						end
						3'b110: //or
						begin
							ALUCtrl_o_nxt = 4'b0001;
						end
						3'b001: //slt
						begin
							ALUCtrl_o_nxt = 4'b0111;
						end
					endcase
				end
			endcase
		end
	endcase
end
endmodule     





                    
                    