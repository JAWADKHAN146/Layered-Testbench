`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 10:15:27 PM
// Design Name: 
// Module Name: scoreboard
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


class scoreboard;
packet pkt;
mailbox mbx1;
function new(mailbox inp1);
mbx1=inp1;
endfunction
task main;
repeat(1)
begin
mbx1.get(pkt);
if((pkt.reset==1)&&(pkt.d_in==0))
$display("true");
else if((pkt.clk==1)&&(pkt.q==pkt.d_in))
begin
$display("true");
pkt.display("scoreboard");
end
else if((pkt.d_in==1)&&(pkt.q==1))begin
pkt.display("scoreboard");
$display("true");
end
else if((pkt.d_in==0)&&(pkt.q==0))begin
pkt.display("scoreboard");
$display("true");
end
else
$error("fail");
end
endtask
endclass
