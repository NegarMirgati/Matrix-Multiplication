`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:01 11/09/2017 
// Design Name: 
// Module Name:    MultOperand 
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
module MultOperand(input clk, input rst, input[7:0] data_in, input Write, output[7:0] out);
   
   reg[7:0] data;
   
   always@(posedge clk)
    begin
      if(rst)
        data <= 8'd0;
      if(Write)
        data <= data_in;
    end
        
  assign out = data;
        


endmodule