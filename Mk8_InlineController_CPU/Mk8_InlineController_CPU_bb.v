
module Mk8_InlineController_CPU (
	altpll_sys_locked_conduit_export,
	clk_clk,
	clk_10m_clk,
	clk_currctrl_fifo_clk,
	clk_currctrl_ram_clk,
	clk_parameter_ram_clk_clk,
	clk_usb_ext_clk_clk,
	cpu_clk_clk,
	currctrl_sys_bridge_acknowledge,
	currctrl_sys_bridge_irq,
	currctrl_sys_bridge_address,
	currctrl_sys_bridge_bus_enable,
	currctrl_sys_bridge_byte_enable,
	currctrl_sys_bridge_rw,
	currctrl_sys_bridge_write_data,
	currctrl_sys_bridge_read_data,
	currctrl_sys_currctrl_gpio_ext_in_port,
	currctrl_sys_currctrl_gpio_ext_out_port,
	currctrl_sys_register_ram_s2_address,
	currctrl_sys_register_ram_s2_chipselect,
	currctrl_sys_register_ram_s2_clken,
	currctrl_sys_register_ram_s2_write,
	currctrl_sys_register_ram_s2_readdata,
	currctrl_sys_register_ram_s2_writedata,
	currctrl_sys_register_ram_s2_byteenable,
	parameter_sys_crc_init_bridge_acknowledge,
	parameter_sys_crc_init_bridge_irq,
	parameter_sys_crc_init_bridge_address,
	parameter_sys_crc_init_bridge_bus_enable,
	parameter_sys_crc_init_bridge_byte_enable,
	parameter_sys_crc_init_bridge_rw,
	parameter_sys_crc_init_bridge_write_data,
	parameter_sys_crc_init_bridge_read_data,
	parameter_sys_parameter_gpio_in_port,
	parameter_sys_parameter_gpio_out_port,
	parameter_sys_parameter_rx_ram_s2_address,
	parameter_sys_parameter_rx_ram_s2_chipselect,
	parameter_sys_parameter_rx_ram_s2_clken,
	parameter_sys_parameter_rx_ram_s2_write,
	parameter_sys_parameter_rx_ram_s2_readdata,
	parameter_sys_parameter_rx_ram_s2_writedata,
	parameter_sys_parameter_rx_ram_s2_byteenable,
	parameter_sys_parameter_tx_ram_s2_address,
	parameter_sys_parameter_tx_ram_s2_chipselect,
	parameter_sys_parameter_tx_ram_s2_clken,
	parameter_sys_parameter_tx_ram_s2_write,
	parameter_sys_parameter_tx_ram_s2_readdata,
	parameter_sys_parameter_tx_ram_s2_writedata,
	parameter_sys_parameter_tx_ram_s2_byteenable,
	parameter_sys_parameterlengthpage_export,
	pheriphals_led_gpio_external_connection_in_port,
	pheriphals_led_gpio_external_connection_out_port,
	pheriphals_tp_gpio_external_connection_export,
	reset_reset_n,
	reset_currctrl_fifo_reset_n,
	reset_currctrl_ram_reset_n,
	reset_parameter_ram_clk_reset_n,
	reset_usb_ext_clk_reset_n,
	usb_data_sys_usb_data_gpio_in_port,
	usb_data_sys_usb_data_gpio_out_port,
	usb_data_sys_usb_data_ram_s2_address,
	usb_data_sys_usb_data_ram_s2_chipselect,
	usb_data_sys_usb_data_ram_s2_clken,
	usb_data_sys_usb_data_ram_s2_write,
	usb_data_sys_usb_data_ram_s2_readdata,
	usb_data_sys_usb_data_ram_s2_writedata,
	usb_data_sys_usb_data_ram_s2_byteenable);	

	output		altpll_sys_locked_conduit_export;
	input		clk_clk;
	output		clk_10m_clk;
	input		clk_currctrl_fifo_clk;
	input		clk_currctrl_ram_clk;
	input		clk_parameter_ram_clk_clk;
	input		clk_usb_ext_clk_clk;
	output		cpu_clk_clk;
	input		currctrl_sys_bridge_acknowledge;
	input		currctrl_sys_bridge_irq;
	output	[6:0]	currctrl_sys_bridge_address;
	output		currctrl_sys_bridge_bus_enable;
	output	[3:0]	currctrl_sys_bridge_byte_enable;
	output		currctrl_sys_bridge_rw;
	output	[31:0]	currctrl_sys_bridge_write_data;
	input	[31:0]	currctrl_sys_bridge_read_data;
	input	[31:0]	currctrl_sys_currctrl_gpio_ext_in_port;
	output	[31:0]	currctrl_sys_currctrl_gpio_ext_out_port;
	input	[7:0]	currctrl_sys_register_ram_s2_address;
	input		currctrl_sys_register_ram_s2_chipselect;
	input		currctrl_sys_register_ram_s2_clken;
	input		currctrl_sys_register_ram_s2_write;
	output	[31:0]	currctrl_sys_register_ram_s2_readdata;
	input	[31:0]	currctrl_sys_register_ram_s2_writedata;
	input	[3:0]	currctrl_sys_register_ram_s2_byteenable;
	input		parameter_sys_crc_init_bridge_acknowledge;
	input		parameter_sys_crc_init_bridge_irq;
	output	[7:0]	parameter_sys_crc_init_bridge_address;
	output		parameter_sys_crc_init_bridge_bus_enable;
	output		parameter_sys_crc_init_bridge_byte_enable;
	output		parameter_sys_crc_init_bridge_rw;
	output	[7:0]	parameter_sys_crc_init_bridge_write_data;
	input	[7:0]	parameter_sys_crc_init_bridge_read_data;
	input		parameter_sys_parameter_gpio_in_port;
	output		parameter_sys_parameter_gpio_out_port;
	input	[10:0]	parameter_sys_parameter_rx_ram_s2_address;
	input		parameter_sys_parameter_rx_ram_s2_chipselect;
	input		parameter_sys_parameter_rx_ram_s2_clken;
	input		parameter_sys_parameter_rx_ram_s2_write;
	output	[31:0]	parameter_sys_parameter_rx_ram_s2_readdata;
	input	[31:0]	parameter_sys_parameter_rx_ram_s2_writedata;
	input	[3:0]	parameter_sys_parameter_rx_ram_s2_byteenable;
	input	[10:0]	parameter_sys_parameter_tx_ram_s2_address;
	input		parameter_sys_parameter_tx_ram_s2_chipselect;
	input		parameter_sys_parameter_tx_ram_s2_clken;
	input		parameter_sys_parameter_tx_ram_s2_write;
	output	[31:0]	parameter_sys_parameter_tx_ram_s2_readdata;
	input	[31:0]	parameter_sys_parameter_tx_ram_s2_writedata;
	input	[3:0]	parameter_sys_parameter_tx_ram_s2_byteenable;
	output	[15:0]	parameter_sys_parameterlengthpage_export;
	input	[7:0]	pheriphals_led_gpio_external_connection_in_port;
	output	[7:0]	pheriphals_led_gpio_external_connection_out_port;
	output	[7:0]	pheriphals_tp_gpio_external_connection_export;
	input		reset_reset_n;
	input		reset_currctrl_fifo_reset_n;
	input		reset_currctrl_ram_reset_n;
	input		reset_parameter_ram_clk_reset_n;
	input		reset_usb_ext_clk_reset_n;
	input		usb_data_sys_usb_data_gpio_in_port;
	output		usb_data_sys_usb_data_gpio_out_port;
	input	[10:0]	usb_data_sys_usb_data_ram_s2_address;
	input		usb_data_sys_usb_data_ram_s2_chipselect;
	input		usb_data_sys_usb_data_ram_s2_clken;
	input		usb_data_sys_usb_data_ram_s2_write;
	output	[31:0]	usb_data_sys_usb_data_ram_s2_readdata;
	input	[31:0]	usb_data_sys_usb_data_ram_s2_writedata;
	input	[3:0]	usb_data_sys_usb_data_ram_s2_byteenable;
endmodule
