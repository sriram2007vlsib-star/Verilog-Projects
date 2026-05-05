module tb;
  reg x,clk,reset;
  wire[3:0] y;
  
  sipo DUT(.x(x),.clk(clk),.reset(reset),.y(y));
  always #5 clk = ~clk;
  
  initial begin
  $dumpfile("sipo.vcd");
  $dumpvars(0, tb);
  $monitor("time=%0t x=%b y=%b", $time, x, y);
  end
  
  initial begin
    clk = 0;
    x = 0;
    reset = 1; #10;
    reset = 0;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=1;
    
    #10 x = 0;
    #10 x = 0;
    #10 x = 0;
    #10 x = 0;
    $finish;
  end
endmodule
