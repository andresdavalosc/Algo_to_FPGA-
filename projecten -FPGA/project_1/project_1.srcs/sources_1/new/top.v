`timescale 1ns / 1ps

module top(
    input button,
    input button2,
	input clk,
	input reset,
	output o_hsync,           
	output o_vsync,
	output [3:0] o_red,       // output color red
	output [3:0] o_blue,      // output color blue
	output [3:0] o_green,
	output led0,
	output led,
    output led2,
    output led3,
    output led4,
    output led5,
    output led6,
    output led7,
    output led8,
    output led9,
    output led10,
    output led11,
    output led12,
    output  led13,
    output  led14,
    output  led15,
    output  [3:0] anode,
    output [7:0] cathode
	);
	
	wire [9:0] w_counter_x;
	wire [9:0] w_counter_y;
	wire [3:0] w_red;
	wire [3:0] w_blue;
	wire [3:0] w_green;
	wire [3:0] counter;
	wire [3:0] counter2;
	wire clk25;	
	wire r_clock =0;
	wire flagout;
	wire flagout2;
	wire Q_out;
	wire [3:0] finish;
	wire [3:0] finish2;
	wire [1:0] refresh_clock;
    wire [1:0] refreshcounter;
    wire [3:0] one_digit;
    wire reset_spel;

	
	clk_wiz_1 clock25(
            .clk_in1(clk),
            .clk_out1(clk25),
            .reset(r_clock),
            .clk_out2(refresh_clock)
            );
	
	VGA_driver vga(
         .clk(clk25),
         .i_red(w_red),
         .i_blue(w_blue),
         .i_green(w_green),
         .o_hsync(o_hsync),
         .o_vsync(o_vsync),
         .o_hcounter(w_counter_x),
         .o_vcounter(w_counter_y),
         .o_red(o_red),
         .o_blue(o_blue),
         .o_green(o_green)
         );

	vga_img lijnen (
		.clk (clk25),
		.i_counter_x(w_counter_x),
		.i_counter_y(w_counter_y),
		.o_red(w_red),
		.o_blue(w_blue),
		.o_green(w_green),
		.digit(counter),
		.select(counter2),
        .led0(led0),
        .led6(led6),
        .led7(led7),
        .led8(led8),		
		.led9(led9),
        .led10(led10),
        .led11(led11),
        .led12(led12),       
		.led13(led13),
        .led14(led14),
        .led15(led15),
        .flagTurn(flagout2),
        .reset(flagout2),
        .finish_(finish),
        .finish2_(finish2),
        .reset_spel(reset_spel)
		);

	buttonpress NEXT_BUTTON (
        .button(button),
        .reset(reset),
        .led(led),
        .led2(led2),
        .led3(led3),
        .led4(led4),
        .count(counter)
        );	
        
 	button_select SELECT_BUTTON  (
        .button2(button2),
        .led5(led5),
        .count2(counter2),
        .flag(flagout),
        .reset(flagout),
        .reset2(reset_spel)
        ); 
     

     
     refreshcounter _refreshcounter(
        .refresh_clock(refresh_clock),
        .refreshcounter(refreshcounter)   
     ); 
     
     anode_controler anode_control(
        .refreshcounter(refreshcounter),
        .anode(anode)
        
     );
     
     BCD_control BCD(
        .digit1(finish),
        .digit2(finish2),
        .refreshcounter(refreshcounter),
        .one_digit(one_digit)
     );
     
     segment seven_segment(
        .digit(one_digit),
        .cathode(cathode)
     );    
   
	

endmodule
