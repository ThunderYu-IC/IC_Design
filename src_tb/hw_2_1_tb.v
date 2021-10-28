`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/18 10:58:26
// Design Name: 
// Module Name: hw_2_1
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

module hw_2_1_tb();
    reg clk;
    reg rst;
    
    wire clk_1,clk_2;
    
    parameter CYCLE = 20;
    parameter RESET_TIME = 3;
    
    hw_2_1 hw_2_1_test(
        .CLK    (clk),
        .RESET  (rst),
        .CLK_1  (clk_1),
        .CLK_2  (clk_2)
    );
    
        //CLK
        initial begin 
            clk = 0;
            forever
            #(CYCLE/2)
            clk = ~clk;
        end
            
        //RESET
        initial begin
            rst = 0;
            #3;
            rst = 1;
            #(CYCLE * RESET_TIME)
            rst = 0;
            #(CYCLE*22);
            $finish;
        end       

    //dump fsdb
	initial begin
	$fsdbDumpfile("hw_2_1.fsdb");
	$fsdbDumpvars(0,hw_2_1_test);
	$fsdbDumpon;
	end  
    
endmodule
