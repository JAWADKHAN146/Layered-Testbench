`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 09:50:24 PM
// Design Name: 
// Module Name: driver
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

class driver;
    packet pkt;
    virtual intf vif;
    mailbox mbx;

    function new(virtual intf vi, mailbox inp);
        vif=vi;
        mbx=inp;
    endfunction

    task main;
        repeat(1) begin
            mbx.get(pkt);
            @(negedge vif.clk);
            vif.d_in=pkt.d_in;
            pkt.display("Driver");
        end
    endtask
endclass
