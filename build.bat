for %%f in (*.vhdl) do (
  ghdl -a %%f
)
ghdl -e %~n1
ghdl -r %~n1 --vcd=test_result.vcd
gtkwave test_result.vcd
