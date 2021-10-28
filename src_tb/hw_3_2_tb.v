`timescale 1ns / 1ns
module hw_3_2_tb();
    reg clk,rst,key;
    wire [7:0]display;
    
    parameter CYCLE = 20;
    parameter RESET_TIME = 3;

    hw_3_2 hw_3_2_test(
        .clk     (clk),
        .rst     (rst),
        .key     (key),
        .display (display)
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
            #(CYCLE*200);        
            $finish;
        end  

        initial begin
            repeat(10) begin
            #(CYCLE * 3);
            key = 1;
            #CYCLE;
            key = 0;
            end
        end
    //dump fsdb
	initial begin
	$fsdbDumpfile("hw_3_2.fsdb");
	$fsdbDumpvars(0,hw_3_2_test);
	$fsdbDumpon;
	end
endmodule
