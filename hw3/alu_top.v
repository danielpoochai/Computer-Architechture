`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    alu_top 
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

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout,       //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output        result;
output        cout;

reg           result_nxt;
reg           cout_nxt;
reg           a_in, b_in;


assign result = result_nxt;
assign cout = cout_nxt;


always@(*)
begin
     a_in = src1 ^ A_invert;
     b_in = src2 ^ B_invert;
     result_nxt = result;
     cout_nxt = 1'd0;

     case(operation[1:0])
          2'b00: //AND && NOR
          begin
               result_nxt = a_in & b_in; 
          end
          2'b01: //OR
          begin
               result_nxt = a_in | b_in;
          end
          2'b10: //ADD && SUB
          begin
               result_nxt = a_in ^ b_in ^ cin;
               cout_nxt = (a_in & b_in) | (b_in & cin) | (cin & a_in);

          end
          2'b11: //SLT
          begin
               //sub to ckeck whether less: B_invert = 1'd1
               result_nxt = less;
               cout_nxt = (a_in & b_in) | (b_in & cin) | (cin & a_in);
          end
     endcase
end

endmodule
