module tb;
  reg[3:0] x;
  reg clk,reset,load;
  wire y;
  
  piso DUT(.x(x),.clk(clk),.reset(reset),.load(load),.y(y));
  
  always #5 clk = ~clk;
   initial begin
    $dumpfile("piso.vcd");
    $dumpvars(0, tb);
    $monitor("time=%0t load=%b x=%b y=%b", $time, load, x, y);
   end
  
  initial begin
    clk=0;
    x=0;
    reset = 1; #10;
    reset = 0;
    
    load = 1; x=4'b1011; #10;
    
    load = 0; #10;
    load = 0; #10;
    
    load = 0; #10;
    load = 0; #10;
    $finish;
    
   
  end
endmodule
