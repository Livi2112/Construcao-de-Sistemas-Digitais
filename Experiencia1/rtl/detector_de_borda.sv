module detector_de_borda #()
(
    input  logic clk, s_in,
    output logic rise, fall
);

logic last = 0;

always_ff@(posedge clk) begin
    if(s_in != last) begin
        if(s_in) begin
            rise <= 1;
            fall <= 0;
        end
        else begin
            fall <= 1;
            rise <= 0;
        end
    end
    else begin
        rise <= 0;
        fall <= 0;
    end
    last <= s_in;
end


endmodule