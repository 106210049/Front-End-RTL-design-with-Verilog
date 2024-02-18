// Code your design here
// Code your design here
`ifndef SYNTHESIS
    timeunit 1ns;
    timeprecision 1ns;
`endif
`include"CPU_package.sv"
import CPU_package::*;

module CPU_Controller(
	input wire clk,
  	input wire en,
    input wire [OPCODE-1:0] opcode,
//   	input wire [ALU_FLAG_WIDTH-1:0] Feedback,
  	
  	output reg loadIR,
  	output reg loadA,
  	output reg loadB,
  	output reg loadC,
//   	output reg Write_Enable,
//   	output reg Read_Enable,
  	output reg we_DM,
  	output reg selA,
  	output reg selB,
  	output reg loadPC,
  	output reg mode,
  	output reg [OPCODE-1:0]alu_opcode,
  	output reg [2:0] State
);
  reg [2:0] state;
  reg [2:0] next_state;
  
  
  always@(posedge clk)	begin
    if ( en == 0 ) begin
	state = RESET;
	end
	else if (en == 1) begin
	state = next_state;
	end
  end
  
  
  always@(*)
begin
	if ( en == 0 ) begin
	loadA = 0;
	loadB = 0;
	loadC = 0;
	loadIR = 0;
	loadPC = 0;
// 	incPC = 0;
	mode = 1'bZ;
	we_DM = 0;
	selA = 1'b0;
	selB = 1'b0;
    alu_opcode=4'bZ;
	next_state = RESET;
	end

	else begin
		
		case(state)
		// We just wait for a small duration of time in the same state to see if there is any change in input
		RESET: 	begin
			loadA = 0;
			loadB = 0;
			loadC = 0;
			loadIR = 0;
			loadPC = 0;
// 			incPC = 0;
			mode = 1'bZ;
			we_DM = 0;
			selA = 1'b0;
			selB = 1'b0;
          	State=RESET;
			next_state = LOAD;
			end

		LOAD:	begin
			loadA = 0;
			loadB = 0;
			loadC = 0;
			loadIR = 1;
			loadPC = 1;
// 			incPC = 0;
			mode = 1'bZ;
			we_DM = 0;
			selA = 1'b0;
			selB = 1'b0;
          	State=LOAD;
			next_state = EXECUTE;
			end

		EXECUTE:	begin
          	State=EXECUTE;
			case(opcode)
			// Mode 0, ALU operation for opcode 000
			ALU_OP_ADD: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b0;
              	alu_opcode=ALU_OP_ADD;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
              	
				end
			// Mode 0, ALU operation for opcode 001
			ALU_OP_SUB: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b0;
              	alu_opcode=ALU_OP_SUB;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
              	
				end
			// Mode 0, ALU operation for opcode 010
			ALU_OP_DIV: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b0;
              	alu_opcode=ALU_OP_DIV;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
              	
				end
			// Mode 0, ALU operation for opcode 011
			ALU_OP_MUL: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b0;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
                alu_opcode=ALU_OP_MUL;
				end
               
              ALU_OP_INC:	begin
              	loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b0;
                alu_opcode=ALU_OP_INC;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
                
              end
              ALU_OP_DEC:	begin
                loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b0;
                alu_opcode=ALU_OP_DEC;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
                
              end
              
              ALU_OP_SHL:	begin
                loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b0;
                alu_opcode=ALU_OP_SHL;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
                
              end
              
               ALU_OP_SHR:	begin
                loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b0;
                alu_opcode=ALU_OP_SHR;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
                
              end
              
              // Mode 1, ALU operation for opcode 000
			ALU_OP_CPR: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b1;
              	alu_opcode=ALU_OP_CPR;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
              	
				end
			// Mode 1, ALU operation for opcode 001
			ALU_OP_AND: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b1;
              	alu_opcode=ALU_OP_AND;
				we_DM = 1;
				selA = 1'b0;
				selB = 1'b0;
              	
				end
			// Mode 1, ALU operation for opcode 010
			 ALU_OP_OR: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b1;
               	alu_opcode=ALU_OP_OR;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
               	
				end
			// Mode 1, ALU operation for opcode 100
			ALU_OP_XOR: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b1;
              	alu_opcode=ALU_OP_XOR;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
              	
				end
			// Mode 1, ALU operation for opcode 101
			ALU_OP_NOTA: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b1;
              	alu_opcode=ALU_OP_NOTA;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
              	
				end

			// Load A operation
			LOADA: 	begin
				loadA = 1;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'bZ;
              	alu_opcode=1'bZ;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
              	
				end
			// Load B operation
			LOADB: 	begin
				loadA = 0;
				loadB = 1;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'bZ;
              	alu_opcode=4'bZ;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
              	
				end
			// Load C operation
			LOADC: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 1;
				loadIR = 0;
				loadPC = 0;
// 				incPC = 1;
				mode = 1'b0;
              	alu_opcode=4'bZ;
				we_DM = 1;
				#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
              	
				end
			
			default: begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 1;
				mode = 1'bZ;
              	alu_opcode=4'bZ;
				we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
              	State=RESET;
				end
			endcase
			next_state = LOAD;
			end
		default: begin
			loadA = 0;
			loadB = 0;
			loadC = 0;
			loadIR = 1;
			mode = 1'bZ;
			we_DM = 0;
			selA = 1'b0;
			selB = 1'b0;
          	alu_opcode=4'bZ;
          	State=LOAD;
			next_state = RESET;
			end
		endcase
	end
end
  
endmodule