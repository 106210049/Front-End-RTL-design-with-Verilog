###################################################################

# Created by write_script -format dctcl on Tue Jun 24 22:29:35 2025

###################################################################

# Set the current_design #
current_design counter

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_operating_conditions -max ff0p88v125c -max_library saed14rvt_ff0p88v125c\
                         -min ss0p72vm40c -min_library saed14rvt_ss0p72vm40c
remove_wire_load_model
set_max_transition 0.1 [current_design]
set_local_link_library                                                         \
{/home/dsac/Documents/Long/Pico/common/liberty/saed14rvt_ff0p88v125c.db,/home/dsac/Documents/Long/Pico/common/liberty/saed14rvt_ss0p72vm40c.db,/home/dsac/Documents/Long/Pico/common/liberty/saed14rvt_tt0p8v25c.db}
set_register_merging [current_design] 17
set_multibit_options -mode non_timing_driven
set_register_merging [get_cells {q_reg[6]}] 17
set_register_merging [get_cells {q_reg[1]}] 17
set_register_merging [get_cells {q_reg[7]}] 17
set_register_merging [get_cells {q_reg[5]}] 17
set_register_merging [get_cells {q_reg[2]}] 17
set_register_merging [get_cells {q_reg[3]}] 17
set_register_merging [get_cells {q_reg[0]}] 17
set_register_merging [get_cells {q_reg[4]}] 17
set_switching_activity -period 1 -toggle_rate 0.01 -static_probability 0.5     \
[get_pins U30/CKOUT]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_uncertainty 0.2  [get_clocks clk]
set compile_inbound_cell_optimization false
set compile_inbound_max_cell_percentage 10.0
