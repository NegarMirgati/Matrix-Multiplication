`timescale 1ns/1ns
module tb;

  // Inputs
  reg st = 1'd0;
  reg rst = 1'd0;
  reg clk = 1'd0;
  reg [7:0] data_in = 8'd0;

  // Outputs
  wire done;
  wire [7:0] dataout;

  // Instantiate the Unit Under Test (UUT)
  matrixMultiplier uut (
    .st(st), 
    .rst(rst), 
    .clk(clk), 
    .data_in(data_in), 
    .done(done), 
    .dataout(dataout)
  );
  
    
    
initial begin 
    #50
    rst = 1;
    #100
    clk = ~clk;
    #1000
    clk = ~clk;
    #1000
    rst = 0;
    #50
    st = 1;
    #100
    clk = ~clk;
    #1000
    clk = ~clk;
    #1000
    st = 0;
    #1000;
    repeat(100) begin
    #1000
    clk = ~clk;
    if(clk == 1'd1)
    data_in = data_in + 8'd1;
    end
      
    repeat(1000) #10000 clk = ~clk;
  end
      
endmodule