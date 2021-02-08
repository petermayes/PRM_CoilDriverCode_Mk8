	component TimerSYS is
		port (
			timer_0_irq_irq       : out std_logic;                                        -- irq
			timer_1_irq_irq       : out std_logic;                                        -- irq
			timer_2_irq_irq       : out std_logic;                                        -- irq
			timer_clk_clk         : in  std_logic                     := 'X';             -- clk
			timer_reset_reset_n   : in  std_logic                     := 'X';             -- reset_n
			timer_0_s1_address    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			timer_0_s1_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			timer_0_s1_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			timer_0_s1_chipselect : in  std_logic                     := 'X';             -- chipselect
			timer_0_s1_write_n    : in  std_logic                     := 'X';             -- write_n
			timer_1_s1_address    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			timer_1_s1_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			timer_1_s1_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			timer_1_s1_chipselect : in  std_logic                     := 'X';             -- chipselect
			timer_1_s1_write_n    : in  std_logic                     := 'X';             -- write_n
			timer_2_s1_address    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			timer_2_s1_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			timer_2_s1_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			timer_2_s1_chipselect : in  std_logic                     := 'X';             -- chipselect
			timer_2_s1_write_n    : in  std_logic                     := 'X'              -- write_n
		);
	end component TimerSYS;

	u0 : component TimerSYS
		port map (
			timer_0_irq_irq       => CONNECTED_TO_timer_0_irq_irq,       -- timer_0_irq.irq
			timer_1_irq_irq       => CONNECTED_TO_timer_1_irq_irq,       -- timer_1_irq.irq
			timer_2_irq_irq       => CONNECTED_TO_timer_2_irq_irq,       -- timer_2_irq.irq
			timer_clk_clk         => CONNECTED_TO_timer_clk_clk,         --   timer_clk.clk
			timer_reset_reset_n   => CONNECTED_TO_timer_reset_reset_n,   -- timer_reset.reset_n
			timer_0_s1_address    => CONNECTED_TO_timer_0_s1_address,    --  timer_0_s1.address
			timer_0_s1_writedata  => CONNECTED_TO_timer_0_s1_writedata,  --            .writedata
			timer_0_s1_readdata   => CONNECTED_TO_timer_0_s1_readdata,   --            .readdata
			timer_0_s1_chipselect => CONNECTED_TO_timer_0_s1_chipselect, --            .chipselect
			timer_0_s1_write_n    => CONNECTED_TO_timer_0_s1_write_n,    --            .write_n
			timer_1_s1_address    => CONNECTED_TO_timer_1_s1_address,    --  timer_1_s1.address
			timer_1_s1_writedata  => CONNECTED_TO_timer_1_s1_writedata,  --            .writedata
			timer_1_s1_readdata   => CONNECTED_TO_timer_1_s1_readdata,   --            .readdata
			timer_1_s1_chipselect => CONNECTED_TO_timer_1_s1_chipselect, --            .chipselect
			timer_1_s1_write_n    => CONNECTED_TO_timer_1_s1_write_n,    --            .write_n
			timer_2_s1_address    => CONNECTED_TO_timer_2_s1_address,    --  timer_2_s1.address
			timer_2_s1_writedata  => CONNECTED_TO_timer_2_s1_writedata,  --            .writedata
			timer_2_s1_readdata   => CONNECTED_TO_timer_2_s1_readdata,   --            .readdata
			timer_2_s1_chipselect => CONNECTED_TO_timer_2_s1_chipselect, --            .chipselect
			timer_2_s1_write_n    => CONNECTED_TO_timer_2_s1_write_n     --            .write_n
		);

