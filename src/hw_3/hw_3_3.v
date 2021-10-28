module hw_3_3 (
    input clk,rst,
    input din,
    output reg [3:0]dout,
    output reg strobe
);
    reg [3:0]sequence;
    reg [2:0] state, state_next, cnt;
    wire check;
    reg flag;

    assign check = ~(1^0^1^0^sequence[3]^sequence[2]^sequence[1]^sequence[0]);
    parameter s0 = 3'b000, 
              s1 = 3'b001, 
              s2 = 3'b010, 
              s3 = 3'b011,
              s4 = 3'b100;
              

    always@(posedge clk) begin
        if(rst)
        state <= 0;
        else
        state <= state_next;
    end

    always @(*) begin
        if(rst)
        state_next = 0;
        else begin
            case (state)
            s0: if(din) state_next = s1;  else  state_next = s0;
            s1: if(!din) state_next = s2;  else  state_next = s0; 
            s2: if(din) state_next = s3;  else  state_next = s0;
            s3: if(!din) state_next = s4;  else  state_next = s0;
            s4: if(cnt == 6) state_next = s0; 
            default:         state_next = s0; 
        endcase
        end
    end

    always @(posedge clk) begin
        if(rst|cnt==6)   cnt <= 0;
        else if(state_next == s4)
        cnt <= cnt + 1;
    end

    always @(*) begin
        if(cnt == 5) flag = check^din;
        else flag = 0;
    end

    always @(posedge clk) begin
        if(rst)
        sequence <= 0;
        else
        sequence <= {sequence[2:0],din};
    end

    always @(posedge clk) begin
        if(rst|flag) begin
        dout <= 0;
        strobe <= 0;
        end
        else if(cnt == 5) begin
        dout <= sequence;
        strobe <= 1;
        end
        else begin
        dout <= 0;
        strobe <= 0;
        end
    end




endmodule