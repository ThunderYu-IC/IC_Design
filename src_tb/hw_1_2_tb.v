`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/18 17:56:30
// Design Name: 
// module Name: 
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


module hw_1_2_tb();
    reg     a,b,c,d;
    wire    res;
    
    parameter CYCLE = 20;
    parameter RESET_TIME = 3;

    hw_1_2 hw_1_2_test(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .res(res)
    );
    
        //generate input
        initial begin
            a = 0;
            #(CYCLE*8);
            a = 1;
        end

        initial begin
        repeat(2) begin
            b = 0;
            #(CYCLE*4);
            b = 1;
            #(CYCLE*4);
            end
        end  
        initial begin
        repeat(4) begin
            c = 0;
            #(CYCLE*2);
            c = 1;
            #(CYCLE*2);
            end
        end   
        initial begin
        repeat(8) begin
            d = 0;
            #(CYCLE*1);
            d = 1;
            #(CYCLE*1);
            end
        end  

        //dump fsdb
        initial begin
            $fsdbDumpfile("hw_1_2.fsdb");
            $fsdbDumpvars(0,hw_1_2_test);
            $fsdbDumpon;
            end
endmodule
