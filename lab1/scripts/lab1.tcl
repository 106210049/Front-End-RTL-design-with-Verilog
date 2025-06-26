# =============================================
# Design Compiler Synthesis Script for Counter
# =============================================

# Set technology libraries
set search_path [list . /home/dsac/Documents/Long/Pico/common/liberty]
set link_library [list \
    /home/dsac/Documents/Long/Pico/common/liberty/saed14rvt_ff0p88v125c.db \
    /home/dsac/Documents/Long/Pico/common/liberty/saed14rvt_ss0p72vm40c.db \
    /home/dsac/Documents/Long/Pico/common/liberty/saed14rvt_tt0p8v25c.db \
]
set target_library $link_library
set symbol_library ""


# Define working library
define_design_lib WORK -path ./work

# Read and analyze RTL files
read_file -format verilog {/home/dsac/Documents/Long/me_labs/lab1/rtl/counter.v}
analyze -library WORK -format verilog {/home/dsac/Documents/Long/me_labs/lab1/rtl/counter.v}
elaborate counter -architecture verilog -library WORK

# Link the design
link

set_operating_conditions -min ss0p72vm40c -max ff0p88v125c

# Set constraints
create_clock -name clk -period 10 [get_ports clk] -waveform {0 5}
#set_input_delay 2 -clock clk [all_inputs]
#set_output_delay 2 -clock clk [all_outputs]
#set_max_fanout 8 [current_design]
set_max_transition 0.1 [get_designs counter]
set_clock_uncertainty 0.2 [get_clocks clk]

# Save synthesis session info for Formality
set_svf /home/dsac/Documents/Long/me_labs/lab1/outputs/counter_formality.svf

# Compile
compile_ultra -retime

check_design

# Reports

report_area > /home/dsac/Documents/Long/me_labs/lab1/reports/area.rpt
report_timing > /home/dsac/Documents/Long/me_labs/lab1/reports/timing.rpt
report_power > /home/dsac/Documents/Long/me_labs/lab1/reports/power.rpt
report_qor > /home/dsac/Documents/Long/me_labs/lab1/reports/qor.rpt
# Export netlist

write -format verilog -hierarchy -output /home/dsac/Documents/Long/me_labs/lab1/outputs/counter_synth.v
set_svf -off
write_sdf /home/dsac/Documents/Long/me_labs/lab1/outputs/counter_synth.sdf
# === Formality Preparation ===

# Export DDC (optional)
write -format ddc -hierarchy -output /home/dsac/Documents/Long/me_labs/lab1/outputs/counter_synth.ddc

# Export SDC constraints (optional but recommended)
write_sdc /home/dsac/Documents/Long/me_labs/lab1/outputs/counter_synth.sdc

# Export environment script for Formality
write_script -output /home/dsac/Documents/Long/me_labs/lab1/outputs/counter_env.tcl

# Turn off SVF recording
set_svf -off

# Optionally start GUI
gui_start

