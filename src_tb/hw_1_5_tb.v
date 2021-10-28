`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/27 16:41:51
// Design Name: 
// Module Name: hw_1_5_tb
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


module hw_1_5_tb();
reg [15:0]true_code;
wire [15:0]comp_code;

hw_1_5 hw_1_5_test(
.true_code(true_code),
.comp_code(comp_code)
);

initial begin
true_code = 0;
#10;
true_code = 16'b0111_1111_1111_1111;
#100;
true_code = 16'b1000_0000_0000_0000;
#100;
repeat(5) begin
true_code = $random;
#100;
end
end
endmodule
