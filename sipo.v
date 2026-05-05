module sipo(
  input x,clk,reset,
  output[3:0] y);
  reg[3:0] shift_reg;
  
  always@(posedge clk) begin
    if(reset)
      shift_reg <= 4'b0000;
    else
      shift_reg <= {shift_reg[2:0],x};
  end
  assign y = shift_reg;
endmodule
      
    
