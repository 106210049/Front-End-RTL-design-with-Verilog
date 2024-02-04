// Code your testbench here
// or browse Examples
module tb;
  reg [2:0] IN;
  wire [7:0] OUT;
  
  Binary_decoder3to8 bin_dec(.IN(IN), .OUT(OUT));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor("IN = %b -> OUT = %0b", IN, OUT);
    repeat(5) begin
      IN=$random; #1;
    end
  end
endmodule