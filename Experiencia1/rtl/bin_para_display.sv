module bin_para_display (
    input  logic [3:0] s_in,
    output logic [6:0] s_out
);

always_comb begin
    case (s_in)
        4'd0: s_out = 7'b0000001;
        4'd1: s_out = 7'b1001111;
        4'd2: s_out = 7'b0010010;
        4'd3: s_out = 7'b0000110;
        4'd4: s_out = 7'b1001100;
        4'd5: s_out = 7'b0100100;
        4'd6: s_out = 7'b0100000;
        4'd7: s_out = 7'b0001111;
        4'd8: s_out = 7'b0000000;
        4'd9: s_out = 7'b0000100;
        default: s_out = 7'b1111111;
    endcase
end

endmodule
