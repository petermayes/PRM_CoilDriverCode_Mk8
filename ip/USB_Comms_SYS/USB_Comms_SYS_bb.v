
module USB_Comms_SYS (
	clk_usb_ext_clk_clk,
	pheriphal_clk_clk,
	pheriphal_reset_reset_n,
	reset_usb_ext_clk_reset_n,
	cpu_clk_clk,
	cpu_reset_reset_n,
	usb_data_gpio_in_port,
	usb_data_gpio_out_port,
	usb_data_gpio_irq_irq,
	usb_data_ram_s2_address,
	usb_data_ram_s2_chipselect,
	usb_data_ram_s2_clken,
	usb_data_ram_s2_write,
	usb_data_ram_s2_readdata,
	usb_data_ram_s2_writedata,
	usb_data_ram_s2_byteenable,
	usb_gpio_s1_address,
	usb_gpio_s1_write_n,
	usb_gpio_s1_writedata,
	usb_gpio_s1_chipselect,
	usb_gpio_s1_readdata,
	usb_rx_ram_s1_address,
	usb_rx_ram_s1_clken,
	usb_rx_ram_s1_chipselect,
	usb_rx_ram_s1_write,
	usb_rx_ram_s1_readdata,
	usb_rx_ram_s1_writedata,
	usb_rx_ram_s1_byteenable);	

	input		clk_usb_ext_clk_clk;
	input		pheriphal_clk_clk;
	input		pheriphal_reset_reset_n;
	input		reset_usb_ext_clk_reset_n;
	input		cpu_clk_clk;
	input		cpu_reset_reset_n;
	input		usb_data_gpio_in_port;
	output		usb_data_gpio_out_port;
	output		usb_data_gpio_irq_irq;
	input	[10:0]	usb_data_ram_s2_address;
	input		usb_data_ram_s2_chipselect;
	input		usb_data_ram_s2_clken;
	input		usb_data_ram_s2_write;
	output	[31:0]	usb_data_ram_s2_readdata;
	input	[31:0]	usb_data_ram_s2_writedata;
	input	[3:0]	usb_data_ram_s2_byteenable;
	input	[2:0]	usb_gpio_s1_address;
	input		usb_gpio_s1_write_n;
	input	[31:0]	usb_gpio_s1_writedata;
	input		usb_gpio_s1_chipselect;
	output	[31:0]	usb_gpio_s1_readdata;
	input	[10:0]	usb_rx_ram_s1_address;
	input		usb_rx_ram_s1_clken;
	input		usb_rx_ram_s1_chipselect;
	input		usb_rx_ram_s1_write;
	output	[31:0]	usb_rx_ram_s1_readdata;
	input	[31:0]	usb_rx_ram_s1_writedata;
	input	[3:0]	usb_rx_ram_s1_byteenable;
endmodule
