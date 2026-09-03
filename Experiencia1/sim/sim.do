if {[file isdirectory work]} {
    vdel -all -lib work
}

vlib work
vmap work work

vlog -sv \
    ../rtl/placar_eletronico_digital.sv \
    ../rtl/contador.sv \
    ../rtl/contador_equipe.sv \
    ../rtl/detector_de_borda.sv \
    ../rtl/divisor_de_clock.sv \
    ../rtl/decoder.sv \
    ../rtl/display_decoder_mux.sv \
    ../rtl/bin_para_display.sv \
    tb_placar_eletronico_digital.sv

vsim -voptargs="+acc" work.tb_placar_eletronico_digital

do wave.do

run 10us
