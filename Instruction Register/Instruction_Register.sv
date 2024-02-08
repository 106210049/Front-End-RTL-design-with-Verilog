// Code your design here
`include "CPU_package.sv"
import CPU_package::*;
module Instruction_Register( iclk, loadIR, insin, address, opcode);
  input iclk;
  input loadIR;
  input  wire [DATA_WIDTH-1:0] insin;
  output reg  [DATA_WIDTH-ALU_OPCODE-2:0] address; 
  output reg  [ALU_OPCODE:0] opcode; 


  reg [DATA_WIDTH-1:0] temp;
  always@(posedge iclk)
  begin
      if(loadIR == 1) begin
      temp <= insin;
      end
    address <= temp[DATA_WIDTH-ALU_OPCODE-2:0]; //[10:0]
    opcode 	<= temp[DATA_WIDTH-1:DATA_WIDTH-ALU_OPCODE-1]; //[15:11]
  end
  
endmodule