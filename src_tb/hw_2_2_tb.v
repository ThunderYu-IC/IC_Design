`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/18 12:47:38
// Design Name: 
// Module Name: hw_2_2_tb
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


module hw_2_2_tb();
    reg CLK,RST;
    reg DATA_IN;
    wire SIG_OUT;
    
    parameter CYCLE = 20;
    parameter RESET_TIME = 3;

    hw_2_2 hw_2_2_test(
        .CLK    (CLK),
        .RST  (RST),
        .DATA_IN  (DATA_IN),
        .SIG_OUT  (SIG_OUT)
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
            #(CYCLE*50);
            $finish;
        end  
        
        
        initial begin
        #3;
        repeat (2) begin  
            #CYCLE ;
            DATA_IN = 0;
        end
        repeat(5) begin
          #CYCLE;
          DATA_IN = 1;
          end
          #CYCLE;
          DATA_IN = 0;      
        end

    //dump fsdb
	initial begin
	$fsdbDumpfile("hw_2_2.fsdb");
	$fsdbDumpvars(0,hw_2_2_test);
	$fsdbDumpon;
	end        
endmodule
