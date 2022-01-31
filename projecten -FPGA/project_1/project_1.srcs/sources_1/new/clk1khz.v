`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2022 20:51:50
// Design Name: 
// Module Name: clk1khz
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk1khz(
    input clk,
    output reg [6:0] clk1khz 
    );
    
 always @(posedge clk) 
 begin
    if(clk <= 7'b1100100)
      clk1khz <= clk1khz + 1;
    else 
     clk1khz <= 0;
end
    
    
endmodule
