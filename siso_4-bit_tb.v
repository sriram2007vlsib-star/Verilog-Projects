//Testbench for SISO:
module tb;
  reg din,clk,reset;
  wire dout;
  
  siso DUT(.din(din),.clk(clk),.reset(reset),.dout(dout));
  
  always #5 clk = ~clk;
  
  initial begin
  $dumpfile("siso.vcd");   // file name
  $dumpvars(0, tb);   // what to record
  end
  
 initial begin
    $monitor("time=%0t din=%b dout=%b shift_reg=%b", 
              $time, din, dout, DUT.shift_reg);
  end
  
  initial begin
    clk = 0;
    din = 0;
    
    reset = 1; #10;
    reset = 0; 
    
    #10 din=1;
    #10 din=0;
    #10 din=1;
    #10 din=0;
    
    #10 din = 0;
    #10 din = 0;
    #10 din = 0;
    #10 din = 0;
    
    #40 $finish;
    
  end
endmodule
    
    
