`timescale 1ns/1ns
//series data detector
module hw_2_2 (
    input DATA_IN,CLK,RST,
    output SIG_OUT
);
    reg [1:0] state, state_next;
    reg sig_out;

    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    assign SIG_OUT = sig_out;

    always @(posedge CLK) begin
        if(RST)
        sig_out <= 0;
        else if(state == s3 && state_next == s3)
        sig_out <= 1;
        else
        sig_out <= 0;
    end

    always@(posedge CLK) begin
        if(RST)
        state <= 0;
        else
        state <= state_next;
    end

    always @(*) begin
        if(RST)
        state_next = 0;
        else begin
            case (state)
            s0: if(!DATA_IN) state_next = s0;  else  state_next = s1;
            s1: if(!DATA_IN) state_next = s0;  else  state_next = s2; 
            s2: if(!DATA_IN) state_next = s0;  else  state_next = s3;
            s3: if(!DATA_IN) state_next = s0;  else  state_next = s3;
            default:         state_next = state_next; 
        endcase
        end
    end
endmodule