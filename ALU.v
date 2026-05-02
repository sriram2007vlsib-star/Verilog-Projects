//ALU DESIGN
module alu(
  input[3:0]a,
  input[3:0]b,
  input[2:0]sel,
  output reg[3:0]result);
  always@(*) begin
    case(sel)
      3'b000:result = a+b;
      3'b001:result = a-b;
      3'b010:result = a&b;
      3'b011:result = a|b;
      3'b100:result = ~a;
      3'b101:result = ~b;
      3'b110:result = a>>b;
      3'b111:result = a<<b;
      default:result=3'b000;
    endcase
  end
endmodule


