module hw_2_1 (
    input CLK,RESET,
    output CLK_1,CLK_2
);
    reg clk_1,clk_2;
    reg [3:0]counter;

assign CLK_1 = clk_1;
assign CLK_2 = clk_2;

    //5M
    always@(posedge CLK)
        begin
            if(RESET)
            clk_1 <= 0;
            else
            clk_1 <= ~clk_1;
        end

    //500k
    always @(posedge CLK) begin 
        if(RESET | counter == 9)
        counter <= 0;
        else
        counter <= counter +1;
    end

    always @(posedge CLK) begin
        if(RESET)
        clk_2 <= 0;
        else if(counter == 9)
        clk_2 <= ~clk_2;
        else
        clk_2 <= clk_2;
    end
endmodule