`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 09:21:53 PM
// Design Name: 
// Module Name: D_FF
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module D_FF(input logic clk,reset,
input bit d_in,
output bit q,
output bit q_bar);
always_ff@(posedge clk or posedge reset)
begin
if(reset)
q<=32'b0;
else
q<=d_in;
end
assign q_bar=~q;
endmodule