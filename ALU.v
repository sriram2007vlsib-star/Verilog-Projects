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

//Testbench

module tb;
  reg[3:0]a,b;
  reg[2:0]sel;
  wire[3:0]result;
  alu DUT(.a(a),.b(b),.sel(sel),.result(result));
  initial begin
  // dump waveform
  $dumpfile("dump.vcd");
  $dumpvars(0, tb);
end

initial begin
  $monitor("a=%b b=%b sel=%b | result=%b",
            a, b, sel,result);
  //testcases
  a=4'b0000; b=4'b0001; sel=3'b000; #10;
  a=4'b0110; b=4'b1101; sel=3'b110; #10;
  a=4'b1110; b=4'b1101; sel=3'b111; #10;
  a=4'b1111; b=4'b1111; sel=3'b001; #10;
  a=4'b0001; b=4'b0001; sel=3'b010; #10;
  a=4'b1101; b=4'b1101; sel=3'b110; #10;
  a=4'b0010; b=4'b0010; sel=3'b011; #10;
  a=4'b1010; b=4'b1010; sel=3'b100; #10;
  a=4'b0101; b=4'b0101; sel=3'b101; #10;
end
endmodule
