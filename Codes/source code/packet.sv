`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 09:29:34 PM
// Design Name: 
// Module Name: packet
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


class packet;
rand bit d_in;
logic q,q_bar;
logic reset,clk;

function void display(string name);
$display("----------------------");
$display("%s",name);
$display("----------------------");
$display("d_in=%b",d_in);
$display("q =%b, q_bar=%b",q,q_bar);
$display("----------------------");
endfunction
endclass
