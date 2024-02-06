// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module ALU_tb;
import CPU_package::*;
  reg [DATA_WIDTH-1:0] 	in_a;
  reg [DATA_WIDTH-1:0] 	in_b;
  reg					input_carry;
  enum_alu_opcode_t 	alu_opcode;
  reg 				    mode;
  wire [DATA_WIDTH-1:0] alu_out;
  struct_alu_flag_t 	alu_out_flag; 

  ALU alu(
    		.in_a(in_a),
            .in_b(in_b),
            .input_carry(input_carry),
            .alu_opcode(alu_opcode),
    		.mode(mode),
    		.alu_out(alu_out),
    		.alu_out_flag(alu_out_flag)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    in_a=0;
    in_b=0;
    mode=0;
    input_carry=0;
  end
  
  initial begin
    mode=0;
    in_a=1;
    in_b=0;
    alu_opcode=ALU_OP_AND;
    #10
    mode=0;
    in_a=1;
    in_b=1;
    alu_opcode=ALU_OP_AND;
    #10
    mode=0;
    in_a=1;
    in_b=0;
    alu_opcode=ALU_OP_OR;
    #10
    mode=0;
    in_a=16'd2;
    in_b=16'd2;
    alu_opcode=ALU_OP_CPR;
    #10
    mode=0;
    in_a=16'd20;
    in_b=16'd10;
    alu_opcode=ALU_OP_CPR;
    #10
    mode=0;
    in_a=16'd2;
    in_b=16'd10;
    alu_opcode=ALU_OP_CPR;
    #10
    mode=1;
    alu_opcode=ALU_OP_ADD;
    for (int i=0;i<16;i=i+1) begin
      #20
      in_a=i;
      for(int j=0;j<9;j=j+1) begin
        #10
        in_b=j;
      end
    end

    #10
    mode=1;
    in_a=16'd4;
    alu_opcode=ALU_OP_SHR;
    #10
    mode=1;
    in_a=16'd4;
    alu_opcode=ALU_OP_SHL;
    #10
    $finish;
  end
endmodule
    
    