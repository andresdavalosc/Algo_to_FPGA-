`timescale 1ns / 1ps


module VGA_smiley (
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
	
	localparam FRAME_1 = 2'b00;
	localparam FRAME_2 = 2'b01;
	localparam FRAME_3 = 2'b10;
	localparam FRAME_4 = 2'b11;
	
	always @ (posedge clk)
		begin 
			if (clk_counter < 79000000)
				clk_counter <= clk_counter + 1;
			else 
				clk_counter <= 0;
		end 
		
	always @ (posedge clk) 
		begin 
			if (clk_counter < 25000000)
				FRAME <= FRAME_1;
			else if (clk_counter >= 25000000 && clk_counter < 27000000)
				FRAME <= FRAME_2;
			else if (clk_counter >= 27000000 && clk_counter < 29000000)
				FRAME <= FRAME_3;
			else if (clk_counter >= 29000000 && clk_counter < 75000000)
				FRAME <= FRAME_4;
			else if (clk_counter >= 75000000 && clk_counter < 77000000)
				FRAME <= FRAME_3;
			else if (clk_counter >= 77000000 && clk_counter < 79000001)
				FRAME <= FRAME_2;
		end 
	
	assign o_red = r_red;
	assign o_blue = r_blue;
	assign o_green = r_green;

	always @ (posedge clk)
		begin 
			case (FRAME)
				FRAME_1 : 
					begin 
						////////////////////////////////////////////////////////////////////////////////////// 
						if (i_counter_y < 135)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end 
						////////////////////////////////////////////////////////////////////////////////////// 
						
						//////////////////////////////////////////////////////////////////////////////////////
						
						else if (i_counter_y >= 135 && i_counter_y < 150)
                                      begin 
                                      if (i_counter_x < 324)
                                      begin 
                                        r_red <= 4'hF;    // white
                                        r_blue <= 4'hF;
                                        r_green <= 4'hF;
                                      end 
                                      else if (i_counter_x >= 324 && i_counter_x < 604)
                                  begin 
                                       r_red <= 4'hF;    // yellow
                                       r_blue <= 4'h0;
                                       r_green <= 4'hF;
                                 end  
                                 else if (i_counter_x >= 604)
                                 begin 
                                        r_red <= 4'hF;    // white
                                        r_blue <= 4'hF;
                                        r_green <= 4'hF;
                                 end
                            end  
						
						/////////////
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 150 && i_counter_y < 273)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 354)
								    begin								
									if (i_counter_y >= 150 && i_counter_y < 211)
                                        begin 
                                            r_red <= 4'hF;    // yellow
                                            r_blue <= 4'h0;
                                            r_green <= 4'hF;
                                        end 
                                    else if (i_counter_y >= 211 && i_counter_y < 221)
                                          begin 
                                             r_red <= 4'h0;    // black
                                             r_blue <= 4'h0;
                                             r_green <= 4'h0;
                                          end 
                                    else if (i_counter_y >= 221 && i_counter_y < 273)
                                          begin 
                                              r_red <= 4'hF;    // yellow
                                              r_blue <= 4'h0;
                                              r_green <= 4'hF;
                                          end
                                   end 
									
								else if (i_counter_x >= 354 && i_counter_x < 454)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 454 && i_counter_x < 474)
								    begin
									if (i_counter_y >= 150 && i_counter_y < 211)
									   begin 
										r_red <= 4'hF;    // yellow
                                        r_blue <= 4'h0;
                                        r_green <= 4'hF;
                                       end 
                                    else if (i_counter_y >= 211 && i_counter_y < 221)
                                       begin 
                                          r_red <= 4'h0;    // black
                                          r_blue <= 4'h0;
                                          r_green <= 4'h0;
                                       end 
                                    else if (i_counter_y >= 221 && i_counter_y < 273)
                                           begin 
                                              r_red <= 4'hF;    // yellow
                                              r_blue <= 4'h0;
                                              r_green <= 4'hF;
                                           end 
                                    end									
								else if (i_counter_x >= 474 && i_counter_x < 574)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 574 && i_counter_x < 604)
									begin

									if (i_counter_y >= 150 && i_counter_y < 211)
                                            begin 
                                                r_red <= 4'hF;    // yellow
                                                r_blue <= 4'h0;
                                                r_green <= 4'hF;
                                            end 
                                        else if (i_counter_y >= 211 && i_counter_y < 221)
                                            begin 
                                                r_red <= 4'h0;    // black
                                                r_blue <= 4'h0;
                                                r_green <= 4'h0;
                                            end 
                                        else if (i_counter_y >= 221 && i_counter_y < 273)
                                            begin 
                                                r_red <= 4'hF;    // yellow
                                                r_blue <= 4'h0;
                                                r_green <= 4'hF;
                                            end                                        
									end
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 273 && i_counter_y < 305)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end 
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  	
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 305 && i_counter_y < 310)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 305 && i_counter_y < 414)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						//////////////////////////////////////////////////////////////////////////////////////
						else if (i_counter_y <= 414)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
					end  // FRAME_1
				
				FRAME_2 :
					begin
						////////////////////////////////////////////////////////////////////////////////////// 
						if (i_counter_y < 135)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 135 && i_counter_y < 205)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 205 && i_counter_y < 217)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 383)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 383 && i_counter_x < 545)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 545 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 217 && i_counter_y < 305)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end 	
							end  
						//////////////////////////////////////////////////////////////////////////////////////
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 305 && i_counter_y < 326)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end 
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 326 && i_counter_y < 414)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  	
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y <= 414)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y >= 414)
						////////////////////////////////////////////////////////////////////////////////////// 
					end  // FRAME_2
					
				FRAME_3 : 
					begin
						////////////////////////////////////////////////////////////////////////////////////// 
						if (i_counter_y < 135)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						//////////////////////////////////////////////////////////////////////////////////////
						else if (i_counter_y >= 135 && i_counter_y < 205)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 205 && i_counter_y < 217)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 383)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 383 && i_counter_x < 545)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 545 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 217 && i_counter_y < 290)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 290 && i_counter_y < 297)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  	
							end  
						//////////////////////////////////////////////////////////////////////////////////////
						
						//////////////////////////////////////////////////////////////////////////////////////
						else if (i_counter_y >= 297 && i_counter_y < 325)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end 
								else if (i_counter_x >= 371 && i_counter_x < 378)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 378 && i_counter_x < 550)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 550 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 325 && i_counter_y < 332)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 332 && i_counter_y < 414)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end 
							end 
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y <= 414)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
					end  // FRAME_3
					
				FRAME_4 :
					begin			
						////////////////////////////////////////////////////////////////////////////////////// 
						if (i_counter_y < 135)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 135 && i_counter_y < 205)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 205 && i_counter_y < 217)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 383)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 383 && i_counter_x < 545)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 545 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 217 && i_counter_y < 283)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  	
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 283 && i_counter_y < 290)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 290 && i_counter_y < 310)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end        
								else if (i_counter_x >= 371 && i_counter_x < 378)              
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end 
								else if (i_counter_x >= 378 && i_counter_x < 418)                
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 418 && i_counter_x < 422)                
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 422 && i_counter_x < 462)                
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end   
								else if (i_counter_x >= 462 && i_counter_x < 466)               
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 466 && i_counter_x < 506)               
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 506 && i_counter_x < 510)                
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 510 && i_counter_x < 550)                
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end   
								else if (i_counter_x >= 550 && i_counter_x < 557)              
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  	
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 310 && i_counter_y < 314)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end 
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						//////////////////////////////////////////////////////////////////////////////////////
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 314 && i_counter_y < 344)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end         
								else if (i_counter_x >= 371 && i_counter_x < 378)              
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 378 && i_counter_x < 418)                
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 418 && i_counter_x < 422)                
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 422 && i_counter_x < 462)                
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 462 && i_counter_x < 466)                
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 466 && i_counter_x < 506)                
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 506 && i_counter_x < 510)                
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 510 && i_counter_x < 550)                
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 550 && i_counter_x < 557)              
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 344 && i_counter_y < 351)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  	
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 351 && i_counter_y < 414)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  	
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y <= 414)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
					end  // FRAME_4
				
				default :
					begin 
						////////////////////////////////////////////////////////////////////////////////////// 
						if (i_counter_y < 135)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 135 && i_counter_y < 205)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 205 && i_counter_y < 217)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 383)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 383 && i_counter_x < 545)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 545 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end 
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 217 && i_counter_y < 305)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  	
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 305 && i_counter_y < 310)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y >= 305 && i_counter_y < 414)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
								else if (i_counter_x >= 324 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end 
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  
							end  
						////////////////////////////////////////////////////////////////////////////////////// 
						
						////////////////////////////////////////////////////////////////////////////////////// 
						else if (i_counter_y <= 414)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  
						//////////////////////////////////////////////////////////////////////////////////////
					end  
			endcase
		end   
endmodule  
					
						
						
