module tr_light(
  input clk,reset,
  output reg[2:0] y);
  
  reg[1:0] state,next_state;
  parameter red=2'b00,green=2'b01,yellow=2'b10;
  
  reg[1:0] count;
  
  always@(posedge clk) begin
    if(reset) begin
      state <= red;
      count <=0;
    end
    else begin
      if(count == 3) begin
        state <= next_state;
        count<=0;
      end
      
      else
        count <= count + 1;
    end
  end
  
  always@(*) begin
    case(state)
      red: begin
        next_state = green;
      end
      green: begin
        next_state = yellow;
      end
      yellow: begin
        next_state = red;
      end
      default: next_state = red;
      
    endcase
  end
  
  always@(*) begin
    case(state)
      red: y = 3'b100;
      green: y = 3'b010;
      yellow: y = 3'b001;
      default:y= 3'b000;
    endcase
  end
endmodule
        

      
     
