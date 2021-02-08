	component CurrCTRL_SYS is
		port (
			clk_currctrl_sys_fifo_clk                   : in  std_logic                     := 'X';             -- clk
			clk_currctrl_sys_ram_clk                    : in  std_logic                     := 'X';             -- clk
			clk_pheripal_clk                            : in  std_logic                     := 'X';             -- clk
			cpu_clk_clk                                 : in  std_logic                     := 'X';             -- clk
			cpu_reset_reset_n                           : in  std_logic                     := 'X';             -- reset_n
			currctrl_gpio_ext_in_port                   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			currctrl_gpio_ext_out_port                  : out std_logic_vector(31 downto 0);                    -- out_port
			currctrl_gpio_s1_address                    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			currctrl_gpio_s1_write_n                    : in  std_logic                     := 'X';             -- write_n
			currctrl_gpio_s1_writedata                  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			currctrl_gpio_s1_chipselect                 : in  std_logic                     := 'X';             -- chipselect
			currctrl_gpio_s1_readdata                   : out std_logic_vector(31 downto 0);                    -- readdata
			currctrl_register_ram_s1_address            : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			currctrl_register_ram_s1_clken              : in  std_logic                     := 'X';             -- clken
			currctrl_register_ram_s1_chipselect         : in  std_logic                     := 'X';             -- chipselect
			currctrl_register_ram_s1_write              : in  std_logic                     := 'X';             -- write
			currctrl_register_ram_s1_readdata           : out std_logic_vector(31 downto 0);                    -- readdata
			currctrl_register_ram_s1_writedata          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			currctrl_register_ram_s1_byteenable         : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			currctrl_register_ram_s2_address            : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			currctrl_register_ram_s2_chipselect         : in  std_logic                     := 'X';             -- chipselect
			currctrl_register_ram_s2_clken              : in  std_logic                     := 'X';             -- clken
			currctrl_register_ram_s2_write              : in  std_logic                     := 'X';             -- write
			currctrl_register_ram_s2_readdata           : out std_logic_vector(31 downto 0);                    -- readdata
			currctrl_register_ram_s2_writedata          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			currctrl_register_ram_s2_byteenable         : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			currctrlsys_bridge_acknowledge              : in  std_logic                     := 'X';             -- acknowledge
			currctrlsys_bridge_irq                      : in  std_logic                     := 'X';             -- irq
			currctrlsys_bridge_address                  : out std_logic_vector(6 downto 0);                     -- address
			currctrlsys_bridge_bus_enable               : out std_logic;                                        -- bus_enable
			currctrlsys_bridge_byte_enable              : out std_logic_vector(3 downto 0);                     -- byte_enable
			currctrlsys_bridge_rw                       : out std_logic;                                        -- rw
			currctrlsys_bridge_write_data               : out std_logic_vector(31 downto 0);                    -- write_data
			currctrlsys_bridge_read_data                : in  std_logic_vector(31 downto 0) := (others => 'X'); -- read_data
			currctrlsys_bridge_avalon_slave_address     : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- address
			currctrlsys_bridge_avalon_slave_byteenable  : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			currctrlsys_bridge_avalon_slave_chipselect  : in  std_logic                     := 'X';             -- chipselect
			currctrlsys_bridge_avalon_slave_read        : in  std_logic                     := 'X';             -- read
			currctrlsys_bridge_avalon_slave_write       : in  std_logic                     := 'X';             -- write
			currctrlsys_bridge_avalon_slave_writedata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			currctrlsys_bridge_avalon_slave_readdata    : out std_logic_vector(31 downto 0);                    -- readdata
			currctrlsys_bridge_avalon_slave_waitrequest : out std_logic;                                        -- waitrequest
			currctrlsys_bridge_interrupt_irq            : out std_logic;                                        -- irq
			reset_currctrl_sys_fifo_reset_n             : in  std_logic                     := 'X';             -- reset_n
			reset_currctrl_sys_ram_reset_n              : in  std_logic                     := 'X';             -- reset_n
			reset_pheripal_reset_n                      : in  std_logic                     := 'X'              -- reset_n
		);
	end component CurrCTRL_SYS;

	u0 : component CurrCTRL_SYS
		port map (
			clk_currctrl_sys_fifo_clk                   => CONNECTED_TO_clk_currctrl_sys_fifo_clk,                   --           clk_currctrl_sys_fifo.clk
			clk_currctrl_sys_ram_clk                    => CONNECTED_TO_clk_currctrl_sys_ram_clk,                    --            clk_currctrl_sys_ram.clk
			clk_pheripal_clk                            => CONNECTED_TO_clk_pheripal_clk,                            --                    clk_pheripal.clk
			cpu_clk_clk                                 => CONNECTED_TO_cpu_clk_clk,                                 --                         cpu_clk.clk
			cpu_reset_reset_n                           => CONNECTED_TO_cpu_reset_reset_n,                           --                       cpu_reset.reset_n
			currctrl_gpio_ext_in_port                   => CONNECTED_TO_currctrl_gpio_ext_in_port,                   --               currctrl_gpio_ext.in_port
			currctrl_gpio_ext_out_port                  => CONNECTED_TO_currctrl_gpio_ext_out_port,                  --                                .out_port
			currctrl_gpio_s1_address                    => CONNECTED_TO_currctrl_gpio_s1_address,                    --                currctrl_gpio_s1.address
			currctrl_gpio_s1_write_n                    => CONNECTED_TO_currctrl_gpio_s1_write_n,                    --                                .write_n
			currctrl_gpio_s1_writedata                  => CONNECTED_TO_currctrl_gpio_s1_writedata,                  --                                .writedata
			currctrl_gpio_s1_chipselect                 => CONNECTED_TO_currctrl_gpio_s1_chipselect,                 --                                .chipselect
			currctrl_gpio_s1_readdata                   => CONNECTED_TO_currctrl_gpio_s1_readdata,                   --                                .readdata
			currctrl_register_ram_s1_address            => CONNECTED_TO_currctrl_register_ram_s1_address,            --        currctrl_register_ram_s1.address
			currctrl_register_ram_s1_clken              => CONNECTED_TO_currctrl_register_ram_s1_clken,              --                                .clken
			currctrl_register_ram_s1_chipselect         => CONNECTED_TO_currctrl_register_ram_s1_chipselect,         --                                .chipselect
			currctrl_register_ram_s1_write              => CONNECTED_TO_currctrl_register_ram_s1_write,              --                                .write
			currctrl_register_ram_s1_readdata           => CONNECTED_TO_currctrl_register_ram_s1_readdata,           --                                .readdata
			currctrl_register_ram_s1_writedata          => CONNECTED_TO_currctrl_register_ram_s1_writedata,          --                                .writedata
			currctrl_register_ram_s1_byteenable         => CONNECTED_TO_currctrl_register_ram_s1_byteenable,         --                                .byteenable
			currctrl_register_ram_s2_address            => CONNECTED_TO_currctrl_register_ram_s2_address,            --        currctrl_register_ram_s2.address
			currctrl_register_ram_s2_chipselect         => CONNECTED_TO_currctrl_register_ram_s2_chipselect,         --                                .chipselect
			currctrl_register_ram_s2_clken              => CONNECTED_TO_currctrl_register_ram_s2_clken,              --                                .clken
			currctrl_register_ram_s2_write              => CONNECTED_TO_currctrl_register_ram_s2_write,              --                                .write
			currctrl_register_ram_s2_readdata           => CONNECTED_TO_currctrl_register_ram_s2_readdata,           --                                .readdata
			currctrl_register_ram_s2_writedata          => CONNECTED_TO_currctrl_register_ram_s2_writedata,          --                                .writedata
			currctrl_register_ram_s2_byteenable         => CONNECTED_TO_currctrl_register_ram_s2_byteenable,         --                                .byteenable
			currctrlsys_bridge_acknowledge              => CONNECTED_TO_currctrlsys_bridge_acknowledge,              --              currctrlsys_bridge.acknowledge
			currctrlsys_bridge_irq                      => CONNECTED_TO_currctrlsys_bridge_irq,                      --                                .irq
			currctrlsys_bridge_address                  => CONNECTED_TO_currctrlsys_bridge_address,                  --                                .address
			currctrlsys_bridge_bus_enable               => CONNECTED_TO_currctrlsys_bridge_bus_enable,               --                                .bus_enable
			currctrlsys_bridge_byte_enable              => CONNECTED_TO_currctrlsys_bridge_byte_enable,              --                                .byte_enable
			currctrlsys_bridge_rw                       => CONNECTED_TO_currctrlsys_bridge_rw,                       --                                .rw
			currctrlsys_bridge_write_data               => CONNECTED_TO_currctrlsys_bridge_write_data,               --                                .write_data
			currctrlsys_bridge_read_data                => CONNECTED_TO_currctrlsys_bridge_read_data,                --                                .read_data
			currctrlsys_bridge_avalon_slave_address     => CONNECTED_TO_currctrlsys_bridge_avalon_slave_address,     -- currctrlsys_bridge_avalon_slave.address
			currctrlsys_bridge_avalon_slave_byteenable  => CONNECTED_TO_currctrlsys_bridge_avalon_slave_byteenable,  --                                .byteenable
			currctrlsys_bridge_avalon_slave_chipselect  => CONNECTED_TO_currctrlsys_bridge_avalon_slave_chipselect,  --                                .chipselect
			currctrlsys_bridge_avalon_slave_read        => CONNECTED_TO_currctrlsys_bridge_avalon_slave_read,        --                                .read
			currctrlsys_bridge_avalon_slave_write       => CONNECTED_TO_currctrlsys_bridge_avalon_slave_write,       --                                .write
			currctrlsys_bridge_avalon_slave_writedata   => CONNECTED_TO_currctrlsys_bridge_avalon_slave_writedata,   --                                .writedata
			currctrlsys_bridge_avalon_slave_readdata    => CONNECTED_TO_currctrlsys_bridge_avalon_slave_readdata,    --                                .readdata
			currctrlsys_bridge_avalon_slave_waitrequest => CONNECTED_TO_currctrlsys_bridge_avalon_slave_waitrequest, --                                .waitrequest
			currctrlsys_bridge_interrupt_irq            => CONNECTED_TO_currctrlsys_bridge_interrupt_irq,            --    currctrlsys_bridge_interrupt.irq
			reset_currctrl_sys_fifo_reset_n             => CONNECTED_TO_reset_currctrl_sys_fifo_reset_n,             --         reset_currctrl_sys_fifo.reset_n
			reset_currctrl_sys_ram_reset_n              => CONNECTED_TO_reset_currctrl_sys_ram_reset_n,              --          reset_currctrl_sys_ram.reset_n
			reset_pheripal_reset_n                      => CONNECTED_TO_reset_pheripal_reset_n                       --                  reset_pheripal.reset_n
		);

