// `include "CPU_package.sv"
import CPU_package::*;
module Arith 
(
    input logic [DATA_WIDTH-1:0] 	in_a,
	input logic [DATA_WIDTH-1:0] 	in_b,
	input logic  					input_carry,
	input  enum_alu_opcode_t 		alu_opcode,
  	output logic [DATA_WIDTH-1:0] 	arith_out,
  	output logic [1:0] 				arith_out_flag 
);


always_comb	 begin: arith_proc
  		arith_out=0;
  		arith_out_flag='{default:0};
  
		case(alu_opcode)
		ALU_OP_ADD: begin
          {arith_out_flag,arith_out}=(DATA_WIDTH+1)'(in_a+in_b+input_carry);
		end
		ALU_OP_SUB: begin
          {arith_out_flag,arith_out}=(DATA_WIDTH+1)'(in_a-in_b-input_carry);
		end
        ALU_OP_DIV: begin
          {arith_out_flag,arith_out}=in_a/in_b;
        end
        ALU_OP_MUL: begin
          {arith_out_flag,arith_out}=(DATA_WIDTH+1)'(in_a*in_b);
        end
        ALU_OP_INC: begin
          {arith_out_flag,arith_out}=(DATA_WIDTH+1)'(in_a+1);
        end
        ALU_OP_DEC: begin
          {arith_out_flag,arith_out}=(DATA_WIDTH+1)'(in_a-1);
        end
        ALU_OP_SHL: begin
          {arith_out_flag,arith_out} = {in_a, input_carry};
		end
        ALU_OP_SHR: begin
          {arith_out_flag,arith_out} = {input_carry, in_a};
        end
        endcase
	end: arith_proc
endmodule: Arith
