module button_select(
    input  button2,    
    input  reset,
    input  reset2,
    output  led5,
    output reg flag,
    output reg [1:0]count2
    );

always @ (posedge button2 or posedge reset or posedge reset2)
 begin
  if(reset || reset2)
  begin
   count2 <= 2'b00;
   flag <= 1'b0;
   end
  else if(count2 > 2'b00)
  begin
   flag <= 1'b1;
   count2 <= 2'b00;
  end
  else if(button2)
   count2 <= count2 + 1;
 end
 
 assign led5 = count2[0];
 //assign led6 = count2[1];
// assign led7 = count2[2];
// assign led8 = count2[3];
// assign reset = count2[1];

 
 endmodule

