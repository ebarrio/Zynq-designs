## This file is a part of .xdc for the PYNQ-Z2 board 
##Switch
set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports { sw_0 }]; #IO_L7N_T1_AD2N_35 Sch=sw[0]
##LED
set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { led_0 }]; #IO_L6N_T0_VREF_34 Sch=led[0]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { led_1 }]; #IO_L6P_T0_34 Sch=led[1]