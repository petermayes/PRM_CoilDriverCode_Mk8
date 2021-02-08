
module CRC_RAM_v1 (
	clk_s1_clk,
	onchip_memory2_0_s1_address,
	onchip_memory2_0_s1_clken,
	onchip_memory2_0_s1_chipselect,
	onchip_memory2_0_s1_write,
	onchip_memory2_0_s1_readdata,
	onchip_memory2_0_s1_writedata,
	reset_s1_reset_n,
	clk_s2_clk,
	reset_s2_reset_n,
	onchip_memory2_0_s2_address,
	onchip_memory2_0_s2_chipselect,
	onchip_memory2_0_s2_clken,
	onchip_memory2_0_s2_write,
	onchip_memory2_0_s2_readdata,
	onchip_memory2_0_s2_writedata);	

	input		clk_s1_clk;
	input	[7:0]	onchip_memory2_0_s1_address;
	input		onchip_memory2_0_s1_clken;
	input		onchip_memory2_0_s1_chipselect;
	input		onchip_memory2_0_s1_write;
	output	[7:0]	onchip_memory2_0_s1_readdata;
	input	[7:0]	onchip_memory2_0_s1_writedata;
	input		reset_s1_reset_n;
	input		clk_s2_clk;
	input		reset_s2_reset_n;
	input	[7:0]	onchip_memory2_0_s2_address;
	input		onchip_memory2_0_s2_chipselect;
	input		onchip_memory2_0_s2_clken;
	input		onchip_memory2_0_s2_write;
	output	[7:0]	onchip_memory2_0_s2_readdata;
	input	[7:0]	onchip_memory2_0_s2_writedata;
endmodule
