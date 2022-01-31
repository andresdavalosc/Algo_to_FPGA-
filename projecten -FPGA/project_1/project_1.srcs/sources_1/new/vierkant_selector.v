`timescale 1ns / 1ps

module vierkant_selector (
	input clk, 
	input [9:0] i_counter_x,
	input [9:0] i_counter_y,
	output [3:0] o_red,
	output [3:0] o_blue,
	output [3:0] o_green
	);
	
	reg [26:0] clk_counter = 0;
	reg [1:0] FRAME = 0;
	reg [3:0] r_red = 4'h0;
	reg [3:0] r_blue = 4'h0;
	reg [3:0] r_green = 4'h0;
	parameter y_pos1 = 155;
    parameter y_pos2 = 307;
	always @ (posedge clk)
            begin 
                if (clk_counter < 79000000)
                    clk_counter <= clk_counter + 1;
                else 
                    clk_counter <= 0;
            end 
	
	assign o_red = r_red;
	assign o_blue = r_blue;
	assign o_green = r_green;

	always @ (posedge clk)
		begin 
//         if (i_counter_x >= 155 && i_counter_x < 307) //vierkant
//          begin 
//            if (i_counter_y >= 45 &&i_counter_y < 180)
//             begin 
//               if (i_counter_x >= 162 && i_counter_x < 300)
//                 begin 
//                   if (i_counter_y >= 52 &&i_counter_y < 173)
//                   begin 
//                      r_red <= 4'h0;    // black
//                      r_blue <= 4'h0;
//                      r_green <= 4'h0;
//                   end
//                  end 
//                else                    
//                   r_red <= 4'hF;    // red
//                   r_blue <= 4'h0;
//                   r_green <= 4'h0;
//             end
//          end     
		 end
endmodule  // VGA_smiley
					
						
						
