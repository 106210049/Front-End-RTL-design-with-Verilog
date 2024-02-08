// Code your testbench here
// or browse Examples
 `define          DELAY 20  
import CPU_package::*;
module IR_tb;
  reg iclk, loadIR;
  reg [DATA_WIDTH-1:0] insin;
  wire [DATA_WIDTH-ALU_OPCODE-2:0] address; 
  wire [ALU_OPCODE:0] opcode;  
  Instruction_Register IR(
    .iclk(iclk),
    .loadIR(loadIR),
    .insin(insin),
    .address(address),
    .opcode(opcode)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  
  initial begin
    iclk=0;
    loadIR=0;
    insin=0;
    main;
  end
  task main;	begin
    Start_Simulation;
    Testcase;
  end
  endtask
  
  task Start_Simulation; begin
    	   $display("----------------------------------------------");  
           $display("------------------   -----------------------");  
           $display("----------- SIMULATION RESULT ----------------");  
           $display("--------------       -------------------");  
           $display("----------------     ---------------------");  
           $display("----------------------------------------------");  
  	end
  endtask
  task Testcase;	begin
    insin={5'b00000,11'd11};
    loadIR=0;
    display_result_Simulation;
    #`DELAY
    loadIR=1;
    display_result_Simulation;
    #`DELAY
    loadIR=0;
    insin={5'b01001,11'd22};
    display_result_Simulation;
    #(`DELAY/4)
    loadIR=1;
    display_result_Simulation;
    #`DELAY
    insin={5'b00000,11'd11};
    display_result_Simulation;
    #(`DELAY/2)
    insin={5'b11000,11'd100};
    display_result_Simulation;
    #(`DELAY*5)
  	endsimulation;
  end
  endtask
  
  task endsimulation;  
      begin  
           $display("-------------- THE SIMUALTION FINISHED ------------");  
           $finish;  
      end  
 endtask  
    
  always #(`DELAY/4) iclk=~iclk;
   task display_result_Simulation;	begin
     $monitor("TIME = %d, iclk = %b , loadIR = %b , insin = %16b , address = %11b , opcode = %5b",$time,iclk,loadIR,insin,address,opcode);  
  end
  endtask
endmodule
  
    