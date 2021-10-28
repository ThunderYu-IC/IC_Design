module hw_3_2 (
    input clk,key,rst,
    output reg [7:0]display
);
    parameter s0 = 3'b000, //清零
              s1 = 3'b001, //计数开始
              s2 = 3'b010, //记住p1
              s3 = 3'b011, //计数停止，输出p2
              s4 = 3'b100; //输出p1

    reg [2:0]state, state_next;
    reg [7:0] cnt,p1,p2;

    always@(posedge clk) begin
        if(rst) begin
            cnt <= 0;
            state_next <= s0;
        end
        else
            cnt <= cnt + 1;
            state <= state_next;
    end

    always @(*) begin
        case(state) 
            s0:  begin display = cnt; if(key) state_next = s1; else state_next = s0; end
            s1: begin display = cnt; p1 = cnt; if(key) state_next = s2; else state_next = s1;end
            s2: begin display = cnt; p2 = cnt; if(key) state_next = s3; else state_next = s2;end
            s3: begin display = p2;  if(key) state_next = s4; else state_next = s3;end
            s4: begin display = p1;  if(key) state_next = s0; else state_next = s4;end
        endcase
    end

    always @(posedge clk) begin
        if(rst|state_next == s0) begin
            cnt <= 0;
            p1 <= 0;
            p2 <= 0;
        end
        else if(state_next == s1|s2) 
            cnt <= cnt + 1;
        // if(state == s1 && state_next == s2) p1 <= cnt;
        // if(state == s2 && state_next == s3) p2 <= cnt;
    end 

    // always @(*) begin
    //     if(state == s1 && state_next == s2) p1 <= cnt;
    //     if(state == s2 && state_next == s3) p2 <= cnt;
    // end           
endmodule