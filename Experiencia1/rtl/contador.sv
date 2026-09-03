module contador #(parameter MAX = 7)
(
    input  logic clk,
    output logic [$clog2(MAX)-1:0]s_out
);

logic [$clog2(MAX)-1:0]count = 0;

always_ff@(posedge clk) begin
    s_out <= count;
    if(count < MAX) begin
        count <= count + 1;
    end
    else begin
        count <= 0;
    end
end

endmodule