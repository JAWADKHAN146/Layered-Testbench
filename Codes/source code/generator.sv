`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 09:40:43 PM
// Design Name: 
// Module Name: generator
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

class generator;
packet pkt;
mailbox mbx;
function new(mailbox inp);
mbx=inp;
endfunction
task main;
repeat(1)
 begin
 pkt=new;
 assert(pkt.randomize);
 pkt.display("Grnerator");
 mbx.put(pkt);
 end
 endtask
endclass