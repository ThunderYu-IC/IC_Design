`timescale 1ns / 1ns
module hw_3_3_tb();
    reg clk,rst;
    reg din;
    wire strobe;
    wire [3:0]dout;
    reg [8:0]seq;

    always @(posedge clk) begin
        seq <= {seq[7:0],seq[8]};
        din <= seq[8];
    end

    parameter CYCLE = 20;
    parameter RESET_TIME = 3;

    hw_3_3 hw_3_3_test(
        .clk     (clk),
        .rst     (rst),
        .din     (din),
        .strobe  (strobe),
        .dout    (dout)
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
            #(CYCLE * 5)
            seq = 9'b1010_0100_0;
            #(CYCLE* 10)
            seq = 9'b1010_0100_1;
        end

    //dump fsdb
	initial begin
	$fsdbDumpfile("hw_3_3.fsdb");
	$fsdbDumpvars(0,hw_3_3_test);
	$fsdbDumpon;
	end
endmodule
