//Odd check,series input
module hw_3_1 (
    input       [7:0]din;
    input       clk,rst,strobe;
    output      dout ;
);
    reg [7:0]sequence;
    reg      odd_check,flag;//用来判断是否输出奇校验位,保证一个有效strobe输出一次奇校验位

    assign dout = sequence[7];
    assign odd_check = ~(din[7]^din[6]^din[5]^din[4]^din[3]^din[2]^din[1]^din[0]);

    always @(posedge clk) begin
        if(rst)
            sequence <= 8'b0;
        else if(strobe)
            sequence <= din;
        else
            sequence <= {sequence[6:0],0};
    end

    always @(posedge clk) begin
        if(rst)
            flag <= 0;
        else if(strobe)
            flag <= 1;
        else if(!sequence)
            dout <= odd_check;
            flag <= 0;
    end
endmodule