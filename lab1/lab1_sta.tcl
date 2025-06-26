# === PrimeTime Script for Counter ===

# 1. Setup libraries
set search_path "outputs /path/to/liberty"
set link_library "* saed14rvt_tt0p8v25c.db"
set target_library "saed14rvt_tt0p8v25c.db"

# 2. Read netlist
read_verilog outputs/counter_synth.v
link_design counter

# 3. Read constraints
read_sdc outputs/constraints.sdc

# 4. Read SDF (optional)
read_sdf outputs/counter.sdf

# 5. Timing analysis
update_timing
report_timing > reports/timing.rpt
report_timing -max_paths 10 -sort_by group > reports/timing_top10.rpt
report_clocks > reports/clocks.rpt
report_constraints -all_violators > reports/violations.rpt

# 6. Area and power (optional)
report_area > reports/area.rpt
# read_vcd outputs/counter.vcd
# report_power > reports/power.rpt

