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
module Simple_Single_CPU(
        clk_i,
		nrst_i
		);
		
//I/O port
input			clk_i;
input			nrst_i;  // negative reset

//Internal Signles
wire [32-1:0] pc_in_i;
wire [32-1:0] pc_out_o;

wire [32-1:0] add_1_o;
wire [32-1:0] add_2_o;

//instruction
wire [32-1:0] instr_o;

wire [64-1:0] rsdata_o;
wire [64-1:0] rtdata_o;
wire [64-1:0] rddata_i;
wire [64-1:0] jal_data_i;

wire [2-1:0] alu_op_o;
wire regwrite_o;
wire alu_src_o;
wire branch_o;
wire memread_o;
wire memwrite_o;
wire memtoreg_o;
wire jal_o;

wire [4-1:0] alu_ctrl_o;

wire [64-1:0] signed_extend_o;

wire [64-1:0] alu_src_data_o;

wire [64-1:0] result_o;
wire zero_o;
wire [64-1:0] data_mem_data_o;

wire [64-1:0] shift_data_o;
wire [32-1:0] shift_data_o_32;
 
wire pc_mux_select;

wire [6:0] opcode;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

wire [64-1:0] PC_for_Jal;

assign opcode = instr_o[6:0];
assign rs1 = instr_o[19:15];
assign rs2 = instr_o[24:20];
assign rd = instr_o[11:7];
assign PC_for_Jal = {{32{add_1_o[31]}}, add_1_o[31:0]};


assign pc_mux_select = (branch_o & zero_o) | jal_o;
assign shift_data_o_32 = shift_data_o[31:0];

// decoder
//Greate componentes
ProgramCounter PC(
        .clk_i(clk_i),      
	    .nrst_i (nrst_i),     
	    .pc_in_i(pc_in_i),   
	    .pc_out_o(pc_out_o) 
	    );

// adder for program counter
Adder Adder1(
        .src1_i(pc_out_o),     
	    .src2_i(32'd4),     
	    .sum_o(add_1_o)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(pc_out_o),  
	    .instr_o(instr_o)    
	    );
		
Reg_File Registers(
        .clk_i(clk_i),      
	    .nrst_i(nrst_i) ,     
        .RSaddr_i(rs1), //rs1  
        .RTaddr_i(rs2), //rs2  
        .RDaddr_i(rd), //rd  
        .RDdata_i(rddata_i), 
        .RegWrite_i(regwrite_o),
        .RSdata_o(rsdata_o) ,  //rs1 data 
        .RTdata_o(rtdata_o)   //rs2 data
        );
	
Decoder Decoder( //Control
        .instr_op_i(opcode), 
	    .RegWrite_o(regwrite_o), 
	    .ALU_op_o(alu_op_o),   
	    .ALUSrc_o(alu_src_o),      
		.Branch_o(branch_o),
		.MemRead_o(memread_o),
		.MemWrite_o(memwrite_o),
		.MemtoReg_o(memtoreg_o),
		.Jal_o(jal_o)
	    );

ALU_Ctrl AC(
        .funct3_i(instr_o[14:12]),
		.funct7_i(instr_o[31:25]),		
        .ALUOp_i(alu_op_o),   
        .ALUCtrl_o(alu_ctrl_o)
        );
	
Imm_Gen IG(
    .instr_i(instr_o[31:0]),
    .signed_extend_o(signed_extend_o)
    );

MUX_2to1 #(.size(64)) Mux_ALUSrc(
        .data0_i(rtdata_o),
        .data1_i(signed_extend_o),
        .select_i(alu_src_o),
        .data_o(alu_src_data_o)
        );	


ALU ALU(
        .src1_i(rsdata_o),
	    .src2_i(alu_src_data_o),
	    .ctrl_i(alu_ctrl_o),
	    .result_o(result_o),
		.zero_o(zero_o)
	    );
	
Data_Memory Data_Memory(
	.clk_i(clk_i),
	.addr_i(result_o), 
	.data_i(rtdata_o),
	.MemRead_i(memread_o),
	.MemWrite_i(memwrite_o),
	.data_o(data_mem_data_o)
	);

Shift_Left_One_64 Shifter(
        .data_i(signed_extend_o),
        .data_o(shift_data_o)
        ); 		

Adder Adder2(
        .src1_i(pc_out_o),     
	    .src2_i(shift_data_o_32),    
	    .sum_o(add_2_o)      
	    );

MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(add_1_o),
        .data1_i(add_2_o),
        .select_i(pc_mux_select),
        .data_o(pc_in_i)
        );	

MUX_2to1 #(.size(64)) Mux_Write_Back( //parameter size = 64 in MUX
        .data0_i(result_o), 
        .data1_i(data_mem_data_o),
        .select_i(memtoreg_o),
        .data_o(jal_data_i)
        );	

MUX_2to1 #(.size(64)) Mux_Write_Back_with_Jal(
		.data0_i(jal_data_i), 
        .data1_i(PC_for_Jal),
        .select_i(jal_o),
        .data_o(rddata_i)
		);

endmodule
		  


