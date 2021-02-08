
module FIFO_pll (
	altpll_0_locked_conduit_export,
	clk_clk,
	fifo_0_in_writedata,
	fifo_0_in_write,
	fifo_0_in_waitrequest,
	fifo_0_out_readdata,
	fifo_0_out_read,
	fifo_0_out_waitrequest,
	fifo_0_out_csr_address,
	fifo_0_out_csr_read,
	fifo_0_out_csr_writedata,
	fifo_0_out_csr_write,
	fifo_0_out_csr_readdata,
	reset_reset_n,
	clk_200m_clk);	

	output		altpll_0_locked_conduit_export;
	input		clk_clk;
	input	[15:0]	fifo_0_in_writedata;
	input		fifo_0_in_write;
	output		fifo_0_in_waitrequest;
	output	[15:0]	fifo_0_out_readdata;
	input		fifo_0_out_read;
	output		fifo_0_out_waitrequest;
	input	[2:0]	fifo_0_out_csr_address;
	input		fifo_0_out_csr_read;
	input	[31:0]	fifo_0_out_csr_writedata;
	input		fifo_0_out_csr_write;
	output	[31:0]	fifo_0_out_csr_readdata;
	input		reset_reset_n;
	output		clk_200m_clk;
endmodule
