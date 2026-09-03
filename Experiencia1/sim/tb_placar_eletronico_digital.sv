`timescale 1ns/1ps

module tb_placar_eletronico_digital;

    logic [0:7] display_en;
    logic [0:6] display;

    logic clock;
    logic reset;

    logic incr_a;
    logic decr_a;
    logic incr_b;
    logic decr_b;


    // =========================================================
    // DUT
    // =========================================================

    placar_eletronico_digital dut_placar_eletronico_digital
    (
        .clock      (clock),
        .reset      (reset),
        .incr_a     (incr_a),
        .decr_a     (decr_a),
        .incr_b     (incr_b),
        .decr_b     (decr_b),
        .display_en (display_en),
        .display    (display)
    );


    // =========================================================
    // CLOCK
    // Período = 10 ns
    // =========================================================

    initial begin
        clock = 0;

        forever #5 clock = ~clock;
    end


    // =========================================================
    // TASKS
    // =========================================================

    // Simula um pulso no botão de incremento da equipe A
    task press_incr_a;
        begin
            incr_a = 1;
            #20;
            incr_a = 0;
            #20;
        end
    endtask


    // Simula um pulso no botão de decremento da equipe A
    task press_decr_a;
        begin
            decr_a = 1;
            #20;
            decr_a = 0;
            #20;
        end
    endtask


    // Simula um pulso no botão de incremento da equipe B
    task press_incr_b;
        begin
            incr_b = 1;
            #20;
            incr_b = 0;
            #20;
        end
    endtask


    // Simula um pulso no botão de decremento da equipe B
    task press_decr_b;
        begin
            decr_b = 1;
            #20;
            decr_b = 0;
            #20;
        end
    endtask


    // =========================================================
    // TESTE
    // =========================================================

    initial begin

        // -----------------------------------------------------
        // Inicialização
        // -----------------------------------------------------

        reset  = 0;

        incr_a = 0;
        decr_a = 0;

        incr_b = 0;
        decr_b = 0;


        // =====================================================
        // TESTE 1 - RESET INICIAL
        // =====================================================

        #20;

        reset = 1;

        #20;

        reset = 0;

        #20;


        // =====================================================
        // TESTE 2 - INCREMENTA A
        // Resultado esperado:
        // A = 1
        // =====================================================

        press_incr_a;


        // =====================================================
        // TESTE 3 - INCREMENTA A MAIS 4 VEZES
        // Resultado esperado:
        // A = 5
        // =====================================================

        press_incr_a;
        press_incr_a;
        press_incr_a;
        press_incr_a;


        // =====================================================
        // TESTE 4 - DECREMENTA A
        // Resultado esperado:
        // A = 4
        // =====================================================

        press_decr_a;


        // =====================================================
        // TESTE 5 - DECREMENTA A MAIS 2 VEZES
        // Resultado esperado:
        // A = 2
        // =====================================================

        press_decr_a;
        press_decr_a;


        // =====================================================
        // TESTE 6 - INCREMENTA B
        // Resultado esperado:
        // B = 1
        // =====================================================

        press_incr_b;


        // =====================================================
        // TESTE 7 - INCREMENTA B MAIS 9 VEZES
        // Resultado esperado:
        // B = 10
        // =====================================================

        press_incr_b;
        press_incr_b;
        press_incr_b;
        press_incr_b;
        press_incr_b;
        press_incr_b;
        press_incr_b;
        press_incr_b;
        press_incr_b;


        // =====================================================
        // TESTE 8 - DECREMENTA B 5 VEZES
        // Resultado esperado:
        // B = 5
        // =====================================================

        press_decr_b;
        press_decr_b;
        press_decr_b;
        press_decr_b;
        press_decr_b;


        // =====================================================
        // TESTE 9 - TESTA AS DUAS EQUIPES
        // =====================================================

        press_incr_a;
        press_incr_a;
        press_incr_a;

        press_incr_b;
        press_incr_b;


        // =====================================================
        // TESTE 10 - RESET COM PLACAR DIFERENTE DE ZERO
        //
        // Esperado:
        // A = 0
        // B = 0
        // =====================================================

        reset = 1;

        #20;

        reset = 0;

        #20;


        // =====================================================
        // TESTE 11 - INCREMENTA A ATÉ 10
        // =====================================================

        repeat (10) begin
            press_incr_a;
        end


        // =====================================================
        // TESTE 12 - DECREMENTA A ATÉ 5
        // =====================================================

        repeat (5) begin
            press_decr_a;
        end


        // =====================================================
        // TESTE 13 - INCREMENTA B ATÉ 20
        // =====================================================

        repeat (20) begin
            press_incr_b;
        end


        // =====================================================
        // TESTE 14 - DECREMENTA B ATÉ 10
        // =====================================================

        repeat (10) begin
            press_decr_b;
        end


        // =====================================================
        // TESTE 15 - TESTA CONTAGEM ALTERNADA
        // =====================================================

        press_incr_a;
        press_incr_b;

        press_incr_a;
        press_decr_b;

        press_decr_a;
        press_incr_b;

        press_incr_a;
        press_incr_b;

        press_decr_a;
        press_decr_b;


        // =====================================================
        // TESTE 16 - RESET FINAL
        // =====================================================

        reset = 1;

        #20;

        reset = 0;

        #50;


        // =====================================================
        // FIM
        // =====================================================

        $display("========================================");
        $display("SIMULACAO FINALIZADA");
        $display("========================================");

    end

endmodule

