	TimerSYS u0 (
		.timer_0_irq_irq       (<connected-to-timer_0_irq_irq>),       // timer_0_irq.irq
		.timer_1_irq_irq       (<connected-to-timer_1_irq_irq>),       // timer_1_irq.irq
		.timer_2_irq_irq       (<connected-to-timer_2_irq_irq>),       // timer_2_irq.irq
		.timer_clk_clk         (<connected-to-timer_clk_clk>),         //   timer_clk.clk
		.timer_reset_reset_n   (<connected-to-timer_reset_reset_n>),   // timer_reset.reset_n
		.timer_0_s1_address    (<connected-to-timer_0_s1_address>),    //  timer_0_s1.address
		.timer_0_s1_writedata  (<connected-to-timer_0_s1_writedata>),  //            .writedata
		.timer_0_s1_readdata   (<connected-to-timer_0_s1_readdata>),   //            .readdata
		.timer_0_s1_chipselect (<connected-to-timer_0_s1_chipselect>), //            .chipselect
		.timer_0_s1_write_n    (<connected-to-timer_0_s1_write_n>),    //            .write_n
		.timer_1_s1_address    (<connected-to-timer_1_s1_address>),    //  timer_1_s1.address
		.timer_1_s1_writedata  (<connected-to-timer_1_s1_writedata>),  //            .writedata
		.timer_1_s1_readdata   (<connected-to-timer_1_s1_readdata>),   //            .readdata
		.timer_1_s1_chipselect (<connected-to-timer_1_s1_chipselect>), //            .chipselect
		.timer_1_s1_write_n    (<connected-to-timer_1_s1_write_n>),    //            .write_n
		.timer_2_s1_address    (<connected-to-timer_2_s1_address>),    //  timer_2_s1.address
		.timer_2_s1_writedata  (<connected-to-timer_2_s1_writedata>),  //            .writedata
		.timer_2_s1_readdata   (<connected-to-timer_2_s1_readdata>),   //            .readdata
		.timer_2_s1_chipselect (<connected-to-timer_2_s1_chipselect>), //            .chipselect
		.timer_2_s1_write_n    (<connected-to-timer_2_s1_write_n>)     //            .write_n
	);

