###################################################################

# Created by write_sdc on Tue Jun 24 22:29:35 2025

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_operating_conditions -max ff0p88v125c -max_library saed14rvt_ff0p88v125c\
                         -min ss0p72vm40c -min_library saed14rvt_ss0p72vm40c
set_max_transition 0.1 [current_design]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_uncertainty 0.2  [get_clocks clk]
