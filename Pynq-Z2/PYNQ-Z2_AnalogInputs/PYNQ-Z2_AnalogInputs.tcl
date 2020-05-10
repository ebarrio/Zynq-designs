create_project PYNQ-Z2_AnalogInputs C:/PYNQ-Z2_AnalogInputs -part xc7z020clg400-1
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property target_language VHDL [current_project]
import_files -fileset constrs_1 -force -norecurse C:/PYNQ-Z2_AnalogInputs/pynq-z2_v1.0.xdc
create_bd_design "design_1"
update_compile_order -fileset sources_1
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xadc_wiz:3.3 xadc_wiz_0
endgroup
startgroup
set_property -dict [list CONFIG.XADC_STARUP_SELECTION {channel_sequencer} CONFIG.ADC_CONVERSION_RATE {200} CONFIG.OT_ALARM {false} CONFIG.USER_TEMP_ALARM {false} CONFIG.VCCINT_ALARM {false} CONFIG.VCCAUX_ALARM {false} CONFIG.ENABLE_VCCPINT_ALARM {false} CONFIG.ENABLE_VCCPAUX_ALARM {false} CONFIG.ENABLE_VCCDDRO_ALARM {false} CONFIG.CHANNEL_ENABLE_VP_VN {false} CONFIG.CHANNEL_ENABLE_VAUXP1_VAUXN1 {true} CONFIG.CHANNEL_ENABLE_VAUXP5_VAUXN5 {true} CONFIG.CHANNEL_ENABLE_VAUXP6_VAUXN6 {true} CONFIG.CHANNEL_ENABLE_VAUXP9_VAUXN9 {true} CONFIG.CHANNEL_ENABLE_VAUXP13_VAUXN13 {true} CONFIG.CHANNEL_ENABLE_VAUXP15_VAUXN15 {true} CONFIG.SEQUENCER_MODE {Continuous} CONFIG.EXTERNAL_MUX_CHANNEL {VP_VN} CONFIG.SINGLE_CHANNEL_SELECTION {TEMPERATURE}] [get_bd_cells xadc_wiz_0]
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/processing_system7_0/M_AXI_GP0" intc_ip "New AXI Interconnect" Clk_xbar "Auto" Clk_master "Auto" Clk_slave "Auto" }  [get_bd_intf_pins xadc_wiz_0/s_axi_lite]
startgroup
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vaux0
connect_bd_intf_net [get_bd_intf_pins xadc_wiz_0/Vaux1] [get_bd_intf_ports Vaux0]
endgroup
startgroup
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vaux4
connect_bd_intf_net [get_bd_intf_pins xadc_wiz_0/Vaux5] [get_bd_intf_ports Vaux4]
endgroup
startgroup
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vaux2
connect_bd_intf_net [get_bd_intf_pins xadc_wiz_0/Vaux6] [get_bd_intf_ports Vaux2]
endgroup
startgroup
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vaux1
connect_bd_intf_net [get_bd_intf_pins xadc_wiz_0/Vaux9] [get_bd_intf_ports Vaux1]
endgroup
startgroup
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vaux5
connect_bd_intf_net [get_bd_intf_pins xadc_wiz_0/Vaux13] [get_bd_intf_ports Vaux5]
endgroup
startgroup
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 Vaux3
connect_bd_intf_net [get_bd_intf_pins xadc_wiz_0/Vaux15] [get_bd_intf_ports Vaux3]
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
endgroup
set_property -dict [list CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_0]
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins xadc_wiz_0/vn_in]
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins xadc_wiz_0/vp_in]
regenerate_bd_layout
save_bd_design
