module contador_equipe #(parameter MAX = 9999)
(
    input  logic clk, rst,
    input  logic incr, decr,
    output logic [$clog2(MAX)-1:0] s_out
);

logic [$clog2(MAX)-1:0]count = 0;

always_ff@(posedge clk or posedge rst) begin
    if(incr && (count < MAX)) begin
        count <= count + 1;
    end
    if(decr && (count > 0)) begin
        count <= count - 1;
    end
    if(rst) begin
        count <= 0;
    end
    s_out <= count;
end

endmodule