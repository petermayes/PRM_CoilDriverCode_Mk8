	subsystemA u0 (
		.led_gpio_external_connection_in_port  (<connected-to-led_gpio_external_connection_in_port>),  // led_gpio_external_connection.in_port
		.led_gpio_external_connection_out_port (<connected-to-led_gpio_external_connection_out_port>), //                             .out_port
		.led_gpio_s1_address                   (<connected-to-led_gpio_s1_address>),                   //                  led_gpio_s1.address
		.led_gpio_s1_write_n                   (<connected-to-led_gpio_s1_write_n>),                   //                             .write_n
		.led_gpio_s1_writedata                 (<connected-to-led_gpio_s1_writedata>),                 //                             .writedata
		.led_gpio_s1_chipselect                (<connected-to-led_gpio_s1_chipselect>),                //                             .chipselect
		.led_gpio_s1_readdata                  (<connected-to-led_gpio_s1_readdata>),                  //                             .readdata
		.pheriphal_clk_clk                     (<connected-to-pheriphal_clk_clk>),                     //                pheriphal_clk.clk
		.pheriphal_reset_reset_n               (<connected-to-pheriphal_reset_reset_n>),               //              pheriphal_reset.reset_n
		.tp_gpio_external_connection_export    (<connected-to-tp_gpio_external_connection_export>),    //  tp_gpio_external_connection.export
		.tp_gpio_s1_address                    (<connected-to-tp_gpio_s1_address>),                    //                   tp_gpio_s1.address
		.tp_gpio_s1_write_n                    (<connected-to-tp_gpio_s1_write_n>),                    //                             .write_n
		.tp_gpio_s1_writedata                  (<connected-to-tp_gpio_s1_writedata>),                  //                             .writedata
		.tp_gpio_s1_chipselect                 (<connected-to-tp_gpio_s1_chipselect>),                 //                             .chipselect
		.tp_gpio_s1_readdata                   (<connected-to-tp_gpio_s1_readdata>)                    //                             .readdata
	);

