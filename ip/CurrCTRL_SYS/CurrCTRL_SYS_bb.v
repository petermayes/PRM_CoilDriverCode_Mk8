
module CurrCTRL_SYS (
	clk_currctrl_sys_fifo_clk,
	clk_currctrl_sys_ram_clk,
	clk_pheripal_clk,
	cpu_clk_clk,
	cpu_reset_reset_n,
	currctrl_gpio_ext_in_port,
	currctrl_gpio_ext_out_port,
	currctrl_gpio_s1_address,
	currctrl_gpio_s1_write_n,
	currctrl_gpio_s1_writedata,
	currctrl_gpio_s1_chipselect,
	currctrl_gpio_s1_readdata,
	currctrl_register_ram_s1_address,
	currctrl_register_ram_s1_clken,
	currctrl_register_ram_s1_chipselect,
	currctrl_register_ram_s1_write,
	currctrl_register_ram_s1_readdata,
	currctrl_register_ram_s1_writedata,
	currctrl_register_ram_s1_byteenable,
	currctrl_register_ram_s2_address,
	currctrl_register_ram_s2_chipselect,
	currctrl_register_ram_s2_clken,
	currctrl_register_ram_s2_write,
	currctrl_register_ram_s2_readdata,
	currctrl_register_ram_s2_writedata,
	currctrl_register_ram_s2_byteenable,
	currctrlsys_bridge_acknowledge,
	currctrlsys_bridge_irq,
	currctrlsys_bridge_address,
	currctrlsys_bridge_bus_enable,
	currctrlsys_bridge_byte_enable,
	currctrlsys_bridge_rw,
	currctrlsys_bridge_write_data,
	currctrlsys_bridge_read_data,
	currctrlsys_bridge_avalon_slave_address,
	currctrlsys_bridge_avalon_slave_byteenable,
	currctrlsys_bridge_avalon_slave_chipselect,
	currctrlsys_bridge_avalon_slave_read,
	currctrlsys_bridge_avalon_slave_write,
	currctrlsys_bridge_avalon_slave_writedata,
	currctrlsys_bridge_avalon_slave_readdata,
	currctrlsys_bridge_avalon_slave_waitrequest,
	currctrlsys_bridge_interrupt_irq,
	reset_currctrl_sys_fifo_reset_n,
	reset_currctrl_sys_ram_reset_n,
	reset_pheripal_reset_n);	

	input		clk_currctrl_sys_fifo_clk;
	input		clk_currctrl_sys_ram_clk;
	input		clk_pheripal_clk;
	input		cpu_clk_clk;
	input		cpu_reset_reset_n;
	input	[31:0]	currctrl_gpio_ext_in_port;
	output	[31:0]	currctrl_gpio_ext_out_port;
	input	[2:0]	currctrl_gpio_s1_address;
	input		currctrl_gpio_s1_write_n;
	input	[31:0]	currctrl_gpio_s1_writedata;
	input		currctrl_gpio_s1_chipselect;
	output	[31:0]	currctrl_gpio_s1_readdata;
	input	[7:0]	currctrl_register_ram_s1_address;
	input		currctrl_register_ram_s1_clken;
	input		currctrl_register_ram_s1_chipselect;
	input		currctrl_register_ram_s1_write;
	output	[31:0]	currctrl_register_ram_s1_readdata;
	input	[31:0]	currctrl_register_ram_s1_writedata;
	input	[3:0]	currctrl_register_ram_s1_byteenable;
	input	[7:0]	currctrl_register_ram_s2_address;
	input		currctrl_register_ram_s2_chipselect;
	input		currctrl_register_ram_s2_clken;
	input		currctrl_register_ram_s2_write;
	output	[31:0]	currctrl_register_ram_s2_readdata;
	input	[31:0]	currctrl_register_ram_s2_writedata;
	input	[3:0]	currctrl_register_ram_s2_byteenable;
	input		currctrlsys_bridge_acknowledge;
	input		currctrlsys_bridge_irq;
	output	[6:0]	currctrlsys_bridge_address;
	output		currctrlsys_bridge_bus_enable;
	output	[3:0]	currctrlsys_bridge_byte_enable;
	output		currctrlsys_bridge_rw;
	output	[31:0]	currctrlsys_bridge_write_data;
	input	[31:0]	currctrlsys_bridge_read_data;
	input	[4:0]	currctrlsys_bridge_avalon_slave_address;
	input	[3:0]	currctrlsys_bridge_avalon_slave_byteenable;
	input		currctrlsys_bridge_avalon_slave_chipselect;
	input		currctrlsys_bridge_avalon_slave_read;
	input		currctrlsys_bridge_avalon_slave_write;
	input	[31:0]	currctrlsys_bridge_avalon_slave_writedata;
	output	[31:0]	currctrlsys_bridge_avalon_slave_readdata;
	output		currctrlsys_bridge_avalon_slave_waitrequest;
	output		currctrlsys_bridge_interrupt_irq;
	input		reset_currctrl_sys_fifo_reset_n;
	input		reset_currctrl_sys_ram_reset_n;
	input		reset_pheripal_reset_n;
endmodule
