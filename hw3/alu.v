`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    
// Design Name:
// Module Name:    alu
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu(
		rst_n,         // negative reset            (input)
            src1,          // 32 bits source 1          (input)
            src2,          // 32 bits source 2          (input)
            ALU_control,   // 4 bits ALU control input  (input)
            result,        // 32 bits result            (output)
            zero,          // 1 bit when the output is 0, zero must be set (output)
            cout,          // 1 bit carry out           (output)
            overflow       // 1 bit overflow            (output)
            );
input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;

output [32-1:0] result;
output zero;
output cout;
output overflow;

//output reg
reg zero_nxt;
wire [31:0] result_nxt;
wire [31:0] cout_nxt;
reg cout_next;

wire z;
wire set;



//assign output
assign zero = (result_nxt == 32'd0) ? 1'd1: 1'd0;
assign result = result_nxt;
assign cout = ALU_control == 4'b0111 ? 32'd0 : cout_nxt;
assign overflow = cout_nxt[30] ^ cout_nxt[31];

assign z = 1'd0;
assign set = (overflow == 1'd0) ? (src1[31] ^ ~(src2[31]) ^ cout_nxt[30]) : ~(src1[31] ^ ~(src2[31]) ^ cout_nxt[30]);

//generate
// genvar idx;
// generate
//       for(idx = 0; idx <32; idx = idx + 1)
//       begin
//             alu_top alu_top();
//       end
// endgenerate


//one-bit alu
alu_top alu_top0(.src1(src1[0]), .src2(src2[0]), .less(set), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(ALU_control[2]), .operation(ALU_control[1:0]), .result(result_nxt[0]), 
                  .cout(cout_nxt[0]));
alu_top alu_top1(.src1(src1[1]), .src2(src2[1]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[0]), .operation(ALU_control[1:0]), .result(result_nxt[1]), 
                  .cout(cout_nxt[1]));
alu_top alu_top2(.src1(src1[2]), .src2(src2[2]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[1]), .operation(ALU_control[1:0]), .result(result_nxt[2]), 
                  .cout(cout_nxt[2]));
alu_top alu_top3(.src1(src1[3]), .src2(src2[3]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[2]), .operation(ALU_control[1:0]), .result(result_nxt[3]), 
                  .cout(cout_nxt[3]));
alu_top alu_top4(.src1(src1[4]), .src2(src2[4]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[3]), .operation(ALU_control[1:0]), .result(result_nxt[4]), 
                  .cout(cout_nxt[4]));
alu_top alu_top5(.src1(src1[5]), .src2(src2[5]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[4]), .operation(ALU_control[1:0]), .result(result_nxt[5]), 
                  .cout(cout_nxt[5]));
alu_top alu_top6(.src1(src1[6]), .src2(src2[6]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[5]), .operation(ALU_control[1:0]), .result(result_nxt[6]), 
                  .cout(cout_nxt[6]));
alu_top alu_top7(.src1(src1[7]), .src2(src2[7]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[6]), .operation(ALU_control[1:0]), .result(result_nxt[7]), 
                  .cout(cout_nxt[7]));
alu_top alu_top8(.src1(src1[8]), .src2(src2[8]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[7]), .operation(ALU_control[1:0]), .result(result_nxt[8]), 
                  .cout(cout_nxt[8]));
alu_top alu_top9(.src1(src1[9]), .src2(src2[9]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[8]), .operation(ALU_control[1:0]), .result(result_nxt[9]), 
                  .cout(cout_nxt[9]));
alu_top alu_top10(.src1(src1[10]), .src2(src2[10]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[9]), .operation(ALU_control[1:0]), .result(result_nxt[10]), 
                  .cout(cout_nxt[10]));

alu_top alu_top11(.src1(src1[11]), .src2(src2[11]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[10]), .operation(ALU_control[1:0]), .result(result_nxt[11]), 
                  .cout(cout_nxt[11]));
alu_top alu_top12(.src1(src1[12]), .src2(src2[12]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[11]), .operation(ALU_control[1:0]), .result(result_nxt[12]), 
                  .cout(cout_nxt[12]));
alu_top alu_top13(.src1(src1[13]), .src2(src2[13]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[12]), .operation(ALU_control[1:0]), .result(result_nxt[13]), 
                  .cout(cout_nxt[13]));
alu_top alu_top14(.src1(src1[14]), .src2(src2[14]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[13]), .operation(ALU_control[1:0]), .result(result_nxt[14]), 
                  .cout(cout_nxt[14]));
alu_top alu_top15(.src1(src1[15]), .src2(src2[15]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[14]), .operation(ALU_control[1:0]), .result(result_nxt[15]), 
                  .cout(cout_nxt[15]));
alu_top alu_top16(.src1(src1[16]), .src2(src2[16]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[15]), .operation(ALU_control[1:0]), .result(result_nxt[16]), 
                  .cout(cout_nxt[16]));
alu_top alu_top17(.src1(src1[17]), .src2(src2[17]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[16]), .operation(ALU_control[1:0]), .result(result_nxt[17]), 
                  .cout(cout_nxt[17]));
alu_top alu_top18(.src1(src1[18]), .src2(src2[18]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[17]), .operation(ALU_control[1:0]), .result(result_nxt[18]), 
                  .cout(cout_nxt[18]));
alu_top alu_top19(.src1(src1[19]), .src2(src2[19]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[18]), .operation(ALU_control[1:0]), .result(result_nxt[19]), 
                  .cout(cout_nxt[19]));
alu_top alu_top20(.src1(src1[20]), .src2(src2[20]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[19]), .operation(ALU_control[1:0]), .result(result_nxt[20]), 
                  .cout(cout_nxt[20]));


alu_top alu_top21(.src1(src1[21]), .src2(src2[21]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[20]), .operation(ALU_control[1:0]), .result(result_nxt[21]), 
                  .cout(cout_nxt[21]));
alu_top alu_top22(.src1(src1[22]), .src2(src2[22]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[21]), .operation(ALU_control[1:0]), .result(result_nxt[22]), 
                  .cout(cout_nxt[22]));
alu_top alu_top23(.src1(src1[23]), .src2(src2[23]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[22]), .operation(ALU_control[1:0]), .result(result_nxt[23]), 
                  .cout(cout_nxt[23]));
alu_top alu_top24(.src1(src1[24]), .src2(src2[24]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[23]), .operation(ALU_control[1:0]), .result(result_nxt[24]), 
                  .cout(cout_nxt[24]));
alu_top alu_top25(.src1(src1[25]), .src2(src2[25]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[24]), .operation(ALU_control[1:0]), .result(result_nxt[25]), 
                  .cout(cout_nxt[25]));
alu_top alu_top26(.src1(src1[26]), .src2(src2[26]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[25]), .operation(ALU_control[1:0]), .result(result_nxt[26]), 
                  .cout(cout_nxt[26]));
alu_top alu_top27(.src1(src1[27]), .src2(src2[27]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[26]), .operation(ALU_control[1:0]), .result(result_nxt[27]), 
                  .cout(cout_nxt[27]));
alu_top alu_top28(.src1(src1[28]), .src2(src2[28]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[27]), .operation(ALU_control[1:0]), .result(result_nxt[28]), 
                  .cout(cout_nxt[28]));
alu_top alu_top29(.src1(src1[29]), .src2(src2[29]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[28]), .operation(ALU_control[1:0]), .result(result_nxt[29]), 
                  .cout(cout_nxt[29]));
alu_top alu_top30(.src1(src1[30]), .src2(src2[30]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[29]), .operation(ALU_control[1:0]), .result(result_nxt[30]), 
                  .cout(cout_nxt[30]));

alu_top alu_top31(.src1(src1[31]), .src2(src2[31]), .less(z), .A_invert(ALU_control[3]), .B_invert(ALU_control[2]), .cin(cout_nxt[30]), .operation(ALU_control[1:0]), .result(result_nxt[31]), 
                  .cout(cout_nxt[31]));


endmodule
