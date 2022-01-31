`timescale 1ns / 1ps



module VGA_driver (
	input clk,                // 25 MHz     
	input [3:0] i_red,        // color input data red
	input [3:0] i_blue,       // color input data blue
	input [3:0] i_green,      // color input data green
	output o_hsync,           // horizontal sync
	output o_vsync,           // vertical sync
	output [9:0] o_hcounter,  // horizontal counter 0-799  
	output [9:0] o_vcounter,  // vertical counter 0-524  
	output [3:0] o_red,       // output color red
	output [3:0] o_blue,      // output color blue
	output [3:0] o_green      // output color green
	);
	
	reg [9:0] r_hcounter = 0;  // horizontal counter reg
	reg [9:0] r_vcounter = 0;  // vertical counter reg
	reg [3:0] r_red = 0;
	reg [3:0] r_blue = 0;
	reg [3:0] r_green = 0;
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	always @(posedge clk)  // horizontal counter
		begin 
			if (r_hcounter < 799)
				r_hcounter <= r_hcounter + 1;  
			else
				r_hcounter <= 0;              
		end  
	
	always @ (posedge clk)  // vertical counter
		begin 
			if (r_hcounter == 799)  
				begin
					if (r_vcounter < 525)  
						r_vcounter <= r_vcounter + 1;
					else
						r_vcounter <= 0;              
				end  
		end  
	

	assign o_hcounter = r_hcounter;
	assign o_vcounter = r_vcounter;


	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	assign o_hsync = (r_hcounter >= 0 && r_hcounter < 96) ? 1:0;  // hsync hoog voor 96 keren                                                 
	assign o_vsync = (r_vcounter >= 0 && r_vcounter < 2) ? 1:0;   // vsync high for 2 keren
	

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	assign o_red = (r_hcounter > 144 && r_hcounter <= 783 && r_vcounter > 35 && r_vcounter <= 514) ? i_red : 4'h0;
	assign o_blue = (r_hcounter > 144 && r_hcounter <= 783 && r_vcounter > 35 && r_vcounter <= 514) ? i_blue : 4'h0;
	assign o_green = (r_hcounter > 144 && r_hcounter <= 783 && r_vcounter > 35 && r_vcounter <= 514) ? i_green : 4'h0;
	
endmodule  
