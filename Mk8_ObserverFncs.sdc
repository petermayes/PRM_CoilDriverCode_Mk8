#**************************************************************
# This .sdc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************

create_clock -period "50.0 MHz" [get_ports MAX10_CLK1_50] -name SysCLK
#create_clock -period "60.0 MHz" [get_ports DDR3_CLK_50] -name DDR3_CLK


#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups \
   -exclusive \
   -group {SysCLK} \
	-group {CPU|inst|altpll_sys|sd1|pll7|clk[0]} \
	-group {CPU|inst|altpll_sys|sd1|pll7|clk[1]} \
	-group {CPU|DataLoopController|FIFO_pll|altpll_0|sd1|pll7|clk[0]} \
	-group {CurrentControlTopLevel|ADCReadbackTopLevel|ADC_PLL|altpll_0|sd1|pll7|clk[0]} \
	-group {CurrentControlTopLevel|ADCReadbackTopLevel|ADC_PLL|altpll_0|sd1|pll7|clk[1]}	
#   -group {DDR3_CLK_50} \


#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



# ------------------------------------------------------------

set_multicycle_path -to [get_fanouts [get_pins {*CPU|DataLoopController|DualLoopController|Loop1|Clk_Enable_dff|q*} ] -through [get_pins -hierarchical *|*ena*]] -end -setup 4
set_multicycle_path -to [get_fanouts [get_pins {*CPU|DataLoopController|DualLoopController|Loop1|Clk_Enable_dff|q*} ] -through [get_pins -hierarchical *|*ena*]] -end -hold 3

set_multicycle_path -to [get_fanouts [get_pins {*CPU|DataLoopController|DualLoopController|Loop1|$00000|CDR_CLKEnBuffer_dff|q*} ] -through [get_pins -hierarchical *|*ena*]] -end -setup 4
set_multicycle_path -to [get_fanouts [get_pins {*CPU|DataLoopController|DualLoopController|Loop1|$00000|CDR_CLKEnBuffer_dff|q*} ] -through [get_pins -hierarchical *|*ena*]] -end -hold 3

# ------------------------------------------------------------

set_multicycle_path -to [get_fanouts [get_pins {*CPU|DataLoopController|DualLoopController|Loop2|Clk_Enable_dff|q*} ] -through [get_pins -hierarchical *|*ena*]] -end -setup 4
set_multicycle_path -to [get_fanouts [get_pins {*CPU|DataLoopController|DualLoopController|Loop2|Clk_Enable_dff|q*} ] -through [get_pins -hierarchical *|*ena*]] -end -hold 3

set_multicycle_path -to [get_fanouts [get_pins {*CPU|DataLoopController|DualLoopController|Loop2|$00002|CDR_CLKEnBuffer_dff|q*} ] -through [get_pins -hierarchical *|*ena*]] -end -setup 4
set_multicycle_path -to [get_fanouts [get_pins {*CPU|DataLoopController|DualLoopController|Loop2|$00002|CDR_CLKEnBuffer_dff|q*} ] -through [get_pins -hierarchical *|*ena*]] -end -hold 3

# ------------------------------------------------------------



#**************************************************************
# Set Maximum Delay
#**************************************************************


#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************



