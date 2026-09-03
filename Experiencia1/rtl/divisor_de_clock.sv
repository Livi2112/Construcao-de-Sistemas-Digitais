module divisor_de_clock #(parameter METADE_DIVISOR = 2500)(
    input  logic clk_in,
    output logic clk_out = 0
);

logic [$clog2(METADE_DIVISOR)-1:0] count = 0;

always_ff@(posedge clk_in) begin
    if(count < METADE_DIVISOR-1) begin
        count <= count + 1;
    end
    else begin
        count <= 0;
        clk_out <= ~clk_out;
    end
end

endmodule