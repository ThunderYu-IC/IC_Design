//a=1,b=2,c=4,d=5. when a+b+c+d >= 8 ? true
module hw_1_2(
    input a,b,c,d,
    output res
);
wire res_1,res_2;
assign res_1 = ~(a&b&d);
assign res_2 = ~(c&d);
assign res = ~(res_1&res_2);

endmodule