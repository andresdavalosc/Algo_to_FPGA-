`timescale 1ns / 1ps

module BCD_control(
    input [3:0] digit1,
    input [3:0] digit2,
    input [1:0] refreshcounter,
    output reg [3:0] one_digit = 0
    );
    
always @ (refreshcounter)
    begin
        case (refreshcounter)
            2'b00:
                one_digit  = digit1; //anode 1 is aan 
            2'b01:                
                one_digit  = 0;                      
            2'b10:                                                
                one_digit  = 0;                      
            2'b11:
                one_digit  = digit2; //anode 4 is aan
        endcase
    end    
endmodule
