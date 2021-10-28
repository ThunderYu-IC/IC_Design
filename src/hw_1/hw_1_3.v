module hw_1_3( 
     input      [2:0]abc,en,
     output reg [2:0]abc_out
);
always@(abc or en)
    if(!en)
        abc_out = 3'b0;
    else
        abc_out = abc;
endmodule


