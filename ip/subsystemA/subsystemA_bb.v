
module subsystemA (
	led_gpio_external_connection_in_port,
	led_gpio_external_connection_out_port,
	led_gpio_s1_address,
	led_gpio_s1_write_n,
	led_gpio_s1_writedata,
	led_gpio_s1_chipselect,
	led_gpio_s1_readdata,
	pheriphal_clk_clk,
	pheriphal_reset_reset_n,
	tp_gpio_external_connection_export,
	tp_gpio_s1_address,
	tp_gpio_s1_write_n,
	tp_gpio_s1_writedata,
	tp_gpio_s1_chipselect,
	tp_gpio_s1_readdata);	

	input	[7:0]	led_gpio_external_connection_in_port;
	output	[7:0]	led_gpio_external_connection_out_port;
	input	[2:0]	led_gpio_s1_address;
	input		led_gpio_s1_write_n;
	input	[31:0]	led_gpio_s1_writedata;
	input		led_gpio_s1_chipselect;
	output	[31:0]	led_gpio_s1_readdata;
	input		pheriphal_clk_clk;
	input		pheriphal_reset_reset_n;
	output	[7:0]	tp_gpio_external_connection_export;
	input	[2:0]	tp_gpio_s1_address;
	input		tp_gpio_s1_write_n;
	input	[31:0]	tp_gpio_s1_writedata;
	input		tp_gpio_s1_chipselect;
	output	[31:0]	tp_gpio_s1_readdata;
endmodule
