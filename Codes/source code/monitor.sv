`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 10:05:28 PM
// Design Name: 
// Module Name: monitor
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


class monitor;
packet pkt;
virtual intf vif;
mailbox mbx1;
function new(virtual intf vi,mailbox inp1);
vif=vi;
mbx1=inp1;
endfunction
task main;
repeat(1)
#3
begin
pkt=new;
pkt.d_in=vif.d_in;
pkt.q=vif.q;
pkt.q_bar=vif.q_bar;
mbx1.put(pkt);
pkt.display("monitor");
end
endtask
endclass
