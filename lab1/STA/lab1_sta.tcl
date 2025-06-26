# === PrimeTime Script for Counter ===

# 1. Setup libraries
set search_path [list . /home/dsac/Documents/Long/Pico/common/liberty]
set link_library [list \
    /home/dsac/Documents/Long/Pico/common/liberty/saed14rvt_ff0p88v125c.db \
    /home/dsac/Documents/Long/Pico/common/liberty/saed14rvt_ss0p72vm40c.db \
    /home/dsac/Documents/Long/Pico/common/liberty/saed14rvt_tt0p8v25c.db \
]
set target_library $link_library

# 2. Read netlist
read_verilog ./outputs/counter_synth.v
link_design counter
set_operating_conditions -min ss0p72vm40c -max ff0p88v125c
# 3. Read constraints
read_sdc ./outputs/counter_synth.sdc

# 4. Read SDF (optional)
read_sdf ./outputs/counter_synth.sdf

# 5. Timing analysis
update_timing
report_timing -max_paths 10 -slack_lesser_than 10.00 > ./reports/sta_timing.rpt
report_timing -max_paths 100 -sort_by group > ./reports/sta_timing_top100.rpt
report_timing -delay_type min -max_paths 100 -sort_by group > ./reports/hold_violations.rpt
report_clocks > reports/clocks.rpt
report_constraints -all_violators > ./reports/violations.rpt






