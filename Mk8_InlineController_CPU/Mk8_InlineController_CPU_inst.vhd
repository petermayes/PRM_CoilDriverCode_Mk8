	component Mk8_InlineController_CPU is
		port (
			altpll_sys_locked_conduit_export                 : out std_logic;                                        -- export
			clk_clk                                          : in  std_logic                     := 'X';             -- clk
			clk_10m_clk                                      : out std_logic;                                        -- clk
			clk_currctrl_fifo_clk                            : in  std_logic                     := 'X';             -- clk
			clk_currctrl_ram_clk                             : in  std_logic                     := 'X';             -- clk
			clk_parameter_ram_clk_clk                        : in  std_logic                     := 'X';             -- clk
			clk_usb_ext_clk_clk                              : in  std_logic                     := 'X';             -- clk
			cpu_clk_clk                                      : out std_logic;                                        -- clk
			currctrl_sys_bridge_acknowledge                  : in  std_logic                     := 'X';             -- acknowledge
			currctrl_sys_bridge_irq                          : in  std_logic                     := 'X';             -- irq
			currctrl_sys_bridge_address                      : out std_logic_vector(6 downto 0);                     -- address
			currctrl_sys_bridge_bus_enable                   : out std_logic;                                        -- bus_enable
			currctrl_sys_bridge_byte_enable                  : out std_logic_vector(3 downto 0);                     -- byte_enable
			currctrl_sys_bridge_rw                           : out std_logic;                                        -- rw
			currctrl_sys_bridge_write_data                   : out std_logic_vector(31 downto 0);                    -- write_data
			currctrl_sys_bridge_read_data                    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- read_data
			currctrl_sys_currctrl_gpio_ext_in_port           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			currctrl_sys_currctrl_gpio_ext_out_port          : out std_logic_vector(31 downto 0);                    -- out_port
			currctrl_sys_register_ram_s2_address             : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			currctrl_sys_register_ram_s2_chipselect          : in  std_logic                     := 'X';             -- chipselect
			currctrl_sys_register_ram_s2_clken               : in  std_logic                     := 'X';             -- clken
			currctrl_sys_register_ram_s2_write               : in  std_logic                     := 'X';             -- write
			currctrl_sys_register_ram_s2_readdata            : out std_logic_vector(31 downto 0);                    -- readdata
			currctrl_sys_register_ram_s2_writedata           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			currctrl_sys_register_ram_s2_byteenable          : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			parameter_sys_crc_init_bridge_acknowledge        : in  std_logic                     := 'X';             -- acknowledge
			parameter_sys_crc_init_bridge_irq                : in  std_logic                     := 'X';             -- irq
			parameter_sys_crc_init_bridge_address            : out std_logic_vector(7 downto 0);                     -- address
			parameter_sys_crc_init_bridge_bus_enable         : out std_logic;                                        -- bus_enable
			parameter_sys_crc_init_bridge_byte_enable        : out std_logic;                                        -- byte_enable
			parameter_sys_crc_init_bridge_rw                 : out std_logic;                                        -- rw
			parameter_sys_crc_init_bridge_write_data         : out std_logic_vector(7 downto 0);                     -- write_data
			parameter_sys_crc_init_bridge_read_data          : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- read_data
			parameter_sys_parameter_gpio_in_port             : in  std_logic                     := 'X';             -- in_port
			parameter_sys_parameter_gpio_out_port            : out std_logic;                                        -- out_port
			parameter_sys_parameter_rx_ram_s2_address        : in  std_logic_vector(10 downto 0) := (others => 'X'); -- address
			parameter_sys_parameter_rx_ram_s2_chipselect     : in  std_logic                     := 'X';             -- chipselect
			parameter_sys_parameter_rx_ram_s2_clken          : in  std_logic                     := 'X';             -- clken
			parameter_sys_parameter_rx_ram_s2_write          : in  std_logic                     := 'X';             -- write
			parameter_sys_parameter_rx_ram_s2_readdata       : out std_logic_vector(31 downto 0);                    -- readdata
			parameter_sys_parameter_rx_ram_s2_writedata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			parameter_sys_parameter_rx_ram_s2_byteenable     : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			parameter_sys_parameter_tx_ram_s2_address        : in  std_logic_vector(10 downto 0) := (others => 'X'); -- address
			parameter_sys_parameter_tx_ram_s2_chipselect     : in  std_logic                     := 'X';             -- chipselect
			parameter_sys_parameter_tx_ram_s2_clken          : in  std_logic                     := 'X';             -- clken
			parameter_sys_parameter_tx_ram_s2_write          : in  std_logic                     := 'X';             -- write
			parameter_sys_parameter_tx_ram_s2_readdata       : out std_logic_vector(31 downto 0);                    -- readdata
			parameter_sys_parameter_tx_ram_s2_writedata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			parameter_sys_parameter_tx_ram_s2_byteenable     : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			parameter_sys_parameterlengthpage_export         : out std_logic_vector(15 downto 0);                    -- export
			pheriphals_led_gpio_external_connection_in_port  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			pheriphals_led_gpio_external_connection_out_port : out std_logic_vector(7 downto 0);                     -- out_port
			pheriphals_tp_gpio_external_connection_export    : out std_logic_vector(7 downto 0);                     -- export
			reset_reset_n                                    : in  std_logic                     := 'X';             -- reset_n
			reset_currctrl_fifo_reset_n                      : in  std_logic                     := 'X';             -- reset_n
			reset_currctrl_ram_reset_n                       : in  std_logic                     := 'X';             -- reset_n
			reset_parameter_ram_clk_reset_n                  : in  std_logic                     := 'X';             -- reset_n
			reset_usb_ext_clk_reset_n                        : in  std_logic                     := 'X';             -- reset_n
			usb_data_sys_usb_data_gpio_in_port               : in  std_logic                     := 'X';             -- in_port
			usb_data_sys_usb_data_gpio_out_port              : out std_logic;                                        -- out_port
			usb_data_sys_usb_data_ram_s2_address             : in  std_logic_vector(10 downto 0) := (others => 'X'); -- address
			usb_data_sys_usb_data_ram_s2_chipselect          : in  std_logic                     := 'X';             -- chipselect
			usb_data_sys_usb_data_ram_s2_clken               : in  std_logic                     := 'X';             -- clken
			usb_data_sys_usb_data_ram_s2_write               : in  std_logic                     := 'X';             -- write
			usb_data_sys_usb_data_ram_s2_readdata            : out std_logic_vector(31 downto 0);                    -- readdata
			usb_data_sys_usb_data_ram_s2_writedata           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			usb_data_sys_usb_data_ram_s2_byteenable          : in  std_logic_vector(3 downto 0)  := (others => 'X')  -- byteenable
		);
	end component Mk8_InlineController_CPU;

	u0 : component Mk8_InlineController_CPU
		port map (
			altpll_sys_locked_conduit_export                 => CONNECTED_TO_altpll_sys_locked_conduit_export,                 --               altpll_sys_locked_conduit.export
			clk_clk                                          => CONNECTED_TO_clk_clk,                                          --                                     clk.clk
			clk_10m_clk                                      => CONNECTED_TO_clk_10m_clk,                                      --                                 clk_10m.clk
			clk_currctrl_fifo_clk                            => CONNECTED_TO_clk_currctrl_fifo_clk,                            --                       clk_currctrl_fifo.clk
			clk_currctrl_ram_clk                             => CONNECTED_TO_clk_currctrl_ram_clk,                             --                        clk_currctrl_ram.clk
			clk_parameter_ram_clk_clk                        => CONNECTED_TO_clk_parameter_ram_clk_clk,                        --                   clk_parameter_ram_clk.clk
			clk_usb_ext_clk_clk                              => CONNECTED_TO_clk_usb_ext_clk_clk,                              --                         clk_usb_ext_clk.clk
			cpu_clk_clk                                      => CONNECTED_TO_cpu_clk_clk,                                      --                                 cpu_clk.clk
			currctrl_sys_bridge_acknowledge                  => CONNECTED_TO_currctrl_sys_bridge_acknowledge,                  --                     currctrl_sys_bridge.acknowledge
			currctrl_sys_bridge_irq                          => CONNECTED_TO_currctrl_sys_bridge_irq,                          --                                        .irq
			currctrl_sys_bridge_address                      => CONNECTED_TO_currctrl_sys_bridge_address,                      --                                        .address
			currctrl_sys_bridge_bus_enable                   => CONNECTED_TO_currctrl_sys_bridge_bus_enable,                   --                                        .bus_enable
			currctrl_sys_bridge_byte_enable                  => CONNECTED_TO_currctrl_sys_bridge_byte_enable,                  --                                        .byte_enable
			currctrl_sys_bridge_rw                           => CONNECTED_TO_currctrl_sys_bridge_rw,                           --                                        .rw
			currctrl_sys_bridge_write_data                   => CONNECTED_TO_currctrl_sys_bridge_write_data,                   --                                        .write_data
			currctrl_sys_bridge_read_data                    => CONNECTED_TO_currctrl_sys_bridge_read_data,                    --                                        .read_data
			currctrl_sys_currctrl_gpio_ext_in_port           => CONNECTED_TO_currctrl_sys_currctrl_gpio_ext_in_port,           --          currctrl_sys_currctrl_gpio_ext.in_port
			currctrl_sys_currctrl_gpio_ext_out_port          => CONNECTED_TO_currctrl_sys_currctrl_gpio_ext_out_port,          --                                        .out_port
			currctrl_sys_register_ram_s2_address             => CONNECTED_TO_currctrl_sys_register_ram_s2_address,             --            currctrl_sys_register_ram_s2.address
			currctrl_sys_register_ram_s2_chipselect          => CONNECTED_TO_currctrl_sys_register_ram_s2_chipselect,          --                                        .chipselect
			currctrl_sys_register_ram_s2_clken               => CONNECTED_TO_currctrl_sys_register_ram_s2_clken,               --                                        .clken
			currctrl_sys_register_ram_s2_write               => CONNECTED_TO_currctrl_sys_register_ram_s2_write,               --                                        .write
			currctrl_sys_register_ram_s2_readdata            => CONNECTED_TO_currctrl_sys_register_ram_s2_readdata,            --                                        .readdata
			currctrl_sys_register_ram_s2_writedata           => CONNECTED_TO_currctrl_sys_register_ram_s2_writedata,           --                                        .writedata
			currctrl_sys_register_ram_s2_byteenable          => CONNECTED_TO_currctrl_sys_register_ram_s2_byteenable,          --                                        .byteenable
			parameter_sys_crc_init_bridge_acknowledge        => CONNECTED_TO_parameter_sys_crc_init_bridge_acknowledge,        --           parameter_sys_crc_init_bridge.acknowledge
			parameter_sys_crc_init_bridge_irq                => CONNECTED_TO_parameter_sys_crc_init_bridge_irq,                --                                        .irq
			parameter_sys_crc_init_bridge_address            => CONNECTED_TO_parameter_sys_crc_init_bridge_address,            --                                        .address
			parameter_sys_crc_init_bridge_bus_enable         => CONNECTED_TO_parameter_sys_crc_init_bridge_bus_enable,         --                                        .bus_enable
			parameter_sys_crc_init_bridge_byte_enable        => CONNECTED_TO_parameter_sys_crc_init_bridge_byte_enable,        --                                        .byte_enable
			parameter_sys_crc_init_bridge_rw                 => CONNECTED_TO_parameter_sys_crc_init_bridge_rw,                 --                                        .rw
			parameter_sys_crc_init_bridge_write_data         => CONNECTED_TO_parameter_sys_crc_init_bridge_write_data,         --                                        .write_data
			parameter_sys_crc_init_bridge_read_data          => CONNECTED_TO_parameter_sys_crc_init_bridge_read_data,          --                                        .read_data
			parameter_sys_parameter_gpio_in_port             => CONNECTED_TO_parameter_sys_parameter_gpio_in_port,             --            parameter_sys_parameter_gpio.in_port
			parameter_sys_parameter_gpio_out_port            => CONNECTED_TO_parameter_sys_parameter_gpio_out_port,            --                                        .out_port
			parameter_sys_parameter_rx_ram_s2_address        => CONNECTED_TO_parameter_sys_parameter_rx_ram_s2_address,        --       parameter_sys_parameter_rx_ram_s2.address
			parameter_sys_parameter_rx_ram_s2_chipselect     => CONNECTED_TO_parameter_sys_parameter_rx_ram_s2_chipselect,     --                                        .chipselect
			parameter_sys_parameter_rx_ram_s2_clken          => CONNECTED_TO_parameter_sys_parameter_rx_ram_s2_clken,          --                                        .clken
			parameter_sys_parameter_rx_ram_s2_write          => CONNECTED_TO_parameter_sys_parameter_rx_ram_s2_write,          --                                        .write
			parameter_sys_parameter_rx_ram_s2_readdata       => CONNECTED_TO_parameter_sys_parameter_rx_ram_s2_readdata,       --                                        .readdata
			parameter_sys_parameter_rx_ram_s2_writedata      => CONNECTED_TO_parameter_sys_parameter_rx_ram_s2_writedata,      --                                        .writedata
			parameter_sys_parameter_rx_ram_s2_byteenable     => CONNECTED_TO_parameter_sys_parameter_rx_ram_s2_byteenable,     --                                        .byteenable
			parameter_sys_parameter_tx_ram_s2_address        => CONNECTED_TO_parameter_sys_parameter_tx_ram_s2_address,        --       parameter_sys_parameter_tx_ram_s2.address
			parameter_sys_parameter_tx_ram_s2_chipselect     => CONNECTED_TO_parameter_sys_parameter_tx_ram_s2_chipselect,     --                                        .chipselect
			parameter_sys_parameter_tx_ram_s2_clken          => CONNECTED_TO_parameter_sys_parameter_tx_ram_s2_clken,          --                                        .clken
			parameter_sys_parameter_tx_ram_s2_write          => CONNECTED_TO_parameter_sys_parameter_tx_ram_s2_write,          --                                        .write
			parameter_sys_parameter_tx_ram_s2_readdata       => CONNECTED_TO_parameter_sys_parameter_tx_ram_s2_readdata,       --                                        .readdata
			parameter_sys_parameter_tx_ram_s2_writedata      => CONNECTED_TO_parameter_sys_parameter_tx_ram_s2_writedata,      --                                        .writedata
			parameter_sys_parameter_tx_ram_s2_byteenable     => CONNECTED_TO_parameter_sys_parameter_tx_ram_s2_byteenable,     --                                        .byteenable
			parameter_sys_parameterlengthpage_export         => CONNECTED_TO_parameter_sys_parameterlengthpage_export,         --       parameter_sys_parameterlengthpage.export
			pheriphals_led_gpio_external_connection_in_port  => CONNECTED_TO_pheriphals_led_gpio_external_connection_in_port,  -- pheriphals_led_gpio_external_connection.in_port
			pheriphals_led_gpio_external_connection_out_port => CONNECTED_TO_pheriphals_led_gpio_external_connection_out_port, --                                        .out_port
			pheriphals_tp_gpio_external_connection_export    => CONNECTED_TO_pheriphals_tp_gpio_external_connection_export,    --  pheriphals_tp_gpio_external_connection.export
			reset_reset_n                                    => CONNECTED_TO_reset_reset_n,                                    --                                   reset.reset_n
			reset_currctrl_fifo_reset_n                      => CONNECTED_TO_reset_currctrl_fifo_reset_n,                      --                     reset_currctrl_fifo.reset_n
			reset_currctrl_ram_reset_n                       => CONNECTED_TO_reset_currctrl_ram_reset_n,                       --                      reset_currctrl_ram.reset_n
			reset_parameter_ram_clk_reset_n                  => CONNECTED_TO_reset_parameter_ram_clk_reset_n,                  --                 reset_parameter_ram_clk.reset_n
			reset_usb_ext_clk_reset_n                        => CONNECTED_TO_reset_usb_ext_clk_reset_n,                        --                       reset_usb_ext_clk.reset_n
			usb_data_sys_usb_data_gpio_in_port               => CONNECTED_TO_usb_data_sys_usb_data_gpio_in_port,               --              usb_data_sys_usb_data_gpio.in_port
			usb_data_sys_usb_data_gpio_out_port              => CONNECTED_TO_usb_data_sys_usb_data_gpio_out_port,              --                                        .out_port
			usb_data_sys_usb_data_ram_s2_address             => CONNECTED_TO_usb_data_sys_usb_data_ram_s2_address,             --            usb_data_sys_usb_data_ram_s2.address
			usb_data_sys_usb_data_ram_s2_chipselect          => CONNECTED_TO_usb_data_sys_usb_data_ram_s2_chipselect,          --                                        .chipselect
			usb_data_sys_usb_data_ram_s2_clken               => CONNECTED_TO_usb_data_sys_usb_data_ram_s2_clken,               --                                        .clken
			usb_data_sys_usb_data_ram_s2_write               => CONNECTED_TO_usb_data_sys_usb_data_ram_s2_write,               --                                        .write
			usb_data_sys_usb_data_ram_s2_readdata            => CONNECTED_TO_usb_data_sys_usb_data_ram_s2_readdata,            --                                        .readdata
			usb_data_sys_usb_data_ram_s2_writedata           => CONNECTED_TO_usb_data_sys_usb_data_ram_s2_writedata,           --                                        .writedata
			usb_data_sys_usb_data_ram_s2_byteenable          => CONNECTED_TO_usb_data_sys_usb_data_ram_s2_byteenable           --                                        .byteenable
		);

