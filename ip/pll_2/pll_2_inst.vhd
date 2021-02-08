	component pll_2 is
		port (
			altpll_0_locked_conduit_export : out std_logic;        -- export
			clk_clk                        : in  std_logic := 'X'; -- clk
			clk_200m_clk                   : out std_logic;        -- clk
			clk_50m_clk                    : out std_logic;        -- clk
			reset_reset_n                  : in  std_logic := 'X'  -- reset_n
		);
	end component pll_2;

	u0 : component pll_2
		port map (
			altpll_0_locked_conduit_export => CONNECTED_TO_altpll_0_locked_conduit_export, -- altpll_0_locked_conduit.export
			clk_clk                        => CONNECTED_TO_clk_clk,                        --                     clk.clk
			clk_200m_clk                   => CONNECTED_TO_clk_200m_clk,                   --                clk_200m.clk
			clk_50m_clk                    => CONNECTED_TO_clk_50m_clk,                    --                 clk_50m.clk
			reset_reset_n                  => CONNECTED_TO_reset_reset_n                   --                   reset.reset_n
		);

