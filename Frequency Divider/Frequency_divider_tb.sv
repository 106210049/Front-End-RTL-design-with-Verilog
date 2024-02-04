// Code your testbench here
// or browse Examples
module Frequency_divider_by5_tb;
  reg CLK_IN;
  reg RST;
  wire CLK_OUT;
  Frequency_divider_by5 FD5(.CLK_IN(CLK_IN),.RST(RST),.CLK_OUT(CLK_OUT));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  	RST=1;
    CLK_IN=0;
    #2
    RST=0;
    #100
    RST=1;
    #20
    RST=0;
  	#100
    $finish;
  end
      always #2 CLK_IN=~CLK_IN;

endmodule