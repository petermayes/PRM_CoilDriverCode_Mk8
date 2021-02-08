// USB_Comms_SYS.v

// Generated using ACDS version 18.1 646

`timescale 1 ps / 1 ps
module USB_Comms_SYS (
		input  wire        clk_usb_ext_clk_clk,        //   clk_usb_ext_clk.clk
		input  wire        cpu_clk_clk,                //           cpu_clk.clk
		input  wire        cpu_reset_reset_n,          //         cpu_reset.reset_n
		input  wire        pheriphal_clk_clk,          //     pheriphal_clk.clk
		input  wire        pheriphal_reset_reset_n,    //   pheriphal_reset.reset_n
		input  wire        reset_usb_ext_clk_reset_n,  // reset_usb_ext_clk.reset_n
		input  wire        usb_data_gpio_in_port,      //     usb_data_gpio.in_port
		output wire        usb_data_gpio_out_port,     //                  .out_port
		output wire        usb_data_gpio_irq_irq,      // usb_data_gpio_irq.irq
		input  wire [10:0] usb_data_ram_s2_address,    //   usb_data_ram_s2.address
		input  wire        usb_data_ram_s2_chipselect, //                  .chipselect
		input  wire        usb_data_ram_s2_clken,      //                  .clken
		input  wire        usb_data_ram_s2_write,      //                  .write
		output wire [31:0] usb_data_ram_s2_readdata,   //                  .readdata
		input  wire [31:0] usb_data_ram_s2_writedata,  //                  .writedata
		input  wire [3:0]  usb_data_ram_s2_byteenable, //                  .byteenable
		input  wire [2:0]  usb_gpio_s1_address,        //       usb_gpio_s1.address
		input  wire        usb_gpio_s1_write_n,        //                  .write_n
		input  wire [31:0] usb_gpio_s1_writedata,      //                  .writedata
		input  wire        usb_gpio_s1_chipselect,     //                  .chipselect
		output wire [31:0] usb_gpio_s1_readdata,       //                  .readdata
		input  wire [10:0] usb_rx_ram_s1_address,      //     usb_rx_ram_s1.address
		input  wire        usb_rx_ram_s1_clken,        //                  .clken
		input  wire        usb_rx_ram_s1_chipselect,   //                  .chipselect
		input  wire        usb_rx_ram_s1_write,        //                  .write
		output wire [31:0] usb_rx_ram_s1_readdata,     //                  .readdata
		input  wire [31:0] usb_rx_ram_s1_writedata,    //                  .writedata
		input  wire [3:0]  usb_rx_ram_s1_byteenable    //                  .byteenable
	);

	wire    rst_controller_reset_out_reset;         // rst_controller:reset_out -> USB_GPIO:reset_n
	wire    rst_controller_001_reset_out_reset;     // rst_controller_001:reset_out -> USB_RX_RAM:reset
	wire    rst_controller_001_reset_out_reset_req; // rst_controller_001:reset_req -> USB_RX_RAM:reset_req
	wire    rst_controller_002_reset_out_reset;     // rst_controller_002:reset_out -> USB_RX_RAM:reset2
	wire    rst_controller_002_reset_out_reset_req; // rst_controller_002:reset_req -> USB_RX_RAM:reset_req2

	USB_Comms_SYS_USB_GPIO usb_gpio (
		.clk        (pheriphal_clk_clk),               //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset), //               reset.reset_n
		.address    (usb_gpio_s1_address),             //                  s1.address
		.write_n    (usb_gpio_s1_write_n),             //                    .write_n
		.writedata  (usb_gpio_s1_writedata),           //                    .writedata
		.chipselect (usb_gpio_s1_chipselect),          //                    .chipselect
		.readdata   (usb_gpio_s1_readdata),            //                    .readdata
		.in_port    (usb_data_gpio_in_port),           // external_connection.export
		.out_port   (usb_data_gpio_out_port),          //                    .export
		.irq        (usb_data_gpio_irq_irq)            //                 irq.irq
	);

	USB_Comms_SYS_USB_RX_RAM usb_rx_ram (
		.clk         (cpu_clk_clk),                            //   clk1.clk
		.address     (usb_rx_ram_s1_address),                  //     s1.address
		.clken       (usb_rx_ram_s1_clken),                    //       .clken
		.chipselect  (usb_rx_ram_s1_chipselect),               //       .chipselect
		.write       (usb_rx_ram_s1_write),                    //       .write
		.readdata    (usb_rx_ram_s1_readdata),                 //       .readdata
		.writedata   (usb_rx_ram_s1_writedata),                //       .writedata
		.byteenable  (usb_rx_ram_s1_byteenable),               //       .byteenable
		.reset       (rst_controller_001_reset_out_reset),     // reset1.reset
		.reset_req   (rst_controller_001_reset_out_reset_req), //       .reset_req
		.address2    (usb_data_ram_s2_address),                //     s2.address
		.chipselect2 (usb_data_ram_s2_chipselect),             //       .chipselect
		.clken2      (usb_data_ram_s2_clken),                  //       .clken
		.write2      (usb_data_ram_s2_write),                  //       .write
		.readdata2   (usb_data_ram_s2_readdata),               //       .readdata
		.writedata2  (usb_data_ram_s2_writedata),              //       .writedata
		.byteenable2 (usb_data_ram_s2_byteenable),             //       .byteenable
		.clk2        (clk_usb_ext_clk_clk),                    //   clk2.clk
		.reset2      (rst_controller_002_reset_out_reset),     // reset2.reset
		.reset_req2  (rst_controller_002_reset_out_reset_req), //       .reset_req
		.freeze      (1'b0)                                    // (terminated)
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
		.reset_in0      (~pheriphal_reset_reset_n),       // reset_in0.reset
		.clk            (pheriphal_clk_clk),              //       clk.clk
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

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
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
	) rst_controller_001 (
		.reset_in0      (~cpu_reset_reset_n),                     // reset_in0.reset
		.clk            (cpu_clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_001_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                                   // (terminated)
		.reset_in1      (1'b0),                                   // (terminated)
		.reset_req_in1  (1'b0),                                   // (terminated)
		.reset_in2      (1'b0),                                   // (terminated)
		.reset_req_in2  (1'b0),                                   // (terminated)
		.reset_in3      (1'b0),                                   // (terminated)
		.reset_req_in3  (1'b0),                                   // (terminated)
		.reset_in4      (1'b0),                                   // (terminated)
		.reset_req_in4  (1'b0),                                   // (terminated)
		.reset_in5      (1'b0),                                   // (terminated)
		.reset_req_in5  (1'b0),                                   // (terminated)
		.reset_in6      (1'b0),                                   // (terminated)
		.reset_req_in6  (1'b0),                                   // (terminated)
		.reset_in7      (1'b0),                                   // (terminated)
		.reset_req_in7  (1'b0),                                   // (terminated)
		.reset_in8      (1'b0),                                   // (terminated)
		.reset_req_in8  (1'b0),                                   // (terminated)
		.reset_in9      (1'b0),                                   // (terminated)
		.reset_req_in9  (1'b0),                                   // (terminated)
		.reset_in10     (1'b0),                                   // (terminated)
		.reset_req_in10 (1'b0),                                   // (terminated)
		.reset_in11     (1'b0),                                   // (terminated)
		.reset_req_in11 (1'b0),                                   // (terminated)
		.reset_in12     (1'b0),                                   // (terminated)
		.reset_req_in12 (1'b0),                                   // (terminated)
		.reset_in13     (1'b0),                                   // (terminated)
		.reset_req_in13 (1'b0),                                   // (terminated)
		.reset_in14     (1'b0),                                   // (terminated)
		.reset_req_in14 (1'b0),                                   // (terminated)
		.reset_in15     (1'b0),                                   // (terminated)
		.reset_req_in15 (1'b0)                                    // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
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
	) rst_controller_002 (
		.reset_in0      (~reset_usb_ext_clk_reset_n),             // reset_in0.reset
		.clk            (clk_usb_ext_clk_clk),                    //       clk.clk
		.reset_out      (rst_controller_002_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_002_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                                   // (terminated)
		.reset_in1      (1'b0),                                   // (terminated)
		.reset_req_in1  (1'b0),                                   // (terminated)
		.reset_in2      (1'b0),                                   // (terminated)
		.reset_req_in2  (1'b0),                                   // (terminated)
		.reset_in3      (1'b0),                                   // (terminated)
		.reset_req_in3  (1'b0),                                   // (terminated)
		.reset_in4      (1'b0),                                   // (terminated)
		.reset_req_in4  (1'b0),                                   // (terminated)
		.reset_in5      (1'b0),                                   // (terminated)
		.reset_req_in5  (1'b0),                                   // (terminated)
		.reset_in6      (1'b0),                                   // (terminated)
		.reset_req_in6  (1'b0),                                   // (terminated)
		.reset_in7      (1'b0),                                   // (terminated)
		.reset_req_in7  (1'b0),                                   // (terminated)
		.reset_in8      (1'b0),                                   // (terminated)
		.reset_req_in8  (1'b0),                                   // (terminated)
		.reset_in9      (1'b0),                                   // (terminated)
		.reset_req_in9  (1'b0),                                   // (terminated)
		.reset_in10     (1'b0),                                   // (terminated)
		.reset_req_in10 (1'b0),                                   // (terminated)
		.reset_in11     (1'b0),                                   // (terminated)
		.reset_req_in11 (1'b0),                                   // (terminated)
		.reset_in12     (1'b0),                                   // (terminated)
		.reset_req_in12 (1'b0),                                   // (terminated)
		.reset_in13     (1'b0),                                   // (terminated)
		.reset_req_in13 (1'b0),                                   // (terminated)
		.reset_in14     (1'b0),                                   // (terminated)
		.reset_req_in14 (1'b0),                                   // (terminated)
		.reset_in15     (1'b0),                                   // (terminated)
		.reset_req_in15 (1'b0)                                    // (terminated)
	);

endmodule
