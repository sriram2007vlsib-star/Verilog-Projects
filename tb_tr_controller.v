module tb;
  reg clk,reset;
  wire[2:0] y;
  
  tr_light DUT(.clk(clk),.reset(reset),.y(y));
  
  always #5 clk = ~clk;
  
  initial begin
  $dumpfile("tr_light.vcd");
  $dumpvars(0, tb);
  $monitor("time=%0t y=%b state=%b", 
            $time, y, DUT.state);
  end
  
  initial begin
    clk=0;
    reset = 1; #10;
    reset = 0; #120;
    $finish;
  end
endmodule

    
  
