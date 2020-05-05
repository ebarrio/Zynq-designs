create_project Pmod_7SEG_Project {C:/Pmod_7SEG/Pmod_7SEG_Project} -part xc7z020clg400-1
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property target_language VHDL [current_project]
add_files -fileset constrs_1 -norecurse C:/Pmod_7SEG/pynq-z2_v1.0.xdc
import_files -fileset constrs_1 C:/Pmod_7SEG/pynq-z2_v1.0.xdc
create_bd_design "design_1"
update_compile_order -fileset sources_1
set_property  ip_repo_paths  {{C:/Pmod_7SEG}} [current_project]
update_ip_catalog
startgroup
create_bd_cell -type ip -vlnv xilinx.com:user:AXI_7SEG:1.0 AXI_7SEG_0
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
startgroup
make_bd_pins_external  [get_bd_pins AXI_7SEG_0/seg7]
endgroup
set_property name ja [get_bd_ports seg7]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/processing_system7_0/M_AXI_GP0" intc_ip "New AXI Interconnect" Clk_xbar "Auto" Clk_master "Auto" Clk_slave "Auto" }  [get_bd_intf_pins AXI_7SEG_0/S00_AXI]
regenerate_bd_layout
update_compile_order -fileset sources_1
make_wrapper -files [get_files C:/Pmod_7SEG/Pmod_7SEG_Project/Pmod_7SEG_Project.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse C:/Pmod_7SEG/Pmod_7SEG_Project/Pmod_7SEG_Project.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.vhd
save_bd_design
#launch_runs impl_1 -to_step write_bitstream -jobs 6