module placar_eletronico_digital #()
(
    input  logic clock, reset,
    input  logic incr_a, decr_a,
    input  logic incr_b, decr_b,
    output logic [6:0] display,
    output logic [7:0] display_en
);


logic reset_rise, reset_fall;
logic incr_a_rise, decr_a_rise;
logic incr_b_rise, decr_b_rise;
logic incr_a_fall, decr_a_fall;
logic incr_b_fall, decr_b_fall;
logic [13:0] count_a, count_b;

logic clock_controle_display_en;
logic [2:0]count_controle_display_en;

logic [3:0]dig_display;


// Detectores de borda para incremento, decremento e reset dos contadores de equipe
detector_de_borda db_reset
(
    .clk(clock),
    .s_in(reset),
    .rise(reset_rise),
    .fall(reset_fall)
);
detector_de_borda db_incr_a 
(
    .clk(clock),
    .s_in(incr_a),
    .rise(incr_a_rise),
    .fall(incr_a_fall)
);
detector_de_borda db_decr_a 
(
    .clk(clock),
    .s_in(decr_a),
    .rise(decr_a_rise),
    .fall(decr_a_fall)
);
detector_de_borda db_incr_b 
(
    .clk(clock),
    .s_in(incr_b),
    .rise(incr_b_rise),
    .fall(incr_b_fall)
);
detector_de_borda db_decr_b 
(
    .clk(clock),
    .s_in(decr_b),
    .rise(decr_b_rise),
    .fall(decr_b_fall)
);


// Contadores de equipe
contador_equipe contador_equipe_a
(
    .clk(clock),
    .rst(reset_rise),
    .incr(incr_a_rise),
    .decr(decr_a_rise),
    .s_out(count_a)
);
contador_equipe contador_equipe_b
(
    .clk(clock),
    .rst(reset_rise),
    .incr(incr_b_rise),
    .decr(decr_b_rise),
    .s_out(count_b)
);

// Divisor de clock para display_decoder_mux
divisor_de_clock #(.METADE_DIVISOR(10/2))
divisor_de_clock_controle_display_en
(
    .clk_in(clock),
    .clk_out(clock_controle_display_en)
);

// Contador para controlar display_en
contador controle_display_en
(
    .clk(clock_controle_display_en),
    .s_out(count_controle_display_en)
);

// Decodifica o contador e ativa a respectiva entrada do display_en
decoder decoder_display_en
(
    .s_in(count_controle_display_en),
    .s_out(display_en)
);

// Usa o contador para decidir qual digito decimal mandar
display_decoder_mux u_display_decoder_mux
(
    .s_a(count_a),
    .s_b(count_b),
    .mux_in(count_controle_display_en),
    .s_out(dig_display)
);

bin_para_display u_bin_para_display
(
    .s_in(dig_display),
    .s_out(display)
);

endmodule