// Code your design here
`include"CPU_package.sv"
import CPU_package::*;

module Instruction_memory(
  	input wire clk,
	input wire we_IM,
    input wire [DATA_WIDTH-1:0] dataIM,
    input wire [ADDRESS_WIDTH-1:0] address_IM,
  	output reg [DATA_WIDTH-1:0] out_IM
);
  reg [DATA_WIDTH-1:0]memory[ADDRESS_MAX_WIDTH];
  always@(posedge clk)	begin
    if(we_IM==1)	begin
      memory[address_IM]<=dataIM;
    end
    else if(we_IM==0)	begin
      out_IM<=memory[address_IM];
    end
  end
endmodule