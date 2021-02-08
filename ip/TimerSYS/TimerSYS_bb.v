
module TimerSYS (
	timer_0_irq_irq,
	timer_1_irq_irq,
	timer_2_irq_irq,
	timer_clk_clk,
	timer_reset_reset_n,
	timer_0_s1_address,
	timer_0_s1_writedata,
	timer_0_s1_readdata,
	timer_0_s1_chipselect,
	timer_0_s1_write_n,
	timer_1_s1_address,
	timer_1_s1_writedata,
	timer_1_s1_readdata,
	timer_1_s1_chipselect,
	timer_1_s1_write_n,
	timer_2_s1_address,
	timer_2_s1_writedata,
	timer_2_s1_readdata,
	timer_2_s1_chipselect,
	timer_2_s1_write_n);	

	output		timer_0_irq_irq;
	output		timer_1_irq_irq;
	output		timer_2_irq_irq;
	input		timer_clk_clk;
	input		timer_reset_reset_n;
	input	[2:0]	timer_0_s1_address;
	input	[15:0]	timer_0_s1_writedata;
	output	[15:0]	timer_0_s1_readdata;
	input		timer_0_s1_chipselect;
	input		timer_0_s1_write_n;
	input	[2:0]	timer_1_s1_address;
	input	[15:0]	timer_1_s1_writedata;
	output	[15:0]	timer_1_s1_readdata;
	input		timer_1_s1_chipselect;
	input		timer_1_s1_write_n;
	input	[2:0]	timer_2_s1_address;
	input	[15:0]	timer_2_s1_writedata;
	output	[15:0]	timer_2_s1_readdata;
	input		timer_2_s1_chipselect;
	input		timer_2_s1_write_n;
endmodule
