	component USB_Comms_SYS is
		port (
			clk_usb_ext_clk_clk        : in  std_logic                     := 'X';             -- clk
			pheriphal_clk_clk          : in  std_logic                     := 'X';             -- clk
			pheriphal_reset_reset_n    : in  std_logic                     := 'X';             -- reset_n
			reset_usb_ext_clk_reset_n  : in  std_logic                     := 'X';             -- reset_n
			cpu_clk_clk                : in  std_logic                     := 'X';             -- clk
			cpu_reset_reset_n          : in  std_logic                     := 'X';             -- reset_n
			usb_data_gpio_in_port      : in  std_logic                     := 'X';             -- in_port
			usb_data_gpio_out_port     : out std_logic;                                        -- out_port
			usb_data_gpio_irq_irq      : out std_logic;                                        -- irq
			usb_data_ram_s2_address    : in  std_logic_vector(10 downto 0) := (others => 'X'); -- address
			usb_data_ram_s2_chipselect : in  std_logic                     := 'X';             -- chipselect
			usb_data_ram_s2_clken      : in  std_logic                     := 'X';             -- clken
			usb_data_ram_s2_write      : in  std_logic                     := 'X';             -- write
			usb_data_ram_s2_readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			usb_data_ram_s2_writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			usb_data_ram_s2_byteenable : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			usb_gpio_s1_address        : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			usb_gpio_s1_write_n        : in  std_logic                     := 'X';             -- write_n
			usb_gpio_s1_writedata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			usb_gpio_s1_chipselect     : in  std_logic                     := 'X';             -- chipselect
			usb_gpio_s1_readdata       : out std_logic_vector(31 downto 0);                    -- readdata
			usb_rx_ram_s1_address      : in  std_logic_vector(10 downto 0) := (others => 'X'); -- address
			usb_rx_ram_s1_clken        : in  std_logic                     := 'X';             -- clken
			usb_rx_ram_s1_chipselect   : in  std_logic                     := 'X';             -- chipselect
			usb_rx_ram_s1_write        : in  std_logic                     := 'X';             -- write
			usb_rx_ram_s1_readdata     : out std_logic_vector(31 downto 0);                    -- readdata
			usb_rx_ram_s1_writedata    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			usb_rx_ram_s1_byteenable   : in  std_logic_vector(3 downto 0)  := (others => 'X')  -- byteenable
		);
	end component USB_Comms_SYS;

	u0 : component USB_Comms_SYS
		port map (
			clk_usb_ext_clk_clk        => CONNECTED_TO_clk_usb_ext_clk_clk,        --   clk_usb_ext_clk.clk
			pheriphal_clk_clk          => CONNECTED_TO_pheriphal_clk_clk,          --     pheriphal_clk.clk
			pheriphal_reset_reset_n    => CONNECTED_TO_pheriphal_reset_reset_n,    --   pheriphal_reset.reset_n
			reset_usb_ext_clk_reset_n  => CONNECTED_TO_reset_usb_ext_clk_reset_n,  -- reset_usb_ext_clk.reset_n
			cpu_clk_clk                => CONNECTED_TO_cpu_clk_clk,                --           cpu_clk.clk
			cpu_reset_reset_n          => CONNECTED_TO_cpu_reset_reset_n,          --         cpu_reset.reset_n
			usb_data_gpio_in_port      => CONNECTED_TO_usb_data_gpio_in_port,      --     usb_data_gpio.in_port
			usb_data_gpio_out_port     => CONNECTED_TO_usb_data_gpio_out_port,     --                  .out_port
			usb_data_gpio_irq_irq      => CONNECTED_TO_usb_data_gpio_irq_irq,      -- usb_data_gpio_irq.irq
			usb_data_ram_s2_address    => CONNECTED_TO_usb_data_ram_s2_address,    --   usb_data_ram_s2.address
			usb_data_ram_s2_chipselect => CONNECTED_TO_usb_data_ram_s2_chipselect, --                  .chipselect
			usb_data_ram_s2_clken      => CONNECTED_TO_usb_data_ram_s2_clken,      --                  .clken
			usb_data_ram_s2_write      => CONNECTED_TO_usb_data_ram_s2_write,      --                  .write
			usb_data_ram_s2_readdata   => CONNECTED_TO_usb_data_ram_s2_readdata,   --                  .readdata
			usb_data_ram_s2_writedata  => CONNECTED_TO_usb_data_ram_s2_writedata,  --                  .writedata
			usb_data_ram_s2_byteenable => CONNECTED_TO_usb_data_ram_s2_byteenable, --                  .byteenable
			usb_gpio_s1_address        => CONNECTED_TO_usb_gpio_s1_address,        --       usb_gpio_s1.address
			usb_gpio_s1_write_n        => CONNECTED_TO_usb_gpio_s1_write_n,        --                  .write_n
			usb_gpio_s1_writedata      => CONNECTED_TO_usb_gpio_s1_writedata,      --                  .writedata
			usb_gpio_s1_chipselect     => CONNECTED_TO_usb_gpio_s1_chipselect,     --                  .chipselect
			usb_gpio_s1_readdata       => CONNECTED_TO_usb_gpio_s1_readdata,       --                  .readdata
			usb_rx_ram_s1_address      => CONNECTED_TO_usb_rx_ram_s1_address,      --     usb_rx_ram_s1.address
			usb_rx_ram_s1_clken        => CONNECTED_TO_usb_rx_ram_s1_clken,        --                  .clken
			usb_rx_ram_s1_chipselect   => CONNECTED_TO_usb_rx_ram_s1_chipselect,   --                  .chipselect
			usb_rx_ram_s1_write        => CONNECTED_TO_usb_rx_ram_s1_write,        --                  .write
			usb_rx_ram_s1_readdata     => CONNECTED_TO_usb_rx_ram_s1_readdata,     --                  .readdata
			usb_rx_ram_s1_writedata    => CONNECTED_TO_usb_rx_ram_s1_writedata,    --                  .writedata
			usb_rx_ram_s1_byteenable   => CONNECTED_TO_usb_rx_ram_s1_byteenable    --                  .byteenable
		);

