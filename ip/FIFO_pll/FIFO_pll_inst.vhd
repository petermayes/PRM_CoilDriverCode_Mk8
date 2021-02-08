	component FIFO_pll is
		port (
			altpll_0_locked_conduit_export : out std_logic;                                        -- export
			clk_clk                        : in  std_logic                     := 'X';             -- clk
			fifo_0_in_writedata            : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			fifo_0_in_write                : in  std_logic                     := 'X';             -- write
			fifo_0_in_waitrequest          : out std_logic;                                        -- waitrequest
			fifo_0_out_readdata            : out std_logic_vector(15 downto 0);                    -- readdata
			fifo_0_out_read                : in  std_logic                     := 'X';             -- read
			fifo_0_out_waitrequest         : out std_logic;                                        -- waitrequest
			fifo_0_out_csr_address         : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			fifo_0_out_csr_read            : in  std_logic                     := 'X';             -- read
			fifo_0_out_csr_writedata       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			fifo_0_out_csr_write           : in  std_logic                     := 'X';             -- write
			fifo_0_out_csr_readdata        : out std_logic_vector(31 downto 0);                    -- readdata
			reset_reset_n                  : in  std_logic                     := 'X';             -- reset_n
			clk_200m_clk                   : out std_logic                                         -- clk
		);
	end component FIFO_pll;

	u0 : component FIFO_pll
		port map (
			altpll_0_locked_conduit_export => CONNECTED_TO_altpll_0_locked_conduit_export, -- altpll_0_locked_conduit.export
			clk_clk                        => CONNECTED_TO_clk_clk,                        --                     clk.clk
			fifo_0_in_writedata            => CONNECTED_TO_fifo_0_in_writedata,            --               fifo_0_in.writedata
			fifo_0_in_write                => CONNECTED_TO_fifo_0_in_write,                --                        .write
			fifo_0_in_waitrequest          => CONNECTED_TO_fifo_0_in_waitrequest,          --                        .waitrequest
			fifo_0_out_readdata            => CONNECTED_TO_fifo_0_out_readdata,            --              fifo_0_out.readdata
			fifo_0_out_read                => CONNECTED_TO_fifo_0_out_read,                --                        .read
			fifo_0_out_waitrequest         => CONNECTED_TO_fifo_0_out_waitrequest,         --                        .waitrequest
			fifo_0_out_csr_address         => CONNECTED_TO_fifo_0_out_csr_address,         --          fifo_0_out_csr.address
			fifo_0_out_csr_read            => CONNECTED_TO_fifo_0_out_csr_read,            --                        .read
			fifo_0_out_csr_writedata       => CONNECTED_TO_fifo_0_out_csr_writedata,       --                        .writedata
			fifo_0_out_csr_write           => CONNECTED_TO_fifo_0_out_csr_write,           --                        .write
			fifo_0_out_csr_readdata        => CONNECTED_TO_fifo_0_out_csr_readdata,        --                        .readdata
			reset_reset_n                  => CONNECTED_TO_reset_reset_n,                  --                   reset.reset_n
			clk_200m_clk                   => CONNECTED_TO_clk_200m_clk                    --                clk_200m.clk
		);

