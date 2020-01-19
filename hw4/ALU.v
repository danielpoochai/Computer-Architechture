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

module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input  [64-1:0]  src1_i;
input  [64-1:0]	 src2_i;
input  [4-1:0]   ctrl_i;

output [64-1:0]	 result_o;
output           zero_o;

//Internal signals
wire   cout;
wire   overflow;
wire   [64-1:0]  result_nxt;

wire   [64-1:0]  cout_nxt;

wire 	z;
wire 	set;

//Parameter
assign zero_o = (result_nxt == 64'd0) ? 1'd1: 1'd0;
assign result_o = result_nxt;

assign cout = ctrl_i == 4'b0111 ? 64'd0 : cout_nxt;
assign overflow = cout_nxt[62] ^ cout_nxt[63];

assign z = 1'd0;
assign set = (overflow == 1'd0) ? (src1_i[63] ^ ~(src2_i[63]) ^ cout_nxt[62]) : ~(src1_i[63] ^ ~(src2_i[63]) ^ cout_nxt[62]);

//Main function
ALU_TOP ALU_TOP0(.src1_i(src1_i[0]), .src2_i(src2_i[0]), .less(set), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(ctrl_i[2]), .operation(ctrl_i[1:0]), .result(result_nxt[0]), 
                  .cout(cout_nxt[0]));
ALU_TOP ALU_TOP1(.src1_i(src1_i[1]), .src2_i(src2_i[1]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[0]), .operation(ctrl_i[1:0]), .result(result_nxt[1]), 
                  .cout(cout_nxt[1]));
ALU_TOP ALU_TOP2(.src1_i(src1_i[2]), .src2_i(src2_i[2]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[1]), .operation(ctrl_i[1:0]), .result(result_nxt[2]), 
                  .cout(cout_nxt[2]));
ALU_TOP ALU_TOP3(.src1_i(src1_i[3]), .src2_i(src2_i[3]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[2]), .operation(ctrl_i[1:0]), .result(result_nxt[3]), 
                  .cout(cout_nxt[3]));
ALU_TOP ALU_TOP4(.src1_i(src1_i[4]), .src2_i(src2_i[4]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[3]), .operation(ctrl_i[1:0]), .result(result_nxt[4]), 
                  .cout(cout_nxt[4]));
ALU_TOP ALU_TOP5(.src1_i(src1_i[5]), .src2_i(src2_i[5]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[4]), .operation(ctrl_i[1:0]), .result(result_nxt[5]), 
                  .cout(cout_nxt[5]));
ALU_TOP ALU_TOP6(.src1_i(src1_i[6]), .src2_i(src2_i[6]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[5]), .operation(ctrl_i[1:0]), .result(result_nxt[6]), 
                  .cout(cout_nxt[6]));
ALU_TOP ALU_TOP7(.src1_i(src1_i[7]), .src2_i(src2_i[7]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[6]), .operation(ctrl_i[1:0]), .result(result_nxt[7]), 
                  .cout(cout_nxt[7]));
ALU_TOP ALU_TOP8(.src1_i(src1_i[8]), .src2_i(src2_i[8]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[7]), .operation(ctrl_i[1:0]), .result(result_nxt[8]), 
                  .cout(cout_nxt[8]));
ALU_TOP ALU_TOP9(.src1_i(src1_i[9]), .src2_i(src2_i[9]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[8]), .operation(ctrl_i[1:0]), .result(result_nxt[9]), 
                  .cout(cout_nxt[9]));
ALU_TOP ALU_TOP10(.src1_i(src1_i[10]), .src2_i(src2_i[10]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[9]), .operation(ctrl_i[1:0]), .result(result_nxt[10]), 
                  .cout(cout_nxt[10]));

ALU_TOP ALU_TOP11(.src1_i(src1_i[11]), .src2_i(src2_i[11]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[10]), .operation(ctrl_i[1:0]), .result(result_nxt[11]), 
                  .cout(cout_nxt[11]));
ALU_TOP ALU_TOP12(.src1_i(src1_i[12]), .src2_i(src2_i[12]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[11]), .operation(ctrl_i[1:0]), .result(result_nxt[12]), 
                  .cout(cout_nxt[12]));
ALU_TOP ALU_TOP13(.src1_i(src1_i[13]), .src2_i(src2_i[13]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[12]), .operation(ctrl_i[1:0]), .result(result_nxt[13]), 
                  .cout(cout_nxt[13]));
ALU_TOP ALU_TOP14(.src1_i(src1_i[14]), .src2_i(src2_i[14]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[13]), .operation(ctrl_i[1:0]), .result(result_nxt[14]), 
                  .cout(cout_nxt[14]));
ALU_TOP ALU_TOP15(.src1_i(src1_i[15]), .src2_i(src2_i[15]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[14]), .operation(ctrl_i[1:0]), .result(result_nxt[15]), 
                  .cout(cout_nxt[15]));
ALU_TOP ALU_TOP16(.src1_i(src1_i[16]), .src2_i(src2_i[16]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[15]), .operation(ctrl_i[1:0]), .result(result_nxt[16]), 
                  .cout(cout_nxt[16]));
ALU_TOP ALU_TOP17(.src1_i(src1_i[17]), .src2_i(src2_i[17]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[16]), .operation(ctrl_i[1:0]), .result(result_nxt[17]), 
                  .cout(cout_nxt[17]));
ALU_TOP ALU_TOP18(.src1_i(src1_i[18]), .src2_i(src2_i[18]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[17]), .operation(ctrl_i[1:0]), .result(result_nxt[18]), 
                  .cout(cout_nxt[18]));
ALU_TOP ALU_TOP19(.src1_i(src1_i[19]), .src2_i(src2_i[19]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[18]), .operation(ctrl_i[1:0]), .result(result_nxt[19]), 
                  .cout(cout_nxt[19]));
ALU_TOP ALU_TOP20(.src1_i(src1_i[20]), .src2_i(src2_i[20]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[19]), .operation(ctrl_i[1:0]), .result(result_nxt[20]), 
                  .cout(cout_nxt[20]));


ALU_TOP ALU_TOP21(.src1_i(src1_i[21]), .src2_i(src2_i[21]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[20]), .operation(ctrl_i[1:0]), .result(result_nxt[21]), 
                  .cout(cout_nxt[21]));
ALU_TOP ALU_TOP22(.src1_i(src1_i[22]), .src2_i(src2_i[22]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[21]), .operation(ctrl_i[1:0]), .result(result_nxt[22]), 
                  .cout(cout_nxt[22]));
ALU_TOP ALU_TOP23(.src1_i(src1_i[23]), .src2_i(src2_i[23]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[22]), .operation(ctrl_i[1:0]), .result(result_nxt[23]), 
                  .cout(cout_nxt[23]));
ALU_TOP ALU_TOP24(.src1_i(src1_i[24]), .src2_i(src2_i[24]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[23]), .operation(ctrl_i[1:0]), .result(result_nxt[24]), 
                  .cout(cout_nxt[24]));
ALU_TOP ALU_TOP25(.src1_i(src1_i[25]), .src2_i(src2_i[25]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[24]), .operation(ctrl_i[1:0]), .result(result_nxt[25]), 
                  .cout(cout_nxt[25]));
ALU_TOP ALU_TOP26(.src1_i(src1_i[26]), .src2_i(src2_i[26]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[25]), .operation(ctrl_i[1:0]), .result(result_nxt[26]), 
                  .cout(cout_nxt[26]));
ALU_TOP ALU_TOP27(.src1_i(src1_i[27]), .src2_i(src2_i[27]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[26]), .operation(ctrl_i[1:0]), .result(result_nxt[27]), 
                  .cout(cout_nxt[27]));
ALU_TOP ALU_TOP28(.src1_i(src1_i[28]), .src2_i(src2_i[28]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[27]), .operation(ctrl_i[1:0]), .result(result_nxt[28]), 
                  .cout(cout_nxt[28]));
ALU_TOP ALU_TOP29(.src1_i(src1_i[29]), .src2_i(src2_i[29]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[28]), .operation(ctrl_i[1:0]), .result(result_nxt[29]), 
                  .cout(cout_nxt[29]));
ALU_TOP ALU_TOP30(.src1_i(src1_i[30]), .src2_i(src2_i[30]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[29]), .operation(ctrl_i[1:0]), .result(result_nxt[30]), 
                  .cout(cout_nxt[30]));

ALU_TOP ALU_TOP31(.src1_i(src1_i[31]), .src2_i(src2_i[31]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[30]), .operation(ctrl_i[1:0]), .result(result_nxt[31]), 
                  .cout(cout_nxt[31]));
ALU_TOP ALU_TOP32(.src1_i(src1_i[32]), .src2_i(src2_i[32]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[31]), .operation(ctrl_i[1:0]), .result(result_nxt[32]), 
                  .cout(cout_nxt[32]));
ALU_TOP ALU_TOP33(.src1_i(src1_i[33]), .src2_i(src2_i[33]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[32]), .operation(ctrl_i[1:0]), .result(result_nxt[33]), 
                  .cout(cout_nxt[33]));
ALU_TOP ALU_TOP34(.src1_i(src1_i[34]), .src2_i(src2_i[34]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[33]), .operation(ctrl_i[1:0]), .result(result_nxt[34]), 
                  .cout(cout_nxt[34]));
ALU_TOP ALU_TOP35(.src1_i(src1_i[35]), .src2_i(src2_i[35]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[34]), .operation(ctrl_i[1:0]), .result(result_nxt[35]), 
                  .cout(cout_nxt[35]));
ALU_TOP ALU_TOP36(.src1_i(src1_i[36]), .src2_i(src2_i[36]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[35]), .operation(ctrl_i[1:0]), .result(result_nxt[36]), 
                  .cout(cout_nxt[36]));
ALU_TOP ALU_TOP37(.src1_i(src1_i[37]), .src2_i(src2_i[37]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[36]), .operation(ctrl_i[1:0]), .result(result_nxt[37]), 
                  .cout(cout_nxt[37]));
ALU_TOP ALU_TOP38(.src1_i(src1_i[38]), .src2_i(src2_i[38]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[37]), .operation(ctrl_i[1:0]), .result(result_nxt[38]), 
                  .cout(cout_nxt[38]));
ALU_TOP ALU_TOP39(.src1_i(src1_i[39]), .src2_i(src2_i[39]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[38]), .operation(ctrl_i[1:0]), .result(result_nxt[39]), 
                  .cout(cout_nxt[39]));
ALU_TOP ALU_TOP40(.src1_i(src1_i[40]), .src2_i(src2_i[40]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[39]), .operation(ctrl_i[1:0]), .result(result_nxt[40]), 
                  .cout(cout_nxt[40]));

ALU_TOP ALU_TOP41(.src1_i(src1_i[41]), .src2_i(src2_i[41]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[40]), .operation(ctrl_i[1:0]), .result(result_nxt[41]), 
                  .cout(cout_nxt[41]));
ALU_TOP ALU_TOP42(.src1_i(src1_i[42]), .src2_i(src2_i[42]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[41]), .operation(ctrl_i[1:0]), .result(result_nxt[42]), 
                  .cout(cout_nxt[42]));
ALU_TOP ALU_TOP43(.src1_i(src1_i[43]), .src2_i(src2_i[43]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[42]), .operation(ctrl_i[1:0]), .result(result_nxt[43]), 
                  .cout(cout_nxt[43]));
ALU_TOP ALU_TOP44(.src1_i(src1_i[44]), .src2_i(src2_i[44]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[43]), .operation(ctrl_i[1:0]), .result(result_nxt[44]), 
                  .cout(cout_nxt[44]));
ALU_TOP ALU_TOP45(.src1_i(src1_i[45]), .src2_i(src2_i[45]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[44]), .operation(ctrl_i[1:0]), .result(result_nxt[45]), 
                  .cout(cout_nxt[45]));
ALU_TOP ALU_TOP46(.src1_i(src1_i[46]), .src2_i(src2_i[46]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[45]), .operation(ctrl_i[1:0]), .result(result_nxt[46]), 
                  .cout(cout_nxt[46]));
ALU_TOP ALU_TOP47(.src1_i(src1_i[47]), .src2_i(src2_i[47]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[46]), .operation(ctrl_i[1:0]), .result(result_nxt[47]), 
                  .cout(cout_nxt[47]));
ALU_TOP ALU_TOP48(.src1_i(src1_i[48]), .src2_i(src2_i[48]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[47]), .operation(ctrl_i[1:0]), .result(result_nxt[48]), 
                  .cout(cout_nxt[48]));
ALU_TOP ALU_TOP49(.src1_i(src1_i[49]), .src2_i(src2_i[49]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[48]), .operation(ctrl_i[1:0]), .result(result_nxt[49]), 
                  .cout(cout_nxt[49]));
ALU_TOP ALU_TOP50(.src1_i(src1_i[50]), .src2_i(src2_i[50]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[49]), .operation(ctrl_i[1:0]), .result(result_nxt[50]), 
                  .cout(cout_nxt[50]));

ALU_TOP ALU_TOP51(.src1_i(src1_i[51]), .src2_i(src2_i[51]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[50]), .operation(ctrl_i[1:0]), .result(result_nxt[51]), 
                  .cout(cout_nxt[51]));
ALU_TOP ALU_TOP52(.src1_i(src1_i[52]), .src2_i(src2_i[52]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[51]), .operation(ctrl_i[1:0]), .result(result_nxt[52]), 
                  .cout(cout_nxt[52]));
ALU_TOP ALU_TOP53(.src1_i(src1_i[53]), .src2_i(src2_i[53]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[52]), .operation(ctrl_i[1:0]), .result(result_nxt[53]), 
                  .cout(cout_nxt[53]));
ALU_TOP ALU_TOP54(.src1_i(src1_i[54]), .src2_i(src2_i[54]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[53]), .operation(ctrl_i[1:0]), .result(result_nxt[54]), 
                  .cout(cout_nxt[54]));
ALU_TOP ALU_TOP55(.src1_i(src1_i[55]), .src2_i(src2_i[55]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[54]), .operation(ctrl_i[1:0]), .result(result_nxt[55]), 
                  .cout(cout_nxt[55]));
ALU_TOP ALU_TOP56(.src1_i(src1_i[56]), .src2_i(src2_i[56]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[55]), .operation(ctrl_i[1:0]), .result(result_nxt[56]), 
                  .cout(cout_nxt[56]));
ALU_TOP ALU_TOP57(.src1_i(src1_i[57]), .src2_i(src2_i[57]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[56]), .operation(ctrl_i[1:0]), .result(result_nxt[57]), 
                  .cout(cout_nxt[57]));
ALU_TOP ALU_TOP58(.src1_i(src1_i[58]), .src2_i(src2_i[58]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[57]), .operation(ctrl_i[1:0]), .result(result_nxt[58]), 
                  .cout(cout_nxt[58]));
ALU_TOP ALU_TOP59(.src1_i(src1_i[59]), .src2_i(src2_i[59]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[58]), .operation(ctrl_i[1:0]), .result(result_nxt[59]), 
                  .cout(cout_nxt[59]));
ALU_TOP ALU_TOP60(.src1_i(src1_i[60]), .src2_i(src2_i[60]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[59]), .operation(ctrl_i[1:0]), .result(result_nxt[60]), 
                  .cout(cout_nxt[60]));


ALU_TOP ALU_TOP61(.src1_i(src1_i[61]), .src2_i(src2_i[61]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[60]), .operation(ctrl_i[1:0]), .result(result_nxt[61]), 
                  .cout(cout_nxt[61]));
ALU_TOP ALU_TOP62(.src1_i(src1_i[62]), .src2_i(src2_i[62]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[61]), .operation(ctrl_i[1:0]), .result(result_nxt[62]), 
                  .cout(cout_nxt[62]));
ALU_TOP ALU_TOP63(.src1_i(src1_i[63]), .src2_i(src2_i[63]), .less(z), .A_invert(ctrl_i[3]), .B_invert(ctrl_i[2]), .cin(cout_nxt[62]), .operation(ctrl_i[1:0]), .result(result_nxt[63]), 
                  .cout(cout_nxt[63]));



endmodule





                    
                    