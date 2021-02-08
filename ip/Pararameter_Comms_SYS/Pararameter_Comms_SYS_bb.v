
module Pararameter_Comms_SYS (
	clk_ext_ram_clk,
	parameter_gpio_s1_address,
	parameter_gpio_s1_write_n,
	parameter_gpio_s1_writedata,
	parameter_gpio_s1_chipselect,
	parameter_gpio_s1_readdata,
	parameter_loop_gpio_irq_irq,
	reset_ext_ram_reset_n,
	parameter_rx_ram_s1_address,
	parameter_rx_ram_s1_clken,
	parameter_rx_ram_s1_chipselect,
	parameter_rx_ram_s1_write,
	parameter_rx_ram_s1_readdata,
	parameter_rx_ram_s1_writedata,
	parameter_rx_ram_s1_byteenable,
	parameter_rx_ram_s2_address,
	parameter_rx_ram_s2_chipselect,
	parameter_rx_ram_s2_clken,
	parameter_rx_ram_s2_write,
	parameter_rx_ram_s2_readdata,
	parameter_rx_ram_s2_writedata,
	parameter_rx_ram_s2_byteenable,
	parameter_tx_ram_s1_address,
	parameter_tx_ram_s1_clken,
	parameter_tx_ram_s1_chipselect,
	parameter_tx_ram_s1_write,
	parameter_tx_ram_s1_readdata,
	parameter_tx_ram_s1_writedata,
	parameter_tx_ram_s1_byteenable,
	parameter_tx_ram_s2_address,
	parameter_tx_ram_s2_chipselect,
	parameter_tx_ram_s2_clken,
	parameter_tx_ram_s2_write,
	parameter_tx_ram_s2_readdata,
	parameter_tx_ram_s2_writedata,
	parameter_tx_ram_s2_byteenable,
	parameterlengthpage_export,
	parameterlengthpage_s1_address,
	parameterlengthpage_s1_write_n,
	parameterlengthpage_s1_writedata,
	parameterlengthpage_s1_chipselect,
	parameterlengthpage_s1_readdata,
	pheriphal_clk_clk,
	pheriphal_reset_reset_n,
	cpu_clk_clk,
	cpu_reset_reset_n,
	parameter_gpio_external_in_port,
	parameter_gpio_external_out_port,
	crc_init_bridge_avalon_slave_address,
	crc_init_bridge_avalon_slave_byteenable,
	crc_init_bridge_avalon_slave_chipselect,
	crc_init_bridge_avalon_slave_read,
	crc_init_bridge_avalon_slave_write,
	crc_init_bridge_avalon_slave_writedata,
	crc_init_bridge_avalon_slave_readdata,
	crc_init_bridge_avalon_slave_waitrequest,
	crc_init_bridge_interrupt_irq,
	crc_init_bridge_external_interface_acknowledge,
	crc_init_bridge_external_interface_irq,
	crc_init_bridge_external_interface_address,
	crc_init_bridge_external_interface_bus_enable,
	crc_init_bridge_external_interface_byte_enable,
	crc_init_bridge_external_interface_rw,
	crc_init_bridge_external_interface_write_data,
	crc_init_bridge_external_interface_read_data);	

	input		clk_ext_ram_clk;
	input	[2:0]	parameter_gpio_s1_address;
	input		parameter_gpio_s1_write_n;
	input	[31:0]	parameter_gpio_s1_writedata;
	input		parameter_gpio_s1_chipselect;
	output	[31:0]	parameter_gpio_s1_readdata;
	output		parameter_loop_gpio_irq_irq;
	input		reset_ext_ram_reset_n;
	input	[10:0]	parameter_rx_ram_s1_address;
	input		parameter_rx_ram_s1_clken;
	input		parameter_rx_ram_s1_chipselect;
	input		parameter_rx_ram_s1_write;
	output	[31:0]	parameter_rx_ram_s1_readdata;
	input	[31:0]	parameter_rx_ram_s1_writedata;
	input	[3:0]	parameter_rx_ram_s1_byteenable;
	input	[10:0]	parameter_rx_ram_s2_address;
	input		parameter_rx_ram_s2_chipselect;
	input		parameter_rx_ram_s2_clken;
	input		parameter_rx_ram_s2_write;
	output	[31:0]	parameter_rx_ram_s2_readdata;
	input	[31:0]	parameter_rx_ram_s2_writedata;
	input	[3:0]	parameter_rx_ram_s2_byteenable;
	input	[10:0]	parameter_tx_ram_s1_address;
	input		parameter_tx_ram_s1_clken;
	input		parameter_tx_ram_s1_chipselect;
	input		parameter_tx_ram_s1_write;
	output	[31:0]	parameter_tx_ram_s1_readdata;
	input	[31:0]	parameter_tx_ram_s1_writedata;
	input	[3:0]	parameter_tx_ram_s1_byteenable;
	input	[10:0]	parameter_tx_ram_s2_address;
	input		parameter_tx_ram_s2_chipselect;
	input		parameter_tx_ram_s2_clken;
	input		parameter_tx_ram_s2_write;
	output	[31:0]	parameter_tx_ram_s2_readdata;
	input	[31:0]	parameter_tx_ram_s2_writedata;
	input	[3:0]	parameter_tx_ram_s2_byteenable;
	output	[15:0]	parameterlengthpage_export;
	input	[1:0]	parameterlengthpage_s1_address;
	input		parameterlengthpage_s1_write_n;
	input	[31:0]	parameterlengthpage_s1_writedata;
	input		parameterlengthpage_s1_chipselect;
	output	[31:0]	parameterlengthpage_s1_readdata;
	input		pheriphal_clk_clk;
	input		pheriphal_reset_reset_n;
	input		cpu_clk_clk;
	input		cpu_reset_reset_n;
	input		parameter_gpio_external_in_port;
	output		parameter_gpio_external_out_port;
	input	[7:0]	crc_init_bridge_avalon_slave_address;
	input		crc_init_bridge_avalon_slave_byteenable;
	input		crc_init_bridge_avalon_slave_chipselect;
	input		crc_init_bridge_avalon_slave_read;
	input		crc_init_bridge_avalon_slave_write;
	input	[7:0]	crc_init_bridge_avalon_slave_writedata;
	output	[7:0]	crc_init_bridge_avalon_slave_readdata;
	output		crc_init_bridge_avalon_slave_waitrequest;
	output		crc_init_bridge_interrupt_irq;
	input		crc_init_bridge_external_interface_acknowledge;
	input		crc_init_bridge_external_interface_irq;
	output	[7:0]	crc_init_bridge_external_interface_address;
	output		crc_init_bridge_external_interface_bus_enable;
	output		crc_init_bridge_external_interface_byte_enable;
	output		crc_init_bridge_external_interface_rw;
	output	[7:0]	crc_init_bridge_external_interface_write_data;
	input	[7:0]	crc_init_bridge_external_interface_read_data;
endmodule
