`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/18 17:56:30
// Design Name: 
// Module Name: hw_2_3_tb
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


module hw_2_3_tb();
    reg CLK,RST;    
    wire SEQ_OUT;
    
    parameter CYCLE = 20;
    parameter RESET_TIME = 3;

    hw_2_3 hw_2_3_test(
        .CLK    (CLK),
        .RST  (RST),
        .SEQ_OUT  (SEQ_OUT)
    );
    
        //CLK
        initial begin 
            CLK = 0;
            forever
            #(CYCLE/2)
            CLK = ~CLK;
        end
            
        //RESET
        initial begin
            RST = 0;
            #3;
            RST = 1;
            #(CYCLE * RESET_TIME)
            RST = 0;
            #(CYCLE*33);
            $finish;
        end  
    //dump fsdb
	initial begin
	$fsdbDumpfile("hw_2_3.fsdb");
	$fsdbDumpvars(0,hw_2_3_test);
	$fsdbDumpon;
	end
endmodule
