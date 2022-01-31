module buttonpress(
    input  button,
    input  reset,
    output  led,
    output  led2,
    output  led3,
    output  led4,
    output reg [3:0]count
    );



always @ (posedge button or posedge reset )
 begin
  if (reset || count >= 4'b1001)
   count <= 4'b0001;
  else if (button)
   count <= count + 1;
 end

 
assign led  = count[0];
assign led2 = count[1];
assign led3 = count[2];
assign led4 = count[3];


endmodule
