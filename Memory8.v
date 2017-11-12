`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:10 11/09/2017 
// Design Name: 
// Module Name:    Memory8 
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
module Memory8 (input clk, input rst, input[7:0] data_in,input[4:0] addr,
                 input memWrite,input memRead, output reg[7:0] out);
  
 reg [7:0] dataMem [31:0];
 integer i;
 
 always@(posedge clk, posedge rst)
  begin
    if(rst)
      begin
        for(i = 0; i< 32 ; i = i + 1)
          dataMem[i] <= 8'd0;
      end
    else if(memWrite)
      dataMem[addr] <= data_in;
  end
  
 always@ (memRead, addr)
  begin
    if(memRead) begin
      out <= dataMem[addr];
      end
		else
		begin end
  end
  
  
 
endmodule