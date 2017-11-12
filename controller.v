`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:53 11/09/2017 
// Design Name: 
// Module Name:    controller 
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
module controller(input st,rst,clk,output reg memin_read,memin_write,Awrite,Bwrite,Reswrite,memout_read,
                  memout_write,clearRes,done , output reg[4:0]addr , output reg[4:0]addr18 ,output reg[1:0]part);

reg [3:0] ps;
reg [3:0] ns;
reg [4:0] count18 = 5'd0;
reg c18 = 1'd0;
reg [1:0] count3 = 2'd0;
reg c3 = 1'd0;
reg [3:0] count9 = 4'd0;
reg c9 = 1'd0;

reg [4:0] count27 = 5'd0;
reg c27 = 1'd0;

always@( /*st ,ps ,c18 ,c3 ,c9 ,c27 ,count3, count9, count27*/ /*posedge clk*/ * ) begin
  ns = 4'd0;
  case(ps)
  
  4'b0000: ns = (st)? 4'b0001 : 4'b0000; 

  4'b0001: ns = (~st)? 4'b0010 : 4'b0001;  
 
  4'b0010: ns = (c18)? 4'b0011 : 4'b0010;

  4'b0011: ns = 4'b0100;

  4'b0100: ns = 4'b0101;

  4'b0101: ns = 4'b0110;

  4'b0110: ns = (c3) ? 4'b0111 : 4'b0011;

  4'b0111: ns=4'b1000;

  4'b1000: ns = (c9)?4'b1001 : 4'b0011;

  4'b1001: ns = 4'b1010;

  4'b1010: ns = (c27)? 4'b0000 : 4'b1010;
  
  default: ns = 4'b0000;
  
  endcase
  
end
always@( /*st, ps, count3, count9, count18, count27*/ posedge clk) begin
  memin_read=0; 
  memin_write=0; 
  Awrite=0; 
  Bwrite=0; 
  Reswrite=0; 
  memout_read=0; 
  memout_write=0; 
  clearRes=0; 
  done=0;
  addr = 4'b0000; addr18 = 4'b0000; part = 2'd0;
 
  case(ps)
  
  4'b0000: begin memout_read = 1'd0; end
  
  4'b0010: begin 
           memout_write = 0;
           if (c18 != 5'd18)
           memin_write = 1;
           addr = count18;
           if(count18 < 5'd17)
          	 count18 <= count18 + 1; 
           else
		c18 <= 1'd1;
  
           end

  4'b0011: begin
           memin_read = 1; 
           memin_write = 0; 
           memout_write = 0;
           Awrite = 1;  
           clearRes = 0;

           if ( count9 < 4'b0011)
          	 addr = count3;
	   else if ( count9 < 4'b0110 )
	  	 addr = 3 + count3;
	   else if ( count9 < 4'b1001 )
	  	 addr = 6 + count3;
           end
  4'b0100: begin
           memin_read = 1; 
           memin_write = 0;
           memout_write = 0;
           Bwrite = 1; 
           Awrite = 0;
	   if ( count9 < 4'b0011)
	   	addr = (count3*3) + count9 + 9;
	   else if ( count9 < 4'b0110 )
		addr = (count3*3) + count9 + 6;
	   else if ( count9 < 4'b1001 )
		addr = (count3*3) + count9 + 3;

          end
   
  4'b0110: begin 
           memin_write = 0;
           memout_write = 0;
           Reswrite = 1; 

           if(count3 < 3)
          	 count3 <= count3 + 2'd1; 
           else
		c3 = 1'd1;
           
          
           memin_read = 0; 
           Bwrite = 0;
           end

  4'b0111: begin memout_write = 1;memin_write = 0; addr18= count9; Reswrite = 0; count3 <= 2'd0; c3 = 1'd0; end

  4'b1000: begin 
          clearRes = 1; 
          memin_write = 0;
          memout_write = 0; 
          if(count9 < 4'b1000)
         	 count9 <= count9+1;  
          else
                 c9 <= 1'd1;    
          end

  4'b1001: begin done = 1; memin_write = 0; memout_write = 0;  end

  4'b1010: begin 
                memout_write = 0; 
                memin_write = 0;
                if( count27 < 5'd26)
			count27 <= count27 + 5'd1;
                else
                	c27 = 1'd1;

                memout_read =1;

          if( count27 == 5'd0 || count27 == 5'd1 || count27 == 5'd2)
            	addr18 = 4'd0;
          else if  ( count27 == 5'd3 || count27 == 5'd4 || count27 == 5'd5)
            addr18 = 4'd1;
          else if  ( count27 == 5'd6 || count27 == 5'd7 || count27 == 5'd8)
            addr18 = 4'd2;
          else if  ( count27 == 5'd9 || count27 == 5'd10 || count27 == 5'd11)
            addr18 = 4'd3;
          else if  ( count27 == 5'd12 || count27 == 5'd13 || count27 == 5'd14)
            addr18 = 4'd4;
          else if  ( count27 == 5'd15 || count27 == 5'd16 || count27 == 5'd17)
            addr18 = 4'd5;
          else if  ( count27 == 5'd18 || count27 == 5'd19 || count27 == 5'd20)
            addr18 = 4'd6;
          else if  ( count27 == 5'd21 || count27 == 5'd22 || count27 == 5'd23)
            addr18 = 4'd7;
          else if  ( count27 == 5'd24 || count27 == 5'd25 || count27 == 5'd26)
            addr18 = 4'd8;
          else 
             addr18 = 4'd9;
           part = count27-(addr18*3); 
       end
  
  default:{ memin_read, memin_write ,Awrite,Bwrite,
            Reswrite,memout_read,memout_write,clearRes,done, addr, addr18, part}= 21'd0;
  
  endcase
  
end

always@(posedge clk , posedge rst) begin
  if(rst) ps<= 4'b0;
  else ps <= ns;
end

endmodule