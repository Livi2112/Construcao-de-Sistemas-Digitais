module decoder #(parameter IN_WIDTH = 3)
(
    input  logic [IN_WIDTH-1:0]      s_in,
    output logic [(1<<IN_WIDTH)-1:0] s_out
);

always_comb begin
    if(s_in == 0) begin
        s_out = 0;
    end
    else begin
        s_out = 1 << (s_in-1);
    end
end

endmodule