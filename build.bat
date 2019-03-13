ghdl -a task_03_core.vhdl
ghdl -a task_03_core_tb.vhdl
ghdl -e task_03_core_tb
ghdl -r task_03_core_tb --vcd=task_03_core_tb.vcd
gtkwave task_03_core_tb.vcd