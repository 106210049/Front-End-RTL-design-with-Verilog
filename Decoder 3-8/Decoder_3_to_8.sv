// Code your design here
module Binary_decoder3to8(IN,OUT);
  input wire [2:0] IN;
  output reg [7:0] OUT;
  
  always @(IN[2:0])
    begin
      case(IN[2:0])
        3'b000: OUT[7:0]=8'b00000001;
        3'b001: OUT[7:0]=8'b00000010;
        3'b010: OUT[7:0]=8'b00000100;
        3'b011: OUT[7:0]=8'b00001000;
        3'b100: OUT[7:0]=8'b00010000;
        3'b101: OUT[7:0]=8'b00100000;
        3'b110: OUT[7:0]=8'b01000000;
        3'b111: OUT[7:0]=8'b10000000;
      endcase
    end
endmodule
