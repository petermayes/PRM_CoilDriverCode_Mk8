	component Pararameter_Comms_SYS is
		port (
			clk_ext_ram_clk                                : in  std_logic                     := 'X';             -- clk
			parameter_gpio_s1_address                      : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			parameter_gpio_s1_write_n                      : in  std_logic                     := 'X';             -- write_n
			parameter_gpio_s1_writedata                    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			parameter_gpio_s1_chipselect                   : in  std_logic                     := 'X';             -- chipselect
			parameter_gpio_s1_readdata                     : out std_logic_vector(31 downto 0);                    -- readdata
			parameter_loop_gpio_irq_irq                    : out std_logic;                                        -- irq
			reset_ext_ram_reset_n                          : in  std_logic                     := 'X';             -- reset_n
			parameter_rx_ram_s1_address                    : in  std_logic_vector(10 downto 0) := (others => 'X'); -- address
			parameter_rx_ram_s1_clken                      : in  std_logic                     := 'X';             -- clken
			parameter_rx_ram_s1_chipselect                 : in  std_logic                     := 'X';             -- chipselect
			parameter_rx_ram_s1_write                      : in  std_logic                     := 'X';             -- write
			parameter_rx_ram_s1_readdata                   : out std_logic_vector(31 downto 0);                    -- readdata
			parameter_rx_ram_s1_writedata                  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			parameter_rx_ram_s1_byteenable                 : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			parameter_rx_ram_s2_address                    : in  std_logic_vector(10 downto 0) := (others => 'X'); -- address
			parameter_rx_ram_s2_chipselect                 : in  std_logic                     := 'X';             -- chipselect
			parameter_rx_ram_s2_clken                      : in  std_logic                     := 'X';             -- clken
			parameter_rx_ram_s2_write                      : in  std_logic                     := 'X';             -- write
			parameter_rx_ram_s2_readdata                   : out std_logic_vector(31 downto 0);                    -- readdata
			parameter_rx_ram_s2_writedata                  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			parameter_rx_ram_s2_byteenable                 : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			parameter_tx_ram_s1_address                    : in  std_logic_vector(10 downto 0) := (others => 'X'); -- address
			parameter_tx_ram_s1_clken                      : in  std_logic                     := 'X';             -- clken
			parameter_tx_ram_s1_chipselect                 : in  std_logic                     := 'X';             -- chipselect
			parameter_tx_ram_s1_write                      : in  std_logic                     := 'X';             -- write
			parameter_tx_ram_s1_readdata                   : out std_logic_vector(31 downto 0);                    -- readdata
			parameter_tx_ram_s1_writedata                  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			parameter_tx_ram_s1_byteenable                 : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			parameter_tx_ram_s2_address                    : in  std_logic_vector(10 downto 0) := (others => 'X'); -- address
			parameter_tx_ram_s2_chipselect                 : in  std_logic                     := 'X';             -- chipselect
			parameter_tx_ram_s2_clken                      : in  std_logic                     := 'X';             -- clken
			parameter_tx_ram_s2_write                      : in  std_logic                     := 'X';             -- write
			parameter_tx_ram_s2_readdata                   : out std_logic_vector(31 downto 0);                    -- readdata
			parameter_tx_ram_s2_writedata                  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			parameter_tx_ram_s2_byteenable                 : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			parameterlengthpage_export                     : out std_logic_vector(15 downto 0);                    -- export
			parameterlengthpage_s1_address                 : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			parameterlengthpage_s1_write_n                 : in  std_logic                     := 'X';             -- write_n
			parameterlengthpage_s1_writedata               : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			parameterlengthpage_s1_chipselect              : in  std_logic                     := 'X';             -- chipselect
			parameterlengthpage_s1_readdata                : out std_logic_vector(31 downto 0);                    -- readdata
			pheriphal_clk_clk                              : in  std_logic                     := 'X';             -- clk
			pheriphal_reset_reset_n                        : in  std_logic                     := 'X';             -- reset_n
			cpu_clk_clk                                    : in  std_logic                     := 'X';             -- clk
			cpu_reset_reset_n                              : in  std_logic                     := 'X';             -- reset_n
			parameter_gpio_external_in_port                : in  std_logic                     := 'X';             -- in_port
			parameter_gpio_external_out_port               : out std_logic;                                        -- out_port
			crc_init_bridge_avalon_slave_address           : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			crc_init_bridge_avalon_slave_byteenable        : in  std_logic                     := 'X';             -- byteenable
			crc_init_bridge_avalon_slave_chipselect        : in  std_logic                     := 'X';             -- chipselect
			crc_init_bridge_avalon_slave_read              : in  std_logic                     := 'X';             -- read
			crc_init_bridge_avalon_slave_write             : in  std_logic                     := 'X';             -- write
			crc_init_bridge_avalon_slave_writedata         : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- writedata
			crc_init_bridge_avalon_slave_readdata          : out std_logic_vector(7 downto 0);                     -- readdata
			crc_init_bridge_avalon_slave_waitrequest       : out std_logic;                                        -- waitrequest
			crc_init_bridge_interrupt_irq                  : out std_logic;                                        -- irq
			crc_init_bridge_external_interface_acknowledge : in  std_logic                     := 'X';             -- acknowledge
			crc_init_bridge_external_interface_irq         : in  std_logic                     := 'X';             -- irq
			crc_init_bridge_external_interface_address     : out std_logic_vector(7 downto 0);                     -- address
			crc_init_bridge_external_interface_bus_enable  : out std_logic;                                        -- bus_enable
			crc_init_bridge_external_interface_byte_enable : out std_logic;                                        -- byte_enable
			crc_init_bridge_external_interface_rw          : out std_logic;                                        -- rw
			crc_init_bridge_external_interface_write_data  : out std_logic_vector(7 downto 0);                     -- write_data
			crc_init_bridge_external_interface_read_data   : in  std_logic_vector(7 downto 0)  := (others => 'X')  -- read_data
		);
	end component Pararameter_Comms_SYS;

	u0 : component Pararameter_Comms_SYS
		port map (
			clk_ext_ram_clk                                => CONNECTED_TO_clk_ext_ram_clk,                                --                        clk_ext_ram.clk
			parameter_gpio_s1_address                      => CONNECTED_TO_parameter_gpio_s1_address,                      --                  parameter_gpio_s1.address
			parameter_gpio_s1_write_n                      => CONNECTED_TO_parameter_gpio_s1_write_n,                      --                                   .write_n
			parameter_gpio_s1_writedata                    => CONNECTED_TO_parameter_gpio_s1_writedata,                    --                                   .writedata
			parameter_gpio_s1_chipselect                   => CONNECTED_TO_parameter_gpio_s1_chipselect,                   --                                   .chipselect
			parameter_gpio_s1_readdata                     => CONNECTED_TO_parameter_gpio_s1_readdata,                     --                                   .readdata
			parameter_loop_gpio_irq_irq                    => CONNECTED_TO_parameter_loop_gpio_irq_irq,                    --            parameter_loop_gpio_irq.irq
			reset_ext_ram_reset_n                          => CONNECTED_TO_reset_ext_ram_reset_n,                          --                      reset_ext_ram.reset_n
			parameter_rx_ram_s1_address                    => CONNECTED_TO_parameter_rx_ram_s1_address,                    --                parameter_rx_ram_s1.address
			parameter_rx_ram_s1_clken                      => CONNECTED_TO_parameter_rx_ram_s1_clken,                      --                                   .clken
			parameter_rx_ram_s1_chipselect                 => CONNECTED_TO_parameter_rx_ram_s1_chipselect,                 --                                   .chipselect
			parameter_rx_ram_s1_write                      => CONNECTED_TO_parameter_rx_ram_s1_write,                      --                                   .write
			parameter_rx_ram_s1_readdata                   => CONNECTED_TO_parameter_rx_ram_s1_readdata,                   --                                   .readdata
			parameter_rx_ram_s1_writedata                  => CONNECTED_TO_parameter_rx_ram_s1_writedata,                  --                                   .writedata
			parameter_rx_ram_s1_byteenable                 => CONNECTED_TO_parameter_rx_ram_s1_byteenable,                 --                                   .byteenable
			parameter_rx_ram_s2_address                    => CONNECTED_TO_parameter_rx_ram_s2_address,                    --                parameter_rx_ram_s2.address
			parameter_rx_ram_s2_chipselect                 => CONNECTED_TO_parameter_rx_ram_s2_chipselect,                 --                                   .chipselect
			parameter_rx_ram_s2_clken                      => CONNECTED_TO_parameter_rx_ram_s2_clken,                      --                                   .clken
			parameter_rx_ram_s2_write                      => CONNECTED_TO_parameter_rx_ram_s2_write,                      --                                   .write
			parameter_rx_ram_s2_readdata                   => CONNECTED_TO_parameter_rx_ram_s2_readdata,                   --                                   .readdata
			parameter_rx_ram_s2_writedata                  => CONNECTED_TO_parameter_rx_ram_s2_writedata,                  --                                   .writedata
			parameter_rx_ram_s2_byteenable                 => CONNECTED_TO_parameter_rx_ram_s2_byteenable,                 --                                   .byteenable
			parameter_tx_ram_s1_address                    => CONNECTED_TO_parameter_tx_ram_s1_address,                    --                parameter_tx_ram_s1.address
			parameter_tx_ram_s1_clken                      => CONNECTED_TO_parameter_tx_ram_s1_clken,                      --                                   .clken
			parameter_tx_ram_s1_chipselect                 => CONNECTED_TO_parameter_tx_ram_s1_chipselect,                 --                                   .chipselect
			parameter_tx_ram_s1_write                      => CONNECTED_TO_parameter_tx_ram_s1_write,                      --                                   .write
			parameter_tx_ram_s1_readdata                   => CONNECTED_TO_parameter_tx_ram_s1_readdata,                   --                                   .readdata
			parameter_tx_ram_s1_writedata                  => CONNECTED_TO_parameter_tx_ram_s1_writedata,                  --                                   .writedata
			parameter_tx_ram_s1_byteenable                 => CONNECTED_TO_parameter_tx_ram_s1_byteenable,                 --                                   .byteenable
			parameter_tx_ram_s2_address                    => CONNECTED_TO_parameter_tx_ram_s2_address,                    --                parameter_tx_ram_s2.address
			parameter_tx_ram_s2_chipselect                 => CONNECTED_TO_parameter_tx_ram_s2_chipselect,                 --                                   .chipselect
			parameter_tx_ram_s2_clken                      => CONNECTED_TO_parameter_tx_ram_s2_clken,                      --                                   .clken
			parameter_tx_ram_s2_write                      => CONNECTED_TO_parameter_tx_ram_s2_write,                      --                                   .write
			parameter_tx_ram_s2_readdata                   => CONNECTED_TO_parameter_tx_ram_s2_readdata,                   --                                   .readdata
			parameter_tx_ram_s2_writedata                  => CONNECTED_TO_parameter_tx_ram_s2_writedata,                  --                                   .writedata
			parameter_tx_ram_s2_byteenable                 => CONNECTED_TO_parameter_tx_ram_s2_byteenable,                 --                                   .byteenable
			parameterlengthpage_export                     => CONNECTED_TO_parameterlengthpage_export,                     --                parameterlengthpage.export
			parameterlengthpage_s1_address                 => CONNECTED_TO_parameterlengthpage_s1_address,                 --             parameterlengthpage_s1.address
			parameterlengthpage_s1_write_n                 => CONNECTED_TO_parameterlengthpage_s1_write_n,                 --                                   .write_n
			parameterlengthpage_s1_writedata               => CONNECTED_TO_parameterlengthpage_s1_writedata,               --                                   .writedata
			parameterlengthpage_s1_chipselect              => CONNECTED_TO_parameterlengthpage_s1_chipselect,              --                                   .chipselect
			parameterlengthpage_s1_readdata                => CONNECTED_TO_parameterlengthpage_s1_readdata,                --                                   .readdata
			pheriphal_clk_clk                              => CONNECTED_TO_pheriphal_clk_clk,                              --                      pheriphal_clk.clk
			pheriphal_reset_reset_n                        => CONNECTED_TO_pheriphal_reset_reset_n,                        --                    pheriphal_reset.reset_n
			cpu_clk_clk                                    => CONNECTED_TO_cpu_clk_clk,                                    --                            cpu_clk.clk
			cpu_reset_reset_n                              => CONNECTED_TO_cpu_reset_reset_n,                              --                          cpu_reset.reset_n
			parameter_gpio_external_in_port                => CONNECTED_TO_parameter_gpio_external_in_port,                --            parameter_gpio_external.in_port
			parameter_gpio_external_out_port               => CONNECTED_TO_parameter_gpio_external_out_port,               --                                   .out_port
			crc_init_bridge_avalon_slave_address           => CONNECTED_TO_crc_init_bridge_avalon_slave_address,           --       crc_init_bridge_avalon_slave.address
			crc_init_bridge_avalon_slave_byteenable        => CONNECTED_TO_crc_init_bridge_avalon_slave_byteenable,        --                                   .byteenable
			crc_init_bridge_avalon_slave_chipselect        => CONNECTED_TO_crc_init_bridge_avalon_slave_chipselect,        --                                   .chipselect
			crc_init_bridge_avalon_slave_read              => CONNECTED_TO_crc_init_bridge_avalon_slave_read,              --                                   .read
			crc_init_bridge_avalon_slave_write             => CONNECTED_TO_crc_init_bridge_avalon_slave_write,             --                                   .write
			crc_init_bridge_avalon_slave_writedata         => CONNECTED_TO_crc_init_bridge_avalon_slave_writedata,         --                                   .writedata
			crc_init_bridge_avalon_slave_readdata          => CONNECTED_TO_crc_init_bridge_avalon_slave_readdata,          --                                   .readdata
			crc_init_bridge_avalon_slave_waitrequest       => CONNECTED_TO_crc_init_bridge_avalon_slave_waitrequest,       --                                   .waitrequest
			crc_init_bridge_interrupt_irq                  => CONNECTED_TO_crc_init_bridge_interrupt_irq,                  --          crc_init_bridge_interrupt.irq
			crc_init_bridge_external_interface_acknowledge => CONNECTED_TO_crc_init_bridge_external_interface_acknowledge, -- crc_init_bridge_external_interface.acknowledge
			crc_init_bridge_external_interface_irq         => CONNECTED_TO_crc_init_bridge_external_interface_irq,         --                                   .irq
			crc_init_bridge_external_interface_address     => CONNECTED_TO_crc_init_bridge_external_interface_address,     --                                   .address
			crc_init_bridge_external_interface_bus_enable  => CONNECTED_TO_crc_init_bridge_external_interface_bus_enable,  --                                   .bus_enable
			crc_init_bridge_external_interface_byte_enable => CONNECTED_TO_crc_init_bridge_external_interface_byte_enable, --                                   .byte_enable
			crc_init_bridge_external_interface_rw          => CONNECTED_TO_crc_init_bridge_external_interface_rw,          --                                   .rw
			crc_init_bridge_external_interface_write_data  => CONNECTED_TO_crc_init_bridge_external_interface_write_data,  --                                   .write_data
			crc_init_bridge_external_interface_read_data   => CONNECTED_TO_crc_init_bridge_external_interface_read_data    --                                   .read_data
		);

