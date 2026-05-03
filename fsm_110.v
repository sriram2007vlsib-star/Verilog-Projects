module fsm(
  input x,clk,reset,
  output y);
  
  reg[1:0] state,next_state;
  parameter a=2'b00,b=2'b01,c=2'b10,d=2'b11;
  always@(posedge clk) begin
    if(reset)
      state<=a;
    else
      state<=next_state;
  end
  
  assign y=(state == d);
  
  always@(*) begin
    case(state)
      a:begin
        if(x)
          next_state = b;
        else
          next_state = a;
      end
      b:begin
        if(x)
          next_state = c;
        else
          next_state = a;
      end
      c:begin
        if(x)
          next_state = c;
        else
          next_state = d;
      end
      d:begin
        if(x)
          next_state = b;
        else
          next_state = a;
      end
      default: next_state = a;
    endcase
  end
endmodule
