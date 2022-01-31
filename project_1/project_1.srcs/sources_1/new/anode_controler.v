module anode_controler(
    input [1:0] refreshcounter, //10khz
    output reg [3:0] anode = 0
    );
    
always @ (refreshcounter)
begin
    case (refreshcounter)
        2'b00:
          anode = 4'b1110; //anode 1 is aan 
        2'b01:              
          anode = 4'b1111; //anode 2 is aan  
        2'b10:              
          anode = 4'b1111; //anode 3 is aan  
        2'b11:              
          anode = 4'b0111; //anode 4 is aan  
    endcase
end

endmodule
