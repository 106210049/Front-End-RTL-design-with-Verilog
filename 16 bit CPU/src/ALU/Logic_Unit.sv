// `include "CPU_package.sv"
import CPU_package::*;
module Logic( 
    input wire [DATA_WIDTH-1:0] 	in_a,
	input wire [DATA_WIDTH-1:0] 	in_b,
	input  enum_alu_opcode_t 		alu_opcode,
  	output reg [DATA_WIDTH-1:0] 	logic_out,
  	output reg [2:0]				logic_out_flag 
);

initial begin
	logic_out=0;
	logic_out_flag[2:0]=0;
end

always@(in_a,in_b,alu_opcode)	begin
		case(alu_opcode)
            ALU_OP_CPR: begin
              logic_out_flag[2:0]<=0;
                if(in_a>in_b)   begin
//                   logic_out_flag[2]=1;
//                   logic_out_flag[1]=0;
//                   logic_out_flag[0]=0;
                  logic_out_flag<=3'b010;
                end
                else if(in_a==in_b) begin
//                   logic_out_flag[1]=1;
//                   logic_out_flag[2]=0;
//                   logic_out_flag[0]=0;
                  logic_out_flag<=3'b100;
                end
                else begin
//                   logic_out_flag[0]=1;
//                   logic_out_flag[2]=0;
//                   logic_out_flag[1]=0;
                  logic_out_flag<=3'b001;
                end
            end
            ALU_OP_AND: begin
              logic_out<=in_a&in_b;
            end
            ALU_OP_OR: begin
              logic_out<=in_a|in_b;
            end
            ALU_OP_XOR: begin
             logic_out<=in_a^in_b;
            end
            ALU_OP_NOT: begin
              logic_out<=~in_a;
            end
        endcase
	end
endmodule: Logic// `include "CPU_package.sv"
import CPU_package::*;
module Logic( 
    input wire [DATA_WIDTH-1:0] 	in_a,
	input wire [DATA_WIDTH-1:0] 	in_b,
	input  enum_alu_opcode_t 		alu_opcode,
  	output reg [DATA_WIDTH-1:0] 	logic_out,
  	output reg [2:0]				logic_out_flag 
);

initial begin
	logic_out=0;
	logic_out_flag[2:0]=0;
end

always@(in_a,in_b,alu_opcode)	begin
		case(alu_opcode)
            ALU_OP_CPR: begin
              logic_out_flag[2:0]<=0;
                if(in_a>in_b)   begin
//                   logic_out_flag[2]=1;
//                   logic_out_flag[1]=0;
//                   logic_out_flag[0]=0;
                  logic_out_flag<=3'b010;
                end
                else if(in_a==in_b) begin
//                   logic_out_flag[1]=1;
//                   logic_out_flag[2]=0;
//                   logic_out_flag[0]=0;
                  logic_out_flag<=3'b100;
                end
                else begin
//                   logic_out_flag[0]=1;
//                   logic_out_flag[2]=0;
//                   logic_out_flag[1]=0;
                  logic_out_flag<=3'b001;
                end
            end
            ALU_OP_AND: begin
              logic_out<=in_a&in_b;
            end
            ALU_OP_OR: begin
              logic_out<=in_a|in_b;
            end
            ALU_OP_XOR: begin
             logic_out<=in_a^in_b;
            end
            ALU_OP_NOT: begin
              logic_out<=~in_a;
            end
        endcase
	end
endmodule: Logic// `include "CPU_package.sv"
import CPU_package::*;
module Logic( 
    input wire [DATA_WIDTH-1:0] 	in_a,
	input wire [DATA_WIDTH-1:0] 	in_b,
	input  enum_alu_opcode_t 		alu_opcode,
  	output reg [DATA_WIDTH-1:0] 	logic_out,
  	output reg [2:0]				logic_out_flag 
);

initial begin
	logic_out=0;
	logic_out_flag[2:0]=0;
end

always@(in_a,in_b,alu_opcode)	begin
		case(alu_opcode)
            ALU_OP_CPR: begin
              logic_out_flag[2:0]<=0;
                if(in_a>in_b)   begin
//                   logic_out_flag[2]=1;
//                   logic_out_flag[1]=0;
//                   logic_out_flag[0]=0;
                  logic_out_flag<=3'b010;
                end
                else if(in_a==in_b) begin
//                   logic_out_flag[1]=1;
//                   logic_out_flag[2]=0;
//                   logic_out_flag[0]=0;
                  logic_out_flag<=3'b100;
                end
                else begin
//                   logic_out_flag[0]=1;
//                   logic_out_flag[2]=0;
//                   logic_out_flag[1]=0;
                  logic_out_flag<=3'b001;
                end
            end
            ALU_OP_AND: begin
              logic_out<=in_a&in_b;
            end
            ALU_OP_OR: begin
              logic_out<=in_a|in_b;
            end
            ALU_OP_XOR: begin
             logic_out<=in_a^in_b;
            end
            ALU_OP_NOT: begin
              logic_out<=~in_a;
            end
        endcase
	end
endmodule: Logic