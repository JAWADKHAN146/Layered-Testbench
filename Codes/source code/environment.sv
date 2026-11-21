`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 10:29:52 PM
// Design Name: 
// Module Name: environment
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

`include "packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
generator gen;
driver div;
monitor mon;
scoreboard scb;
mailbox m1;
mailbox m2;
virtual intf vif;
function new(virtual intf vi);
vif=vi;
m1=new();
m2=new();
gen=new(m1);
div=new(vi,m1);
mon=new(vi,m2);
scb=new(m2);
endfunction
task test();
fork
gen.main();
div.main();
mon.main();
scb.main();
join
endtask
task run;
test();
$finish;
endtask
endclass
