`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/18 17:56:30
// Design Name: 
// Module Name: hw_3_1_tb
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


module hw_3_1_tb();
    reg clk,rst,strobe;
    reg [7:0]din;    
    wire dout;
    
    parameter CYCLE = 20;
    parameter RESET_TIME = 3;

    hw_3_1 hw_3_1_test(
        .clk    (clk),
        .rst    (rst),
        .strobe (strobe),
        .din    (din),
        .dout   (dout)
    );
    
        //clk
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
            #(CYCLE*33);
            $finish;
        end  

        initial begin
            strobe = 0;
            #9;
            strobe = 1;
            din = $random;
            #(CYCLE * RESET_TIME)
            strobe = 0;
            din = $random;
        end
    //dump fsdb
	initial begin
	$fsdbDumpfile("hw_3_1.fsdb");
	$fsdbDumpvars(0,hw_3_1_test);
	$fsdbDumpon;
	end
endmodule
