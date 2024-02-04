// Code your design here
module Frequency_divider_by5(CLK_IN,RST,CLK_OUT);
  input wire CLK_IN;
  input wire RST;
  output reg CLK_OUT;
  
  reg [2:0] count;
  always @(posedge CLK_IN or posedge RST)
    begin
      if(RST)
        begin 
          count<=3'b000;
          CLK_OUT<=0;
        end
      else if(count[2:0]==3'b100)
        begin
          count<=3'b000;
          CLK_OUT <= ~ CLK_OUT;
        end
      else
        begin
          count<=count+1;
        end
    end
endmodule
