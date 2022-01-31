#seven segment

set_property -dict { PACKAGE_PIN W7 IOSTANDARD LVCMOS33} [get_ports {cathode[0]}];
set_property -dict { PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports {cathode[1]}];
set_property -dict { PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports {cathode[2]}];
set_property -dict { PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports {cathode[3]}];
set_property -dict { PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports {cathode[4]}];
set_property -dict { PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {cathode[5]}];
set_property -dict { PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports {cathode[6]}];
set_property -dict { PACKAGE_PIN V7 IOSTANDARD LVCMOS33} [get_ports {cathode[7]}];

set_property -dict { PACKAGE_PIN W4 IOSTANDARD LVCMOS33} [get_ports {anode[0]}];
set_property -dict { PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports {anode[1]}];
set_property -dict { PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports {anode[2]}];
set_property -dict { PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {anode[3]}];


# Pin assignment for clock
set_property -dict { PACKAGE_PIN W5 IOSTANDARD LVCMOS33 } [get_ports { clk }];

set_property -dict { PACKAGE_PIN G19 IOSTANDARD LVCMOS33 } [get_ports { o_red[0] }];
set_property -dict { PACKAGE_PIN H19 IOSTANDARD LVCMOS33 } [get_ports { o_red[1] }];
set_property -dict { PACKAGE_PIN J19 IOSTANDARD LVCMOS33 } [get_ports { o_red[2] }];
set_property -dict { PACKAGE_PIN N19 IOSTANDARD LVCMOS33 } [get_ports { o_red[3] }];
set_property -dict { PACKAGE_PIN J17 IOSTANDARD LVCMOS33 } [get_ports { o_green[0] }];
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { o_green[1] }];
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports { o_green[2] }];
set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS33 } [get_ports { o_green[3] }];
set_property -dict { PACKAGE_PIN N18 IOSTANDARD LVCMOS33 } [get_ports { o_blue[0] }];
set_property -dict { PACKAGE_PIN L18 IOSTANDARD LVCMOS33 } [get_ports { o_blue[1] }];
set_property -dict { PACKAGE_PIN K18 IOSTANDARD LVCMOS33 } [get_ports { o_blue[2] }];
set_property -dict { PACKAGE_PIN J18 IOSTANDARD LVCMOS33 } [get_ports { o_blue[3] } ];
set_property -dict { PACKAGE_PIN P19 IOSTANDARD LVCMOS33 } [get_ports { o_hsync }];
set_property -dict { PACKAGE_PIN R19 IOSTANDARD LVCMOS33 } [get_ports { o_vsync }];

# Pin assignment for LEDs
set_property -dict { PACKAGE_PIN L1 IOSTANDARD LVCMOS33 }  [get_ports { led15 }];
set_property -dict { PACKAGE_PIN P1 IOSTANDARD LVCMOS33 }  [get_ports { led14 }];
set_property -dict { PACKAGE_PIN N3 IOSTANDARD LVCMOS33 }  [get_ports { led13 }];
set_property -dict { PACKAGE_PIN p3 IOSTANDARD LVCMOS33 }  [get_ports { led12 }];
set_property -dict { PACKAGE_PIN U3 IOSTANDARD LVCMOS33 }  [get_ports { led11 }];
set_property -dict { PACKAGE_PIN W3 IOSTANDARD LVCMOS33 }  [get_ports { led10 }];
set_property -dict { PACKAGE_PIN V3 IOSTANDARD LVCMOS33 }  [get_ports { led9 }];
set_property -dict { PACKAGE_PIN V13 IOSTANDARD LVCMOS33 }  [get_ports { led8 }];
set_property -dict { PACKAGE_PIN V14 IOSTANDARD LVCMOS33 }  [get_ports { led7 }];
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 }  [get_ports { led6 }];
set_property -dict { PACKAGE_PIN U15 IOSTANDARD LVCMOS33 }  [get_ports { led5 }];
set_property -dict { PACKAGE_PIN W18 IOSTANDARD LVCMOS33 }  [get_ports { led4 }];
set_property -dict { PACKAGE_PIN V19 IOSTANDARD LVCMOS33 }  [get_ports { led3 }];
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33 }  [get_ports { led2 }];
set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 }  [get_ports { led }];
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 }  [get_ports { led0 }];


set_property -dict { PACKAGE_PIN R2 IOSTANDARD LVCMOS33 }  [get_ports { change_state }];

# Pin assignment for pushbutton switches
set_property -dict { PACKAGE_PIN W19 IOSTANDARD LVCMOS33 } [get_ports { reset }];
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports { button }];
set_property -dict { PACKAGE_PIN T17 IOSTANDARD LVCMOS33 } [get_ports { button2 }];
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets button2_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets button_IBUF]

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets led5_OBUF]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets change_state_IBUF]


