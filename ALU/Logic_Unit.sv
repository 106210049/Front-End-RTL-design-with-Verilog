// `include "CPU_package.sv"
import CPU_package::*;
module Logic( 
    input logic [DATA_WIDTH-1:0] 	in_a,
	input logic [DATA_WIDTH-1:0] 	in_b,
	input  enum_alu_opcode_t 		alu_opcode,
  	output logic [DATA_WIDTH-1:0] 	logic_out,
  	output logic [2:0]				logic_out_flag 
);
  
always_comb		begin: logic_proc
  		logic_out='0;
  		logic_out_flag='{default:0};
  
		case(alu_opcode)
            ALU_OP_CPR: begin
              logic_out_flag[2:0]=0;
                if(in_a>in_b)   begin
//                   logic_out_flag[2]=1;
//                   logic_out_flag[1]=0;
//                   logic_out_flag[0]=0;
                  logic_out_flag=3'b010;
                end
                else if(in_a==in_b) begin
//                   logic_out_flag[1]=1;
//                   logic_out_flag[2]=0;
//                   logic_out_flag[0]=0;
                  logic_out_flag=3'b100;
                end
                else begin
//                   logic_out_flag[0]=1;
//                   logic_out_flag[2]=0;
//                   logic_out_flag[1]=0;
                  logic_out_flag=3'b001;
                end
            end
            ALU_OP_AND: begin
              logic_out=in_a&in_b;
            end
            ALU_OP_OR: begin
              logic_out=in_a|in_b;
            end
            ALU_OP_XOR: begin
             logic_out=in_a^in_b;
            end
            ALU_OP_NOTA: begin
              logic_out=~in_a;
            end
          	ALU_OP_NOTB: begin
              logic_out=~in_b;
            end
        endcase
	end: logic_proc
endmodule: Logic
