
module PatternGeneratorSYS (
	pd_clk_clk,
	pd_debugram_s2_address,
	pd_debugram_s2_chipselect,
	pd_debugram_s2_clken,
	pd_debugram_s2_write,
	pd_debugram_s2_readdata,
	pd_debugram_s2_writedata,
	pd_debugram_s2_byteenable,
	pd_fifo_out_readdata,
	pd_fifo_out_read,
	pd_fifo_out_waitrequest,
	pd_fifo_out_csr_address,
	pd_fifo_out_csr_read,
	pd_fifo_out_csr_writedata,
	pd_fifo_out_csr_write,
	pd_fifo_out_csr_readdata,
	pd_gpio_in_port,
	pd_gpio_out_port,
	pd_reset_reset_n,
	pheriphal_clk_clk,
	pheriphal_reset_reset_n,
	reset_out_export,
	pd_gpio_s1_address,
	pd_gpio_s1_write_n,
	pd_gpio_s1_writedata,
	pd_gpio_s1_chipselect,
	pd_gpio_s1_readdata,
	pd_fifo_in_writedata,
	pd_fifo_in_write,
	pd_fifo_in_waitrequest,
	pd_fifo_in_csr_address,
	pd_fifo_in_csr_read,
	pd_fifo_in_csr_writedata,
	pd_fifo_in_csr_write,
	pd_fifo_in_csr_readdata,
	pd_debugram_s1_address,
	pd_debugram_s1_clken,
	pd_debugram_s1_chipselect,
	pd_debugram_s1_write,
	pd_debugram_s1_readdata,
	pd_debugram_s1_writedata,
	pd_debugram_s1_byteenable,
	reset_pd_s1_address,
	reset_pd_s1_write_n,
	reset_pd_s1_writedata,
	reset_pd_s1_chipselect,
	reset_pd_s1_readdata);	

	input		pd_clk_clk;
	input	[3:0]	pd_debugram_s2_address;
	input		pd_debugram_s2_chipselect;
	input		pd_debugram_s2_clken;
	input		pd_debugram_s2_write;
	output	[31:0]	pd_debugram_s2_readdata;
	input	[31:0]	pd_debugram_s2_writedata;
	input	[3:0]	pd_debugram_s2_byteenable;
	output	[31:0]	pd_fifo_out_readdata;
	input		pd_fifo_out_read;
	output		pd_fifo_out_waitrequest;
	input	[2:0]	pd_fifo_out_csr_address;
	input		pd_fifo_out_csr_read;
	input	[31:0]	pd_fifo_out_csr_writedata;
	input		pd_fifo_out_csr_write;
	output	[31:0]	pd_fifo_out_csr_readdata;
	input	[31:0]	pd_gpio_in_port;
	output	[31:0]	pd_gpio_out_port;
	input		pd_reset_reset_n;
	input		pheriphal_clk_clk;
	input		pheriphal_reset_reset_n;
	output		reset_out_export;
	input	[2:0]	pd_gpio_s1_address;
	input		pd_gpio_s1_write_n;
	input	[31:0]	pd_gpio_s1_writedata;
	input		pd_gpio_s1_chipselect;
	output	[31:0]	pd_gpio_s1_readdata;
	input	[31:0]	pd_fifo_in_writedata;
	input		pd_fifo_in_write;
	output		pd_fifo_in_waitrequest;
	input	[2:0]	pd_fifo_in_csr_address;
	input		pd_fifo_in_csr_read;
	input	[31:0]	pd_fifo_in_csr_writedata;
	input		pd_fifo_in_csr_write;
	output	[31:0]	pd_fifo_in_csr_readdata;
	input	[3:0]	pd_debugram_s1_address;
	input		pd_debugram_s1_clken;
	input		pd_debugram_s1_chipselect;
	input		pd_debugram_s1_write;
	output	[31:0]	pd_debugram_s1_readdata;
	input	[31:0]	pd_debugram_s1_writedata;
	input	[3:0]	pd_debugram_s1_byteenable;
	input	[2:0]	reset_pd_s1_address;
	input		reset_pd_s1_write_n;
	input	[31:0]	reset_pd_s1_writedata;
	input		reset_pd_s1_chipselect;
	output	[31:0]	reset_pd_s1_readdata;
endmodule
