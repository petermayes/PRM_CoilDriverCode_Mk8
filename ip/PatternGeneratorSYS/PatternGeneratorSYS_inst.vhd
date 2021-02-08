	component PatternGeneratorSYS is
		port (
			pd_clk_clk                : in  std_logic                     := 'X';             -- clk
			pd_debugram_s2_address    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- address
			pd_debugram_s2_chipselect : in  std_logic                     := 'X';             -- chipselect
			pd_debugram_s2_clken      : in  std_logic                     := 'X';             -- clken
			pd_debugram_s2_write      : in  std_logic                     := 'X';             -- write
			pd_debugram_s2_readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			pd_debugram_s2_writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			pd_debugram_s2_byteenable : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			pd_fifo_out_readdata      : out std_logic_vector(31 downto 0);                    -- readdata
			pd_fifo_out_read          : in  std_logic                     := 'X';             -- read
			pd_fifo_out_waitrequest   : out std_logic;                                        -- waitrequest
			pd_fifo_out_csr_address   : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			pd_fifo_out_csr_read      : in  std_logic                     := 'X';             -- read
			pd_fifo_out_csr_writedata : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			pd_fifo_out_csr_write     : in  std_logic                     := 'X';             -- write
			pd_fifo_out_csr_readdata  : out std_logic_vector(31 downto 0);                    -- readdata
			pd_gpio_in_port           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			pd_gpio_out_port          : out std_logic_vector(31 downto 0);                    -- out_port
			pd_reset_reset_n          : in  std_logic                     := 'X';             -- reset_n
			pheriphal_clk_clk         : in  std_logic                     := 'X';             -- clk
			pheriphal_reset_reset_n   : in  std_logic                     := 'X';             -- reset_n
			reset_out_export          : out std_logic;                                        -- export
			pd_gpio_s1_address        : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			pd_gpio_s1_write_n        : in  std_logic                     := 'X';             -- write_n
			pd_gpio_s1_writedata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			pd_gpio_s1_chipselect     : in  std_logic                     := 'X';             -- chipselect
			pd_gpio_s1_readdata       : out std_logic_vector(31 downto 0);                    -- readdata
			pd_fifo_in_writedata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			pd_fifo_in_write          : in  std_logic                     := 'X';             -- write
			pd_fifo_in_waitrequest    : out std_logic;                                        -- waitrequest
			pd_fifo_in_csr_address    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			pd_fifo_in_csr_read       : in  std_logic                     := 'X';             -- read
			pd_fifo_in_csr_writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			pd_fifo_in_csr_write      : in  std_logic                     := 'X';             -- write
			pd_fifo_in_csr_readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			pd_debugram_s1_address    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- address
			pd_debugram_s1_clken      : in  std_logic                     := 'X';             -- clken
			pd_debugram_s1_chipselect : in  std_logic                     := 'X';             -- chipselect
			pd_debugram_s1_write      : in  std_logic                     := 'X';             -- write
			pd_debugram_s1_readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			pd_debugram_s1_writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			pd_debugram_s1_byteenable : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			reset_pd_s1_address       : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			reset_pd_s1_write_n       : in  std_logic                     := 'X';             -- write_n
			reset_pd_s1_writedata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			reset_pd_s1_chipselect    : in  std_logic                     := 'X';             -- chipselect
			reset_pd_s1_readdata      : out std_logic_vector(31 downto 0)                     -- readdata
		);
	end component PatternGeneratorSYS;

	u0 : component PatternGeneratorSYS
		port map (
			pd_clk_clk                => CONNECTED_TO_pd_clk_clk,                --          pd_clk.clk
			pd_debugram_s2_address    => CONNECTED_TO_pd_debugram_s2_address,    --  pd_debugram_s2.address
			pd_debugram_s2_chipselect => CONNECTED_TO_pd_debugram_s2_chipselect, --                .chipselect
			pd_debugram_s2_clken      => CONNECTED_TO_pd_debugram_s2_clken,      --                .clken
			pd_debugram_s2_write      => CONNECTED_TO_pd_debugram_s2_write,      --                .write
			pd_debugram_s2_readdata   => CONNECTED_TO_pd_debugram_s2_readdata,   --                .readdata
			pd_debugram_s2_writedata  => CONNECTED_TO_pd_debugram_s2_writedata,  --                .writedata
			pd_debugram_s2_byteenable => CONNECTED_TO_pd_debugram_s2_byteenable, --                .byteenable
			pd_fifo_out_readdata      => CONNECTED_TO_pd_fifo_out_readdata,      --     pd_fifo_out.readdata
			pd_fifo_out_read          => CONNECTED_TO_pd_fifo_out_read,          --                .read
			pd_fifo_out_waitrequest   => CONNECTED_TO_pd_fifo_out_waitrequest,   --                .waitrequest
			pd_fifo_out_csr_address   => CONNECTED_TO_pd_fifo_out_csr_address,   -- pd_fifo_out_csr.address
			pd_fifo_out_csr_read      => CONNECTED_TO_pd_fifo_out_csr_read,      --                .read
			pd_fifo_out_csr_writedata => CONNECTED_TO_pd_fifo_out_csr_writedata, --                .writedata
			pd_fifo_out_csr_write     => CONNECTED_TO_pd_fifo_out_csr_write,     --                .write
			pd_fifo_out_csr_readdata  => CONNECTED_TO_pd_fifo_out_csr_readdata,  --                .readdata
			pd_gpio_in_port           => CONNECTED_TO_pd_gpio_in_port,           --         pd_gpio.in_port
			pd_gpio_out_port          => CONNECTED_TO_pd_gpio_out_port,          --                .out_port
			pd_reset_reset_n          => CONNECTED_TO_pd_reset_reset_n,          --        pd_reset.reset_n
			pheriphal_clk_clk         => CONNECTED_TO_pheriphal_clk_clk,         --   pheriphal_clk.clk
			pheriphal_reset_reset_n   => CONNECTED_TO_pheriphal_reset_reset_n,   -- pheriphal_reset.reset_n
			reset_out_export          => CONNECTED_TO_reset_out_export,          --       reset_out.export
			pd_gpio_s1_address        => CONNECTED_TO_pd_gpio_s1_address,        --      pd_gpio_s1.address
			pd_gpio_s1_write_n        => CONNECTED_TO_pd_gpio_s1_write_n,        --                .write_n
			pd_gpio_s1_writedata      => CONNECTED_TO_pd_gpio_s1_writedata,      --                .writedata
			pd_gpio_s1_chipselect     => CONNECTED_TO_pd_gpio_s1_chipselect,     --                .chipselect
			pd_gpio_s1_readdata       => CONNECTED_TO_pd_gpio_s1_readdata,       --                .readdata
			pd_fifo_in_writedata      => CONNECTED_TO_pd_fifo_in_writedata,      --      pd_fifo_in.writedata
			pd_fifo_in_write          => CONNECTED_TO_pd_fifo_in_write,          --                .write
			pd_fifo_in_waitrequest    => CONNECTED_TO_pd_fifo_in_waitrequest,    --                .waitrequest
			pd_fifo_in_csr_address    => CONNECTED_TO_pd_fifo_in_csr_address,    --  pd_fifo_in_csr.address
			pd_fifo_in_csr_read       => CONNECTED_TO_pd_fifo_in_csr_read,       --                .read
			pd_fifo_in_csr_writedata  => CONNECTED_TO_pd_fifo_in_csr_writedata,  --                .writedata
			pd_fifo_in_csr_write      => CONNECTED_TO_pd_fifo_in_csr_write,      --                .write
			pd_fifo_in_csr_readdata   => CONNECTED_TO_pd_fifo_in_csr_readdata,   --                .readdata
			pd_debugram_s1_address    => CONNECTED_TO_pd_debugram_s1_address,    --  pd_debugram_s1.address
			pd_debugram_s1_clken      => CONNECTED_TO_pd_debugram_s1_clken,      --                .clken
			pd_debugram_s1_chipselect => CONNECTED_TO_pd_debugram_s1_chipselect, --                .chipselect
			pd_debugram_s1_write      => CONNECTED_TO_pd_debugram_s1_write,      --                .write
			pd_debugram_s1_readdata   => CONNECTED_TO_pd_debugram_s1_readdata,   --                .readdata
			pd_debugram_s1_writedata  => CONNECTED_TO_pd_debugram_s1_writedata,  --                .writedata
			pd_debugram_s1_byteenable => CONNECTED_TO_pd_debugram_s1_byteenable, --                .byteenable
			reset_pd_s1_address       => CONNECTED_TO_reset_pd_s1_address,       --     reset_pd_s1.address
			reset_pd_s1_write_n       => CONNECTED_TO_reset_pd_s1_write_n,       --                .write_n
			reset_pd_s1_writedata     => CONNECTED_TO_reset_pd_s1_writedata,     --                .writedata
			reset_pd_s1_chipselect    => CONNECTED_TO_reset_pd_s1_chipselect,    --                .chipselect
			reset_pd_s1_readdata      => CONNECTED_TO_reset_pd_s1_readdata       --                .readdata
		);

