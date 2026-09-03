module display_decoder_mux #(parameter MAX = 9999)
(
    input  logic [$clog2(MAX+1)-1:0] s_a, s_b,
    input  logic [2:0] mux_in,
    output logic [3:0] s_out = 0
);

always_comb begin
    if(mux_in < 4) begin
        case(mux_in)
            3'b000: s_out = s_a / 1000;
            3'b001: s_out = (s_a / 100) % 10;
            3'b010: s_out = (s_a / 10)  % 10;
            3'b011: s_out = s_a % 10;
        endcase  
    end
    else begin
        case(mux_in)
            3'b100: s_out = s_b / 1000;
            3'b101: s_out = (s_b / 100) % 10;
            3'b110: s_out = (s_b / 10) % 10;
            3'b111: s_out = s_b % 10;
        endcase  
    end
end

endmodule