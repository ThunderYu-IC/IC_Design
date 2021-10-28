module hw_1_5 (
    input       [15:0]true_code,
    output  reg [15:0]comp_code
);
    always@(true_code)
    begin
        if(true_code > 16'b0111_1111_1111_1111)
            comp_code = ~true_code + 16'b0000_0000_0000_0001;
        else
            comp_code = true_code;
    end        
endmodule