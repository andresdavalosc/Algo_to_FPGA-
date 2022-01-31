`timescale 1ns / 1ps


module vga_img (
	input clk, 
	input reset,
	output  reg reset_spel = 0,
	input  [3:0] digit,
	input  [3:0] select,
	input  [9:0] i_counter_x,
	input  [9:0] i_counter_y,
	output  [3:0] o_red,
	output  [3:0] o_blue,
	output  [3:0] o_green,
	output  led0,
	output  led6,
	output  led7,   
    output  led8,
    output  led9, 
	output  led10,
    output  led11,
    output  led12,
    output  led13,   
    output  led14,
    output  led15,
    output reg flagTurn,
    output  [3:0] finish_, 
    output  [3:0] finish2_
	);
	
	reg [3:0] finish=0;
	reg [3:0] finish2=0;
	reg [26:0] clk_counter = 0;
	reg [1:0] FRAME = 0;
	reg [3:0] r_red = 4'h0;
	reg [3:0] r_blue = 4'h0;
	reg [3:0] r_green = 4'h0;
	
    reg Flag1 = 0;
    reg Flag2 = 0;
    reg Flag3 = 0;
    reg Flag4 = 0;
    reg Flag5 = 0;
    reg Flag6 = 0;
    reg Flag7 = 0;
    reg Flag8 = 0;
    reg Flag9 = 0;
    
    
    reg player1_1 = 0;
    reg player1_2 = 0;
    reg player1_3 = 0;
    reg player1_4 = 0;
    reg player1_5 = 0;
    reg player1_6 = 0;
    reg player1_7 = 0;
    reg player1_8 = 0;
    reg player1_9 = 0;
    
    reg player2_1 = 0;
    reg player2_2 = 0;
    reg player2_3 = 0;
    reg player2_4 = 0;
    reg player2_5 = 0;
    reg player2_6 = 0;
    reg player2_7 = 0;
    reg player2_8 = 0;
    reg player2_9 = 0;
    
    reg p1_1 = 0;
    reg p1_2 = 0;
    reg p1_3 = 0;
    reg p1_4 = 0;
    reg p1_5 = 0;
    reg p1_6 = 0;
    reg p1_7 = 0;
    reg p1_8 = 0;
    reg p1_9 = 0;
    
    reg p2_1 = 0;
    reg p2_2 = 0;
    reg p2_3 = 0;
    reg p2_4 = 0;
    reg p2_5 = 0;
    reg p2_6 = 0;
    reg p2_7 = 0;
    reg p2_8 = 0;
    reg p2_9 = 0; 
    reg [1:0]turn;
    
    reg spel = 0;
	localparam FRAME_1 = 2'b00;
	
	always @(posedge select or posedge reset)
	   begin
	    if(reset)
         begin
          turn <= 2'b00;
          flagTurn <= 1'b0;
        end
	    else if(turn > 2'b00)
          begin
             flagTurn <= 1'b1;
             turn <= 2'b00;
          end
	    else if(select)
	       turn <= turn + 1;
	   end
	
	always @ (posedge clk)	    
		begin 
			if (clk_counter < 79000000)
				clk_counter <= clk_counter + 1;
			else 
				clk_counter <= 0;
		end 
		
	always @ (posedge clk) 
		begin 
				FRAME <= FRAME_1;
		end 
	
	assign o_red = r_red;
	assign o_blue = r_blue;
	assign o_green = r_green;

	always @ (posedge clk)
	  begin
	        reset_spel <= 0; 
	        spel <= 0;
            if (i_counter_y >= 190 && i_counter_y < 197)
              begin 
                if (i_counter_x < 650)
                 begin 
                   r_red <= 4'hF;    // white
                   r_blue <= 4'hF;
                   r_green <= 4'hF;
                 end    
              end         
        else if( i_counter_y >= 355 && i_counter_y < 362)
              begin 
                 if (i_counter_x < 650)
                  begin 
                     r_red <= 4'hF;    // white
                     r_blue <= 4'hF;
                     r_green <= 4'hF;
                  end
              end
        else if( i_counter_x >= 317 && i_counter_x < 324)
              begin 
                 if (i_counter_y < 650)
                  begin 
                     r_red <= 4'hF;    // white
                     r_blue <= 4'hF;
                     r_green <= 4'hF;
                  end
              end 
        else if( i_counter_x >= 545 && i_counter_x < 552)
              begin 
                  if (i_counter_y < 650)
                   begin 
                       r_red <= 4'hF;    // white
                       r_blue <= 4'hF;
                       r_green <= 4'hF;
                   end
              end
             ////////////////////////////////////////                 
         else 
              r_red <= 4'h0;    // black
              r_blue <= 4'h0;
              r_green <= 4'h0;  
////*****************************************VIERKANTEN EERSTE RIJ*****************************************************	
//////////////////////////////////////////////////////////////////////////////////////////////////////eerste vierkant
        case(digit)
        4'b0001:
             if (i_counter_x >= 155 && i_counter_x < 307) //x-as
               begin               
                 if (i_counter_y >= 45 &&i_counter_y < 180)
                  begin                                  
                     if (i_counter_y >= 52 &&i_counter_y < 173 && i_counter_x >= 162 && i_counter_x < 300)       
                         begin
                           r_red <= 4'h0;    // black
                           r_blue <= 4'h0;
                           r_green <= 4'h0;                        
                         end  
                     else if(select >= 4'b0001)
                        begin
                          Flag1 <= 1;
                          reset_spel <= 1;
                        end
                     else                    
                        r_red <= 4'hF;    // red
                        r_blue <= 4'h0;
                        r_green <= 4'h0;
                        
                  end
               end                     
//////////////////////////////////////////////////////////////////////////////////////////////////////tweede vierkant
        4'b0100:
           if (i_counter_x >= 155 && i_counter_x < 307) //x-as
            begin  
                 if (i_counter_y >= 210 &&i_counter_y < 345)
                  begin                                  
                    if (i_counter_y >= 217 &&i_counter_y < 337 && i_counter_x >= 162 && i_counter_x < 300)                         
                        begin
                          r_red <= 4'h0;    // black
                          r_blue <= 4'h0;
                          r_green <= 4'h0;                        
                        end 
                    else if(select >= 4'b0001)
                      begin
                       Flag4 <= 1;  
                       reset_spel <= 1;
                      end
                    else                    
                       r_red <= 4'hF;    // red
                       r_blue <= 4'h0;
                       r_green <= 4'h0;                      
                 end           
            end     
//////////////////////////////////////////////////////////////////////////////////////////////////////derde vierkant
        4'b0111:
           if (i_counter_x >= 155 && i_counter_x < 307) //x-as
            begin  
                if (i_counter_y >= 375 &&i_counter_y < 505)
                 begin                                  
                    if (i_counter_y >= 382 &&i_counter_y < 498 && i_counter_x >= 162 && i_counter_x < 300) 
                        begin                        
                          r_red <= 4'h0;    // black
                          r_blue <= 4'h0;
                          r_green <= 4'h0;                        
                        end 
                        else if(select >= 4'b0001)
                          begin
                            Flag7 <= 1;  
                            reset_spel <= 1;
                          end
                        else                    
                        r_red <= 4'hF;    // red
                        r_blue <= 4'h0;
                        r_green <= 4'h0;
                    end
               end   
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    
		4'b0010:
////*****************************************VIERKANTEN TWEEDE RIJ*****************************************************	 else if (i_counter_x >= 357 && i_counter_x < 499) //x-as
             if (i_counter_x >= 357 && i_counter_x < 499) //x-as
                  begin               
///////////////////////////////////////////////////////////////////////////////////////////////////////eerste vierkant
                     if (i_counter_y >= 45 &&i_counter_y < 180)
                      begin                                  
                         if (i_counter_y >= 52 &&i_counter_y < 173 && i_counter_x >= 364 && i_counter_x < 492)       
                             begin
                               r_red <= 4'h0;    // black
                               r_blue <= 4'h0;
                               r_green <= 4'h0;                        
                             end  
                           else if(select >= 4'b0001)
                             begin
                               Flag2 <= 1;
                               reset_spel <= 1;
                             end
                          else                    
                            r_red <= 4'hF;    // red
                            r_blue <= 4'h0;
                            r_green <= 4'h0;
                      end    
                   end                 
 //////////////////////////////////////////////////////////////////////////////////////////////////////tweede vierkant
        4'b0101:
             if (i_counter_x >= 357 && i_counter_x < 499) //x-as
                   begin  
                     if (i_counter_y >= 210 &&i_counter_y < 345)
                      begin                                  
                        if (i_counter_y >= 217 &&i_counter_y < 337 && i_counter_x >= 364 && i_counter_x < 492)                         
                            begin
                              r_red <= 4'h0;    // black
                              r_blue <= 4'h0;
                              r_green <= 4'h0;                        
                            end  
                          else if(select >= 4'b0001)
                            begin
                             Flag5 <= 1; 
                             reset_spel <= 1;
                            end
                        else                    
                           r_red <= 4'hF;    // red
                           r_blue <= 4'h0;
                           r_green <= 4'h0;                      
                     end   
                  end             
///////////////////////////////////////////////////////////////////////////////////////////////////////derde vierkant
        4'b1000:
               if (i_counter_x >= 357 && i_counter_x < 499) //x-as
                 begin
                    if (i_counter_y >= 375 &&i_counter_y < 505)
                     begin                                  
                        if (i_counter_y >= 382 &&i_counter_y < 498 && i_counter_x >= 364 && i_counter_x < 492) 
                            begin                        
                              r_red <= 4'h0;    // black
                              r_blue <= 4'h0;
                              r_green <= 4'h0;                        
                            end  
                          else if(select >= 4'b0001)
                            begin
                             Flag8 <= 1; 
                             reset_spel <= 1;
                            end
                         else                    
                           r_red <= 4'hF;    // red
                           r_blue <= 4'h0;
                           r_green <= 4'h0;
                     end
               end                 
////*****************************************VIERKANTEN DERDE RIJ****************************************************
        4'b0011:
              if (i_counter_x >= 572 && i_counter_x < 722) //x-as
                  begin               
///////////////////////////////////////////////////////////////////////////////////////////////////////eerste vierkant
                     if (i_counter_y >= 45 &&i_counter_y < 180)
                      begin                                  
                         if (i_counter_y >= 52 &&i_counter_y < 173 && i_counter_x >= 579 && i_counter_x < 715)       
                             begin
                               r_red <= 4'h0;    // black
                               r_blue <= 4'h0;
                               r_green <= 4'h0;                        
                             end 
                            else if(select >= 4'b0001)
                             begin
                               Flag3 <= 1; 
                               reset_spel <= 1;
                             end 
                          else                    
                            r_red <= 4'hF;    // red
                            r_blue <= 4'h0;
                            r_green <= 4'h0;
                      end  
                   end                   
//////////////////////////////////////////////////////////////////////////////////////////////////////tweede vierkant
        4'b0110:
              if (i_counter_x >= 572 && i_counter_x < 722) //x-as
                  begin  
                     if (i_counter_y >= 210 &&i_counter_y < 345)
                      begin                                  
                        if (i_counter_y >= 217 &&i_counter_y < 337 && i_counter_x >= 579 && i_counter_x < 715)                         
                            begin
                              r_red <= 4'h0;    // black
                              r_blue <= 4'h0;
                              r_green <= 4'h0;                        
                            end 
                          else if(select >= 4'b0001)
                            begin
                             Flag6 <= 1; 
                             reset_spel <= 1;
                            end 
                        else                    
                           r_red <= 4'hF;    // red
                           r_blue <= 4'h0;
                           r_green <= 4'h0;                      
                     end 
                 end               
///////////////////////////////////////////////////////////////////////////////////////////////////////derde vierkant
        4'b1001:
              if (i_counter_x >= 572 && i_counter_x < 722) //x-as
                  begin  
                    if (i_counter_y >= 375 &&i_counter_y < 505)
                     begin                                  
                        if (i_counter_y >= 382 &&i_counter_y < 498 && i_counter_x >= 579 && i_counter_x < 715) 
                            begin                        
                              r_red <= 4'h0;    // black
                              r_blue <= 4'h0;
                              r_green <= 4'h0;                        
                            end 
                           else if(select >= 4'b0001)
                             begin
                              Flag9 <= 1; 
                              reset_spel <= 1; 
                             end
                         else                    
                           r_red <= 4'hF;    // red
                           r_blue <= 4'h0;
                           r_green <= 4'h0;
                     end
                  end                                                                    
//////////////////////////////////////////LIJNEN//////////////////////////////////////////////////////
        endcase 
        
        if( Flag1 )
             begin   
                if( turn == 1 &&  player1_1 == 0)
                  begin
                    p1_1 <= 1'b1;
                    player2_1 <= 1'b1;  
                  end 
                if( turn == 0 &&  player2_1 == 0)
                  begin
                    p2_1 <= 1'b1;
                    player1_1 <= 1'b1;  
                  end   
              end
        if( Flag2 )
            begin
              if( turn == 1 &&  player1_2 == 0) 
              begin                           
                p1_2 <= 1'b1;                 
                player2_2 <= 1'b1;            
              end                             
              if( turn == 0 &&  player2_2 == 0) 
              begin                           
                p2_2 <= 1'b1;                 
                player1_2 <= 1'b1;            
              end                             
             end 
        if( Flag3 )
          begin
                                          
            if( turn == 1 &&  player1_3 == 0)
            begin                            
              p1_3 <= 1'b1;                  
              player2_3 <= 1'b1;             
            end                              
            if( turn == 0 &&  player2_3 == 0)  
            begin                            
              p2_3 <= 1'b1;                  
              player1_3 <= 1'b1;             
            end                              
           end          
        if( Flag4 )
          begin
            if( turn == 1 &&  player1_4 == 0) 
            begin                             
              p1_4 <= 1'b1;                   
              player2_4 <= 1'b1;              
            end                               
            if( turn == 0 &&  player2_4 == 0) 
            begin                             
              p2_4 <= 1'b1;                   
              player1_4 <= 1'b1;              
            end                                        
           end                         
        if( Flag5 )
             begin
               if( turn == 1 &&  player1_5 == 0) 
             begin                             
               p1_5 <= 1'b1;                   
               player2_5 <= 1'b1;              
             end                               
             if( turn == 0 &&  player2_5 == 0) 
             begin                             
               p2_5 <= 1'b1;                   
               player1_5 <= 1'b1;              
             end                               
            end       
        if( Flag6 )
            begin
              if( turn == 1 &&  player1_6 == 0) 
            begin                             
              p1_6 <= 1'b1;                   
              player2_6 <= 1'b1;              
            end                               
            if( turn == 0 &&  player2_6 == 0) 
            begin                             
              p2_6 <= 1'b1;                   
              player1_6 <= 1'b1;              
            end                                        
           end            
        if( Flag7 )
            begin
              if( turn == 1 &&  player1_7 == 0) 
            begin                             
              p1_7 <= 1'b1;                   
              player2_7 <= 1'b1;              
            end                               
            if( turn == 0 &&  player2_7 == 0) 
            begin                             
              p2_7 <= 1'b1;                   
              player1_7 <= 1'b1;              
            end                                                
           end                    
        if( Flag8 )
            begin
              if( turn == 1 &&  player1_8 == 0) 
            begin                             
              p1_8 <= 1'b1;                   
              player2_8 <= 1'b1;              
            end                               
            if( turn == 0 &&  player2_8 == 0) 
            begin                             
              p2_8 <= 1'b1;                   
              player1_8 <= 1'b1;              
            end                                     
           end 
        if( Flag9 )
           begin
             if( turn == 1 &&  player1_9 == 0) 
           begin                             
             p1_9 <= 1'b1;                   
             player2_9 <= 1'b1;              
           end                               
           if( turn == 0 &&  player2_9 == 0) 
           begin                             
             p2_9 <= 1'b1;                   
             player1_9 <= 1'b1;              
           end                               
          end                            
        if(p1_1 == 1)
           begin
             if (i_counter_x >= 155 && i_counter_x < 307) //x-as   
               begin            
                if (i_counter_y >= 45 &&i_counter_y < 180)    
                  begin                                             
                     r_red <= 4'h0;    // green
                     r_blue <= 4'h0;
                     r_green <= 4'hF; 
                  end
               end             
           end 
        if(p2_1 == 1)
           begin
             if (i_counter_x >= 155 && i_counter_x < 307) //x-as 
              begin                                              
               if (i_counter_y >= 45 &&i_counter_y < 180)        
                begin                                            
                    r_red <= 4'h0;                               
                    r_blue <= 4'hF;                              
                    r_green <= 4'h0;                             
                end                                              
              end                                                   
           end 
        if(p1_2 == 1)
           begin     
             if (i_counter_x >= 357 && i_counter_x < 499) //x-as  
               begin                                              
                  if (i_counter_y >= 45 &&i_counter_y < 180)      
                   begin                                          
                         r_red <= 4'h0;    // green               
                         r_blue <= 4'h0;                          
                         r_green <= 4'hF;                         
                    end                                           
                end                                                                                                              
           end       
        if(p2_2 == 1)
           begin                
             if (i_counter_x >= 357 && i_counter_x < 499) //x-as  
               begin                                              
                  if (i_counter_y >= 45 &&i_counter_y < 180)      
                   begin                                          
                         r_red <= 4'h0;    // blue               
                         r_blue <= 4'hF;                          
                         r_green <= 4'h0;                         
                    end                                           
                end                                                                      
           end         
        if(p1_3 == 1)
           begin        
             if (i_counter_x >= 572 && i_counter_x < 722) //x-as  
               begin                                              
                  if (i_counter_y >= 45 &&i_counter_y < 180)      
                   begin                                                                                
                         r_red <= 4'h0;    // green               
                         r_blue <= 4'h0;                          
                         r_green <= 4'hF;                         
                    end                                           
                end                                                                      
           end          
        if(p2_3 == 1)
           begin        
             if (i_counter_x >= 572 && i_counter_x < 722) //x-as  
               begin                                              
                  if (i_counter_y >= 45 &&i_counter_y < 180)      
                   begin                                          
                         r_red <= 4'h0;    // blue               
                         r_blue <= 4'hF;                          
                         r_green <= 4'h0;                         
                    end                                           
                end                                                         
           end          
        if(p1_4 == 1)
           begin       
             if (i_counter_x >= 155 && i_counter_x < 307) //x-as       
               begin                                                   
                  if (i_counter_y >= 210 &&i_counter_y < 345)          
                   begin                                                                                        
                         r_red <= 4'h0;    // green                    
                         r_blue <= 4'h0;                               
                         r_green <= 4'hF;                              
                    end                                                
                end                                                         
           end         
        if(p2_4 == 1)
           begin       
             if (i_counter_x >= 155 && i_counter_x < 307) //x-as  
               begin                                                
                  if (i_counter_y >= 210 &&i_counter_y < 345)       
                   begin                                                                                  
                         r_red <= 4'h0;    // green                 
                         r_blue <= 4'hF;                            
                         r_green <= 4'h0;                           
                    end                                             
                end                                                         
           end         
        if(p1_5 == 1)
           begin       
             if (i_counter_x >= 357 && i_counter_x < 499) //x-as 
                begin                                            
                  if (i_counter_y >= 210 &&i_counter_y < 345)    
                    begin                                        
                       r_red <= 4'h0;    // green                
                      r_blue <= 4'h0;                            
                      r_green <= 4'hF;                           
                   end                                           
               end                                                         
           end         
        if(p2_5 == 1)
           begin       
             if (i_counter_x >= 357 && i_counter_x < 499) //x-as  
                begin                                          
                  if (i_counter_y >= 210 &&i_counter_y < 345)  
                    begin                                       
                       r_red <= 4'h0;    // green           
                      r_blue <= 4'hF;                      
                      r_green <= 4'h0;                     
                   end                                    
               end                        
           end
        if(p1_6 == 1)
           begin        
             if (i_counter_x >= 572 && i_counter_x < 722) //x-as     
                 begin                                               
                    if (i_counter_y >= 210 &&i_counter_y < 345)      
                     begin                                           
                          r_red <= 4'h0;    // green                 
                          r_blue <= 4'h0;                            
                          r_green <= 4'hF;                           
                    end                                              
                end                                                                           
           end          
        if(p2_6 == 1)
           begin        
             if (i_counter_x >= 572 && i_counter_x < 722) //x-as
                 begin                                          
                    if (i_counter_y >= 210 &&i_counter_y < 345) 
                     begin                                      
                          r_red <= 4'h0;    // green            
                          r_blue <= 4'hF;                       
                          r_green <= 4'h0;                      
                    end                                         
                end                                                                     
           end                   
        if(p1_7 == 1)
           begin       
             if (i_counter_x >= 155 && i_counter_x < 307) //x-as 
              begin                                              
                  if (i_counter_y >= 375 &&i_counter_y < 505)    
                   begin                                         
                          r_red <= 4'h0;    // green             
                          r_blue <= 4'h0;                        
                          r_green <= 4'hF;                       
                    end                                          
                 end                                                                     
           end          
        if(p2_7 == 1)
           begin        
             if (i_counter_x >= 155 && i_counter_x < 307) //x-as
              begin                                             
                  if (i_counter_y >= 375 &&i_counter_y < 505)   
                   begin                                        
                          r_red <= 4'h0;    // blue            
                          r_blue <= 4'hF;                       
                          r_green <= 4'h0;                      
                    end                                         
                 end                                                                     
           end          
        if(p1_8 == 1)
           begin        
             if (i_counter_x >= 357 && i_counter_x < 499) //x-as 
               begin                                             
                  if (i_counter_y >= 375 &&i_counter_y < 505)        
                   begin                                             
                         r_red <= 4'h0;    // green                  
                         r_blue <= 4'h0;                             
                         r_green <= 4'hF;                            
                   end                                               
             end                                                                             
           end          
        if(p2_8 == 1)
           begin        
             if (i_counter_x >= 357 && i_counter_x < 499) //x-as    
               begin                                                
                  if (i_counter_y >= 375 &&i_counter_y < 505)       
                   begin                                            
                         r_red <= 4'h0;    // blue                 
                         r_blue <= 4'hF;                            
                         r_green <= 4'h0;                           
                   end                                              
             end                                                                                           
           end          
        if(p1_9 == 1)
           begin        
             if (i_counter_x >= 572 && i_counter_x < 722) //x-as  
                 begin                                            
                   if (i_counter_y >= 375 &&i_counter_y < 505)    
                    begin                                         
                          r_red <= 4'h0;    // green              
                          r_blue <= 4'h0;                         
                          r_green <= 4'hF;                        
                    end                                           
                 end                                                                               
           end          
        if(p2_9 == 1)
            begin        
              if (i_counter_x >= 572 && i_counter_x < 722) //x-as   
                  begin                                             
                    if (i_counter_y >= 375 &&i_counter_y < 505)     
                     begin                                          
                           r_red <= 4'h0;    // blue               
                           r_blue <= 4'hF;                          
                           r_green <= 4'h0;                         
                     end                                            
                  end                                                                
            end 
            
            
            /////////////////////////////////////////////kijken als er 3 naast elkaar zijn (blauw)
            if(  p2_1 == 1 && p2_2 == 1  && p2_3 == 1) 
             begin                 
                finish = finish +1;
                spel = 1;
             end 
            else if(  p2_4 == 1 && p2_5 == 1  && p2_6 == 1) 
             begin  
                finish = finish +1;  
                spel = 1;                          
             end 
            else if(  p2_7 == 1 && p2_8 == 1  && p2_9 == 1) 
             begin 
                finish = finish +1;
                spel = 1;                               
             end                                                    
            else if(  p2_1 == 1 && p2_4 == 1  && p2_7 == 1) 
             begin 
                finish = finish +1;
                spel = 1;                                 
             end                                                   
            else if(  p2_2 == 1 && p2_5 == 1  && p2_8 == 1) 
             begin  
                finish = finish +1; 
                spel = 1;                                
             end                                                    
            else if(  p2_3 == 1 && p2_6 == 1  && p2_9 == 1) 
             begin 
                finish = finish +1; 
                spel = 1;                                 
             end              
            else if(  p2_1 == 1 && p2_5 == 1  && p2_9 == 1) 
             begin 
                finish <= finish +1;
                spel = 1;                                  
             end               
            else if(  p2_3 == 1 && p2_5 == 1  && p2_7 == 1)
             begin                                    
                finish <= finish +1;
                spel = 1;   
             end
             
             
             
             
             
             /////////////////////////////////////////////kijken als er 3 naast elkaar zijn (groen)            
                                                 
             else if(  p1_1 == 1 && p1_2 == 1  && p1_3 == 1)
              begin                                    
                 finish2 = finish2 +1;
                 spel = 1;                      
              end                                                   
             else if(  p1_4 == 1 && p1_5 == 1  && p1_6 == 1)
              begin                                    
                 finish2 = finish2 +1;
                 spel = 1;                        
              end                                                
             else if(  p1_7 == 1 && p1_8 == 1  && p1_9 == 1)
              begin                                    
                 finish2 = finish2 +1;
                 spel = 1;                       
              end                                                   
             else if(  p1_1 == 1 && p1_4 == 1  && p1_7 == 1)
              begin                                    
                 finish2 = finish2 +1;
                 spel = 1;                       
              end                                                   
             else if(  p1_2 == 1 && p1_5 == 1  && p1_8 == 1)
              begin                                    
                 finish2 = finish2 +1;
                 spel = 1;                       
              end                                                   
             else if(  p1_3 == 1 && p1_6 == 1  && p1_9 == 1)
              begin                                    
                 finish2 = finish2 +1;
                 spel = 1;                      
              end                                                   
             else if(  p1_1 == 1 && p1_5 == 1  && p1_9 == 1)
              begin                                    
                 finish2 = finish2 +1;  
                 spel = 1;                                                                             
              end                                                   
             else if(  p1_3 == 1 && p1_5 == 1  && p1_7 == 1)
              begin                                    
                finish2 = finish2 +1;
                spel = 1;                                          
              end                                       
              
              //// als het spel geen winaar is dan reset het spel zich                                                                                                                                                                                                                                         
              else if(Flag1 == 1 && Flag2 == 1  && Flag3 == 1 && Flag4 == 1 && Flag5 == 1  && Flag6 == 1 && Flag7 == 1 && Flag8 == 1  && Flag9 == 1)
                begin  
                  spel = 1;
                end             
                
                
                if(spel == 1)
                 begin
                   reset_spel <= 1;
                   Flag1 <= 0;     
                   Flag2 <= 0;     
                   Flag3 <= 0;     
                   Flag4 <= 0;     
                   Flag5 <= 0;     
                   Flag6 <= 0;     
                   Flag7 <= 0;     
                   Flag8 <= 0;     
                   Flag9 <= 0;     
                                   
                   player1_1 <= 0; 
                   player1_2 <= 0; 
                   player1_3 <= 0; 
                   player1_4 <= 0; 
                   player1_5 <= 0; 
                   player1_6 <= 0; 
                   player1_7 <= 0; 
                   player1_8 <= 0; 
                   player1_9 <= 0; 
                                   
                   player2_1 <= 0; 
                   player2_2 <= 0; 
                   player2_3 <= 0; 
                   player2_4 <= 0; 
                   player2_5 <= 0; 
                   player2_6 <= 0; 
                   player2_7 <= 0; 
                   player2_8 <= 0; 
                   player2_9 <= 0; 
                                   
                                   
                   p1_1 <= 0;      
                   p1_2 <= 0;      
                   p1_3 <= 0;      
                   p1_4 <= 0;      
                   p1_5 <= 0;      
                   p1_6 <= 0;      
                   p1_7 <= 0;      
                   p1_8 <= 0;      
                   p1_9 <= 0;      
                                   
                   p2_1 <= 0;      
                   p2_2 <= 0;      
                   p2_3 <= 0;      
                   p2_4 <= 0;      
                   p2_5 <= 0;      
                   p2_6 <= 0;      
                   p2_7 <= 0;      
                   p2_8 <= 0;      
                   p2_9 <= 0;                                      
                 end                                                                                                                             
         end
         
 
                                      

  assign led7  = Flag1;
  assign led8  = Flag2;
  assign led9  = Flag3;
  assign led10 = Flag4; 
  assign led11 = Flag5;                  
  assign led12 = Flag6;
  assign led13 = Flag7; 
  assign led14 = Flag8; 
  assign led15 = Flag9; 
  assign led0 = turn[0];
  assign led6 = finish[0];
  assign finish_ = finish;
  assign finish2_ = finish2;
endmodule  
					
						
						
