`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:28 11/09/2017 
// Design Name: 
// Module Name:    Res 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Res(input clk, input rst,input clearRes, input[17:0] data_in, input Reswrite, output[17:0] res_out);
  reg[17:0] data;
  
   always@(posedge clk)
    begin
      if(rst)
        data<= 18'd0;
      if(clearRes)
	data <= 18'd0;
      if(Reswrite)
        data <= data_in;
     end
    
  assign res_out = data;
      

endmodule