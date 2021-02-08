	component subsystemA is
		port (
			led_gpio_external_connection_in_port  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			led_gpio_external_connection_out_port : out std_logic_vector(7 downto 0);                     -- out_port
			led_gpio_s1_address                   : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			led_gpio_s1_write_n                   : in  std_logic                     := 'X';             -- write_n
			led_gpio_s1_writedata                 : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			led_gpio_s1_chipselect                : in  std_logic                     := 'X';             -- chipselect
			led_gpio_s1_readdata                  : out std_logic_vector(31 downto 0);                    -- readdata
			pheriphal_clk_clk                     : in  std_logic                     := 'X';             -- clk
			pheriphal_reset_reset_n               : in  std_logic                     := 'X';             -- reset_n
			tp_gpio_external_connection_export    : out std_logic_vector(7 downto 0);                     -- export
			tp_gpio_s1_address                    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			tp_gpio_s1_write_n                    : in  std_logic                     := 'X';             -- write_n
			tp_gpio_s1_writedata                  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			tp_gpio_s1_chipselect                 : in  std_logic                     := 'X';             -- chipselect
			tp_gpio_s1_readdata                   : out std_logic_vector(31 downto 0)                     -- readdata
		);
	end component subsystemA;

	u0 : component subsystemA
		port map (
			led_gpio_external_connection_in_port  => CONNECTED_TO_led_gpio_external_connection_in_port,  -- led_gpio_external_connection.in_port
			led_gpio_external_connection_out_port => CONNECTED_TO_led_gpio_external_connection_out_port, --                             .out_port
			led_gpio_s1_address                   => CONNECTED_TO_led_gpio_s1_address,                   --                  led_gpio_s1.address
			led_gpio_s1_write_n                   => CONNECTED_TO_led_gpio_s1_write_n,                   --                             .write_n
			led_gpio_s1_writedata                 => CONNECTED_TO_led_gpio_s1_writedata,                 --                             .writedata
			led_gpio_s1_chipselect                => CONNECTED_TO_led_gpio_s1_chipselect,                --                             .chipselect
			led_gpio_s1_readdata                  => CONNECTED_TO_led_gpio_s1_readdata,                  --                             .readdata
			pheriphal_clk_clk                     => CONNECTED_TO_pheriphal_clk_clk,                     --                pheriphal_clk.clk
			pheriphal_reset_reset_n               => CONNECTED_TO_pheriphal_reset_reset_n,               --              pheriphal_reset.reset_n
			tp_gpio_external_connection_export    => CONNECTED_TO_tp_gpio_external_connection_export,    --  tp_gpio_external_connection.export
			tp_gpio_s1_address                    => CONNECTED_TO_tp_gpio_s1_address,                    --                   tp_gpio_s1.address
			tp_gpio_s1_write_n                    => CONNECTED_TO_tp_gpio_s1_write_n,                    --                             .write_n
			tp_gpio_s1_writedata                  => CONNECTED_TO_tp_gpio_s1_writedata,                  --                             .writedata
			tp_gpio_s1_chipselect                 => CONNECTED_TO_tp_gpio_s1_chipselect,                 --                             .chipselect
			tp_gpio_s1_readdata                   => CONNECTED_TO_tp_gpio_s1_readdata                    --                             .readdata
		);

