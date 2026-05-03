module tb;
  reg x,clk,reset;
  wire y;
  fsm DUT(.x(x),.clk(clk),.reset(reset),.y(y));
  always #5 clk = ~clk;
  
   initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
   end
  
  initial begin
    clk=0;
    x=0;
    reset=1;
    
    #3 reset = 0;
    
    #7 x=1;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=1;
    #10 x=0;
    #20 $finish;
  end
endmodule
