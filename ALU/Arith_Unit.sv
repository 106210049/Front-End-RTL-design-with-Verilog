// `include "CPU_package.sv"
import CPU_package::*;
module Arith 
(
    input wire [DATA_WIDTH-1:0] 	in_a,
    input wire [DATA_WIDTH-1:0] 	in_b,
    input wire 						        input_carry,
    input  enum_alu_opcode_t 		  alu_opcode,
  	output reg [DATA_WIDTH-1:0] 	arith_out,
  	output reg [1:0] 				      arith_out_flag 
);

initial begin
	arith_out=0;
	arith_out_flag=0;
end
always@(in_a,in_b,alu_opcode)	begin
		case(alu_opcode)
		ALU_OP_ADD: begin
          {arith_out_flag,arith_out}<=(DATA_WIDTH+1)'(in_a+in_b+input_carry);
		end
		ALU_OP_SUB: begin
          {arith_out_flag,arith_out}<=(DATA_WIDTH+1)'(in_a-in_b-input_carry);
		end
        ALU_OP_INC: begin
          {arith_out_flag,arith_out}<=in_a+1;
        end
        ALU_OP_DEC: begin
          {arith_out_flag,arith_out}<=in_a-1;
        end
        ALU_OP_SHL: begin
          {arith_out_flag,arith_out} <= {in_a, input_carry};
		end
        ALU_OP_SHR: begin
          {arith_out_flag,arith_out} <= {input_carry, in_a};
        end
        endcase
	end
endmodule: Arith