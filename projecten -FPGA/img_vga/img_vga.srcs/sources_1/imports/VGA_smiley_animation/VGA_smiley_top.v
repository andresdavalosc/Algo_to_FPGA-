`timescale 1ns / 1ps

module VGA_smiley_top(
	input clk,
	output o_hsync,           
	output o_vsync,
	output [3:0] o_red,        
	output [3:0] o_blue,       
	output [3:0] o_green
	);
	
	wire clk25MHz;
	
	wire [9:0] w_counter_x;
	wire [9:0] w_counter_y;
	wire [3:0] w_red;
	wire [3:0] w_blue;
	wire [3:0] w_green;
	
	clk_wiz_0 clk25hertz(
            .clk_in1(clk),
            .clk_out1(clk25)
            );
	
	VGA_smiley vs0 (
		.clk (clk25),
		.i_counter_x(w_counter_x),
		.i_counter_y(w_counter_y),
		.o_red(w_red),
		.o_blue(w_blue),
		.o_green(w_green)
		);
		
	VGA_driver vd0(
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

endmodule











