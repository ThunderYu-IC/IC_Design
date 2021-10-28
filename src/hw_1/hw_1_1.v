//Post device of 3
module hw_1_1 (
    input  p1,p2,p3,
    output res
);
assign res = (p1&p2)|(p2&p3)|(p1&p3);
    
endmodule