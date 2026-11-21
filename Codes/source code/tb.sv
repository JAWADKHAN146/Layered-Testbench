`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 11:04:26 PM
// Design Name: 
// Module Name: tb
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


module tb;

     intf vif();

    D_FF dut(
        .clk(vif.clk),
        .reset(vif.reset),
        .d_in(vif.d_in),
        .q(vif.q),
        .q_bar(vif.q_bar)
    );

    test t1(vif);
initial begin
        vif.clk = 0;
        forever #5 vif.clk = ~vif.clk;
    end
     initial begin
        vif.reset=1;
        #12;
        vif.reset=0;
    end
endmodule
