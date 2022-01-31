`timescale 1ns / 1ps


module state(
    input D,
    output led0,
    output  reg[1:0] Q
    );
    

  always @ (posedge D )
 begin
  if(Q > 1'b0)
    Q <= 1'b0;
  else if(D)
    Q <= Q + 1;
  end
assign led0 = Q[0];
  
     

endmodule
