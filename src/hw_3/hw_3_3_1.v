//九个状态 状态机
`timescale 1ns / 1ps

module hw3_3(clk,strobe,din,rst,dout);
input clk,din,rst;
output reg [3:0]dout;
output reg strobe;
reg [3:0] cs,ns,cach;
wire check;
reg right;
always@ (posedge clk or negedge rst)
    if (!rst)
        ns <=0;
    else
        cs <= ns;
assign check = ~(cach[0]^cach[1]^cach[2]^cach[3]);
always@ (cs or din)
    if(!rst)
        cs = 0;
    else 
        case(cs)
            0:begin
                if (din == 1) ns =1;
                else ns = 0;  
              end
            1:begin
                if (din == 0) ns = 2;
                else ns = 0;
              end
            2:begin
                if (din==1) ns = 3;
                else ns=0;
              end
            3:begin
                if (din==0) ns = 4;
                else ns = 0;
              end
            4:begin
                ns=5;
                cach[3] = din;
              end
            5:begin
                ns=6;
                cach[2] = din;
              end
            6:begin
                ns=7;
                cach[1] = din;
              end
            7:begin
                ns=8;
                cach[0] = din;
              end
            8:begin
                ns = 9;
                if (din==check)
                     right = 1;
                else right = 0 ;
              end
            9: ns = 0;
          endcase

always@(*)
    if (!rst)
        begin
            dout =0;
            strobe =0;
        end
    else if ((cs==9 )&(right==1))
        begin   
            dout = cach;
            strobe = 1;
        end    
    else 
        begin
            dout = 0;
            strobe = 0;       
        end 
endmodule
