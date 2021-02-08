// Mk8_InlineController_CPU_TimerSYS.v

// Generated using ACDS version 18.1 646

`timescale 1 ps / 1 ps
module Mk8_InlineController_CPU_TimerSYS (
		output wire        timer_0_irq_irq,       // timer_0_irq.irq
		input  wire [2:0]  timer_0_s1_address,    //  timer_0_s1.address
		input  wire [15:0] timer_0_s1_writedata,  //            .writedata
		output wire [15:0] timer_0_s1_readdata,   //            .readdata
		input  wire        timer_0_s1_chipselect, //            .chipselect
		input  wire        timer_0_s1_write_n,    //            .write_n
		output wire        timer_1_irq_irq,       // timer_1_irq.irq
		input  wire [2:0]  timer_1_s1_address,    //  timer_1_s1.address
		input  wire [15:0] timer_1_s1_writedata,  //            .writedata
		output wire [15:0] timer_1_s1_readdata,   //            .readdata
		input  wire        timer_1_s1_chipselect, //            .chipselect
		input  wire        timer_1_s1_write_n,    //            .write_n
		output wire        timer_2_irq_irq,       // timer_2_irq.irq
		input  wire [2:0]  timer_2_s1_address,    //  timer_2_s1.address
		input  wire [15:0] timer_2_s1_writedata,  //            .writedata
		output wire [15:0] timer_2_s1_readdata,   //            .readdata
		input  wire        timer_2_s1_chipselect, //            .chipselect
		input  wire        timer_2_s1_write_n,    //            .write_n
		input  wire        timer_clk_clk,         //   timer_clk.clk
		input  wire        timer_reset_reset_n    // timer_reset.reset_n
	);

	wire    rst_controller_reset_out_reset; // rst_controller:reset_out -> [timer_0:reset_n, timer_1:reset_n, timer_2:reset_n]

	Mk8_InlineController_CPU_TimerSYS_timer_0 timer_0 (
		.clk        (timer_clk_clk),                   //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset), // reset.reset_n
		.address    (timer_0_s1_address),              //    s1.address
		.writedata  (timer_0_s1_writedata),            //      .writedata
		.readdata   (timer_0_s1_readdata),             //      .readdata
		.chipselect (timer_0_s1_chipselect),           //      .chipselect
		.write_n    (timer_0_s1_write_n),              //      .write_n
		.irq        (timer_0_irq_irq)                  //   irq.irq
	);

	Mk8_InlineController_CPU_TimerSYS_timer_0 timer_1 (
		.clk        (timer_clk_clk),                   //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset), // reset.reset_n
		.address    (timer_1_s1_address),              //    s1.address
		.writedata  (timer_1_s1_writedata),            //      .writedata
		.readdata   (timer_1_s1_readdata),             //      .readdata
		.chipselect (timer_1_s1_chipselect),           //      .chipselect
		.write_n    (timer_1_s1_write_n),              //      .write_n
		.irq        (timer_1_irq_irq)                  //   irq.irq
	);

	Mk8_InlineController_CPU_TimerSYS_timer_0 timer_2 (
		.clk        (timer_clk_clk),                   //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset), // reset.reset_n
		.address    (timer_2_s1_address),              //    s1.address
		.writedata  (timer_2_s1_writedata),            //      .writedata
		.readdata   (timer_2_s1_readdata),             //      .readdata
		.chipselect (timer_2_s1_chipselect),           //      .chipselect
		.write_n    (timer_2_s1_write_n),              //      .write_n
		.irq        (timer_2_irq_irq)                  //   irq.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~timer_reset_reset_n),           // reset_in0.reset
		.clk            (timer_clk_clk),                  //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule