	USB_Comms_SYS u0 (
		.clk_usb_ext_clk_clk        (<connected-to-clk_usb_ext_clk_clk>),        //   clk_usb_ext_clk.clk
		.pheriphal_clk_clk          (<connected-to-pheriphal_clk_clk>),          //     pheriphal_clk.clk
		.pheriphal_reset_reset_n    (<connected-to-pheriphal_reset_reset_n>),    //   pheriphal_reset.reset_n
		.reset_usb_ext_clk_reset_n  (<connected-to-reset_usb_ext_clk_reset_n>),  // reset_usb_ext_clk.reset_n
		.cpu_clk_clk                (<connected-to-cpu_clk_clk>),                //           cpu_clk.clk
		.cpu_reset_reset_n          (<connected-to-cpu_reset_reset_n>),          //         cpu_reset.reset_n
		.usb_data_gpio_in_port      (<connected-to-usb_data_gpio_in_port>),      //     usb_data_gpio.in_port
		.usb_data_gpio_out_port     (<connected-to-usb_data_gpio_out_port>),     //                  .out_port
		.usb_data_gpio_irq_irq      (<connected-to-usb_data_gpio_irq_irq>),      // usb_data_gpio_irq.irq
		.usb_data_ram_s2_address    (<connected-to-usb_data_ram_s2_address>),    //   usb_data_ram_s2.address
		.usb_data_ram_s2_chipselect (<connected-to-usb_data_ram_s2_chipselect>), //                  .chipselect
		.usb_data_ram_s2_clken      (<connected-to-usb_data_ram_s2_clken>),      //                  .clken
		.usb_data_ram_s2_write      (<connected-to-usb_data_ram_s2_write>),      //                  .write
		.usb_data_ram_s2_readdata   (<connected-to-usb_data_ram_s2_readdata>),   //                  .readdata
		.usb_data_ram_s2_writedata  (<connected-to-usb_data_ram_s2_writedata>),  //                  .writedata
		.usb_data_ram_s2_byteenable (<connected-to-usb_data_ram_s2_byteenable>), //                  .byteenable
		.usb_gpio_s1_address        (<connected-to-usb_gpio_s1_address>),        //       usb_gpio_s1.address
		.usb_gpio_s1_write_n        (<connected-to-usb_gpio_s1_write_n>),        //                  .write_n
		.usb_gpio_s1_writedata      (<connected-to-usb_gpio_s1_writedata>),      //                  .writedata
		.usb_gpio_s1_chipselect     (<connected-to-usb_gpio_s1_chipselect>),     //                  .chipselect
		.usb_gpio_s1_readdata       (<connected-to-usb_gpio_s1_readdata>),       //                  .readdata
		.usb_rx_ram_s1_address      (<connected-to-usb_rx_ram_s1_address>),      //     usb_rx_ram_s1.address
		.usb_rx_ram_s1_clken        (<connected-to-usb_rx_ram_s1_clken>),        //                  .clken
		.usb_rx_ram_s1_chipselect   (<connected-to-usb_rx_ram_s1_chipselect>),   //                  .chipselect
		.usb_rx_ram_s1_write        (<connected-to-usb_rx_ram_s1_write>),        //                  .write
		.usb_rx_ram_s1_readdata     (<connected-to-usb_rx_ram_s1_readdata>),     //                  .readdata
		.usb_rx_ram_s1_writedata    (<connected-to-usb_rx_ram_s1_writedata>),    //                  .writedata
		.usb_rx_ram_s1_byteenable   (<connected-to-usb_rx_ram_s1_byteenable>)    //                  .byteenable
	);

