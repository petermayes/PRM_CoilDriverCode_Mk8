	component CRC_RAM_v1 is
		port (
			clk_s1_clk                     : in  std_logic                    := 'X';             -- clk
			onchip_memory2_0_s1_address    : in  std_logic_vector(7 downto 0) := (others => 'X'); -- address
			onchip_memory2_0_s1_clken      : in  std_logic                    := 'X';             -- clken
			onchip_memory2_0_s1_chipselect : in  std_logic                    := 'X';             -- chipselect
			onchip_memory2_0_s1_write      : in  std_logic                    := 'X';             -- write
			onchip_memory2_0_s1_readdata   : out std_logic_vector(7 downto 0);                    -- readdata
			onchip_memory2_0_s1_writedata  : in  std_logic_vector(7 downto 0) := (others => 'X'); -- writedata
			reset_s1_reset_n               : in  std_logic                    := 'X';             -- reset_n
			clk_s2_clk                     : in  std_logic                    := 'X';             -- clk
			reset_s2_reset_n               : in  std_logic                    := 'X';             -- reset_n
			onchip_memory2_0_s2_address    : in  std_logic_vector(7 downto 0) := (others => 'X'); -- address
			onchip_memory2_0_s2_chipselect : in  std_logic                    := 'X';             -- chipselect
			onchip_memory2_0_s2_clken      : in  std_logic                    := 'X';             -- clken
			onchip_memory2_0_s2_write      : in  std_logic                    := 'X';             -- write
			onchip_memory2_0_s2_readdata   : out std_logic_vector(7 downto 0);                    -- readdata
			onchip_memory2_0_s2_writedata  : in  std_logic_vector(7 downto 0) := (others => 'X')  -- writedata
		);
	end component CRC_RAM_v1;

	u0 : component CRC_RAM_v1
		port map (
			clk_s1_clk                     => CONNECTED_TO_clk_s1_clk,                     --              clk_s1.clk
			onchip_memory2_0_s1_address    => CONNECTED_TO_onchip_memory2_0_s1_address,    -- onchip_memory2_0_s1.address
			onchip_memory2_0_s1_clken      => CONNECTED_TO_onchip_memory2_0_s1_clken,      --                    .clken
			onchip_memory2_0_s1_chipselect => CONNECTED_TO_onchip_memory2_0_s1_chipselect, --                    .chipselect
			onchip_memory2_0_s1_write      => CONNECTED_TO_onchip_memory2_0_s1_write,      --                    .write
			onchip_memory2_0_s1_readdata   => CONNECTED_TO_onchip_memory2_0_s1_readdata,   --                    .readdata
			onchip_memory2_0_s1_writedata  => CONNECTED_TO_onchip_memory2_0_s1_writedata,  --                    .writedata
			reset_s1_reset_n               => CONNECTED_TO_reset_s1_reset_n,               --            reset_s1.reset_n
			clk_s2_clk                     => CONNECTED_TO_clk_s2_clk,                     --              clk_s2.clk
			reset_s2_reset_n               => CONNECTED_TO_reset_s2_reset_n,               --            reset_s2.reset_n
			onchip_memory2_0_s2_address    => CONNECTED_TO_onchip_memory2_0_s2_address,    -- onchip_memory2_0_s2.address
			onchip_memory2_0_s2_chipselect => CONNECTED_TO_onchip_memory2_0_s2_chipselect, --                    .chipselect
			onchip_memory2_0_s2_clken      => CONNECTED_TO_onchip_memory2_0_s2_clken,      --                    .clken
			onchip_memory2_0_s2_write      => CONNECTED_TO_onchip_memory2_0_s2_write,      --                    .write
			onchip_memory2_0_s2_readdata   => CONNECTED_TO_onchip_memory2_0_s2_readdata,   --                    .readdata
			onchip_memory2_0_s2_writedata  => CONNECTED_TO_onchip_memory2_0_s2_writedata   --                    .writedata
		);

