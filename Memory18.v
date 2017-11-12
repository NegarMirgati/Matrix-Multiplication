`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:43 11/09/2017 
// Design Name: 
// Module Name:    Memory18 
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
(*ram_style ="block"*)
module Memory18  (input clk, input rst, input[17:0] data_in,input[4:0] addr,input memWrite,input memRead, output reg[17:0] out);
  
 reg [17:0] dataMem [31:0];
 integer i;
 
 always@(posedge clk, posedge rst)
  begin
    if(rst)
      begin
        for(i = 0; i< 32 ; i = i + 1)
          dataMem[i] <= 18'd0;
      end
      
   else if(memWrite) begin
      dataMem[addr] <= data_in;

      end 
  end
  
 always@ (memRead, addr)
  begin
    if(memRead && addr <= 5'd8)
      out <= dataMem[addr];
		else
		begin out<= 8'd0; end
  end
  
  
 
endmodule