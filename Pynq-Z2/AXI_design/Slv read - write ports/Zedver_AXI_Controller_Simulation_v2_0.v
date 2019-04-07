
`timescale 1 ns / 1 ps

	module Zedver_AXI_Controller_Simulation_v2_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface SR_AXI
		parameter integer C_SR_AXI_DATA_WIDTH	= 32,
		parameter integer C_SR_AXI_ADDR_WIDTH	= 4,

		// Parameters of Axi Slave Bus Interface SW_AXI
		parameter integer C_SW_AXI_DATA_WIDTH	= 32,
		parameter integer C_SW_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface SR_AXI
		input wire  sr_axi_aclk,
		input wire  sr_axi_aresetn,
		input wire [C_SR_AXI_ADDR_WIDTH-1 : 0] sr_axi_awaddr,
		input wire [2 : 0] sr_axi_awprot,
		input wire  sr_axi_awvalid,
		output wire  sr_axi_awready,
		input wire [C_SR_AXI_DATA_WIDTH-1 : 0] sr_axi_wdata,
		input wire [(C_SR_AXI_DATA_WIDTH/8)-1 : 0] sr_axi_wstrb,
		input wire  sr_axi_wvalid,
		output wire  sr_axi_wready,
		output wire [1 : 0] sr_axi_bresp,
		output wire  sr_axi_bvalid,
		input wire  sr_axi_bready,
		input wire [C_SR_AXI_ADDR_WIDTH-1 : 0] sr_axi_araddr,
		input wire [2 : 0] sr_axi_arprot,
		input wire  sr_axi_arvalid,
		output wire  sr_axi_arready,
		output wire [C_SR_AXI_DATA_WIDTH-1 : 0] sr_axi_rdata,
		output wire [1 : 0] sr_axi_rresp,
		output wire  sr_axi_rvalid,
		input wire  sr_axi_rready,

		// Ports of Axi Slave Bus Interface SW_AXI
		input wire  sw_axi_aclk,
		input wire  sw_axi_aresetn,
		input wire [C_SW_AXI_ADDR_WIDTH-1 : 0] sw_axi_awaddr,
		input wire [2 : 0] sw_axi_awprot,
		input wire  sw_axi_awvalid,
		output wire  sw_axi_awready,
		input wire [C_SW_AXI_DATA_WIDTH-1 : 0] sw_axi_wdata,
		input wire [(C_SW_AXI_DATA_WIDTH/8)-1 : 0] sw_axi_wstrb,
		input wire  sw_axi_wvalid,
		output wire  sw_axi_wready,
		output wire [1 : 0] sw_axi_bresp,
		output wire  sw_axi_bvalid,
		input wire  sw_axi_bready,
		input wire [C_SW_AXI_ADDR_WIDTH-1 : 0] sw_axi_araddr,
		input wire [2 : 0] sw_axi_arprot,
		input wire  sw_axi_arvalid,
		output wire  sw_axi_arready,
		output wire [C_SW_AXI_DATA_WIDTH-1 : 0] sw_axi_rdata,
		output wire [1 : 0] sw_axi_rresp,
		output wire  sw_axi_rvalid,
		input wire  sw_axi_rready
	);
	wire AXI_slv_connect_0;
	wire AXI_slv_connect_1;
// Instantiation of Axi Bus Interface SR_AXI
	Zedver_AXI_Controller_Simulation_v2_0_SR_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_SR_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_SR_AXI_ADDR_WIDTH)
	) Zedver_AXI_Controller_Simulation_v2_0_SR_AXI_inst (
	    .REG_0(AXI_slv_connect_0),
	    .REG_1(AXI_slv_connect_1),
		.S_AXI_ACLK(sr_axi_aclk),
		.S_AXI_ARESETN(sr_axi_aresetn),
		.S_AXI_AWADDR(sr_axi_awaddr),
		.S_AXI_AWPROT(sr_axi_awprot),
		.S_AXI_AWVALID(sr_axi_awvalid),
		.S_AXI_AWREADY(sr_axi_awready),
		.S_AXI_WDATA(sr_axi_wdata),
		.S_AXI_WSTRB(sr_axi_wstrb),
		.S_AXI_WVALID(sr_axi_wvalid),
		.S_AXI_WREADY(sr_axi_wready),
		.S_AXI_BRESP(sr_axi_bresp),
		.S_AXI_BVALID(sr_axi_bvalid),
		.S_AXI_BREADY(sr_axi_bready),
		.S_AXI_ARADDR(sr_axi_araddr),
		.S_AXI_ARPROT(sr_axi_arprot),
		.S_AXI_ARVALID(sr_axi_arvalid),
		.S_AXI_ARREADY(sr_axi_arready),
		.S_AXI_RDATA(sr_axi_rdata),
		.S_AXI_RRESP(sr_axi_rresp),
		.S_AXI_RVALID(sr_axi_rvalid),
		.S_AXI_RREADY(sr_axi_rready)
	);

// Instantiation of Axi Bus Interface SW_AXI
	Zedver_AXI_Controller_Simulation_v2_0_SW_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_SW_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_SW_AXI_ADDR_WIDTH)
	) Zedver_AXI_Controller_Simulation_v2_0_SW_AXI_inst (
	    .REG_0(AXI_slv_connect_0),
        .REG_1(AXI_slv_connect_1),
		.S_AXI_ACLK(sw_axi_aclk),
		.S_AXI_ARESETN(sw_axi_aresetn),
		.S_AXI_AWADDR(sw_axi_awaddr),
		.S_AXI_AWPROT(sw_axi_awprot),
		.S_AXI_AWVALID(sw_axi_awvalid),
		.S_AXI_AWREADY(sw_axi_awready),
		.S_AXI_WDATA(sw_axi_wdata),
		.S_AXI_WSTRB(sw_axi_wstrb),
		.S_AXI_WVALID(sw_axi_wvalid),
		.S_AXI_WREADY(sw_axi_wready),
		.S_AXI_BRESP(sw_axi_bresp),
		.S_AXI_BVALID(sw_axi_bvalid),
		.S_AXI_BREADY(sw_axi_bready),
		.S_AXI_ARADDR(sw_axi_araddr),
		.S_AXI_ARPROT(sw_axi_arprot),
		.S_AXI_ARVALID(sw_axi_arvalid),
		.S_AXI_ARREADY(sw_axi_arready),
		.S_AXI_RDATA(sw_axi_rdata),
		.S_AXI_RRESP(sw_axi_rresp),
		.S_AXI_RVALID(sw_axi_rvalid),
		.S_AXI_RREADY(sw_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
