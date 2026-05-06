module piso(
  input[3:0] x, 
  input clk,reset,load,
  output y);
  
  reg[3:0] shift_reg;
  
  always@(posedge clk) begin
    if(reset)
      shift_reg <= 4'b0000;
    else if(load)
      shift_reg <= x;
    else
      shift_reg <= {shift_reg[2:0] , 1'b0};
  end
  assign y = shift_reg[3];
endmodule
      
      
