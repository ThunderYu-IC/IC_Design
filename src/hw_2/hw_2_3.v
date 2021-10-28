//data array generator 0100_1011_001
module hw_2_3(
    input CLK,RST,
    output SEQ_OUT
    );
    reg  [10:0] sequence ;
    wire seq_out;
    
    assign SEQ_OUT = seq_out;
always@(posedge CLK)
begin
    if(RST)
        sequence <= 11'b0100_1011_001;
    else
        sequence <= {sequence[9:0],sequence[10]};
end
    assign seq_out = sequence[10];
endmodule
