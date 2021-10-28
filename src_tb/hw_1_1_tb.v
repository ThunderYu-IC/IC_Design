`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/18 17:56:30
// Design Name: 
// Module Name: 
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


module hw_1_1_tb();
    reg     p1,p2,p3;   //input
    wire    res;        //output
    
    parameter CYCLE = 20;
    parameter RESET_TIME = 3;

    hw_1_1 hw_1_1_test(
        .p1(p1),
        .p2(p2),
        .p3(p3),
        .res(res)
    );
        //generate input
        initial begin
            p1 = 0;
            #(CYCLE*4);
            p1 = 1;
        end

        initial begin
        repeat(2) begin
            p2 = 0;
            #(CYCLE*2);
            p2 = 1;
            #(CYCLE*2);
            end
        end  
        initial begin
        repeat(4) begin
            p3 = 0;
            #(CYCLE*1);
            p3 = 1;
            #(CYCLE*1);
            end
        end   
        //dump fsdb
        initial begin
            $fsdbDumpfile("hw_1_1.fsdb");
            $fsdbDumpvars(0,hw_1_1_test);
            $fsdbDumpon;
            end
endmodule
