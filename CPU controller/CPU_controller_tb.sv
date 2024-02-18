// Code your testbench here
// or browse Examples
import CPU_package::*;
module CPU_controller_tb;
  	 reg clk;
  	 reg en;
  	 reg [OPCODE-1:0] opcode;
  
	 wire loadIR;
  	 wire loadA;
  	 wire loadB;
  	 wire loadC;
//   	 wire Write_Enable;
//   	 wire Read_Enable;
  	 wire we_DM;
  	 wire selA;
  	 wire selB;
  	 wire loadPC;
  	 wire mode;
  	 wire [OPCODE-1:0] alu_opcode;
  	 wire [2:0] State;
    CPU_Controller Control(
      .clk(clk),
      .en(en),
      .opcode(opcode),
      .loadIR(loadIR),
      .loadA(loadA),
      .loadB(loadB),
      .loadC(loadC),
      .we_DM(we_DM),
      .selA(selA),
      .selB(selB),
  //     .incPC(incPCd),
      .loadPC(loadPC),
      .mode(mode),
      .alu_opcode(alu_opcode),
      .State(State)
    );
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  
  initial begin
	clk = 0;
	en = 0;
// 	we_IM = 0;
// 	dataIM = 16'h0000;
// 	address_IM = 16'h0000;
  	opcode=4'bz;
    main;
end
  task main; begin
    Start_Simulation;
  	testcase;
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
  
  always #5 clk = ~clk;
  always@(State)
    begin
      $display("--------------Check State--------------");
      Check_State; 
      $display("--------------end check--------------");
    end
  always@(alu_opcode)
    begin 
      if(alu_opcode==opcode && State==EXECUTE)	begin
        $display("=========PASS=========PASS==========PASS==========");
        $monitor("opcode = %4b ,  alu_opcode = %4b",opcode,alu_opcode);
      end
      else if(alu_opcode!=opcode && State==EXECUTE) begin
      $display("=========FAIL=========FAIL==========FAIL==========");
      $monitor("opcode = %4b ,  alu_opcode = %4b",opcode,alu_opcode);
    end
    end
  task testcase; begin
    display_result_Simulation;
    #5
    en=1;
    display_result_Simulation;
    #20
    opcode=ALU_OP_SUB;
    display_result_Simulation;
    #60
    opcode=LOADB;
    display_result_Simulation;
    #60
    opcode=ALU_OP_DIV;
    display_result_Simulation;
    #60
    opcode=ALU_OP_INC;
    display_result_Simulation;
    #60
    opcode=ALU_OP_OR;
    display_result_Simulation;
    #60
    opcode=ALU_OP_MUL;
    display_result_Simulation;
    #60
    opcode=ALU_OP_AND;
    display_result_Simulation;
    #60
  	endsimulation;
  end
  endtask
  task endsimulation;  
      begin  
           $display("-------------- THE SIMUALTION FINISHED ------------");  
           $finish;  
      end  
 endtask  
  
  task Check_State; begin
    if(State==RESET)	begin
      $display("RESET");
    end
    else if(State==LOAD)	begin
      $display("LOAD");
    end
    else if(State==EXECUTE)	begin
      $display("EXECUTE");
    end
  end
 endtask
  
  task display_result_Simulation;	begin
    $monitor("TIME = %d, clk = %b , en = %b , opcode = %4b , loadIR = %b , loadA = %b , loadB = %b , loadC = %b , we_DM = %b , selA = %b , selB = %b , loadPC = %b , mode = %b , alu_opcode = %4b , State = %3b",$time,clk,en,opcode,loadIR,loadA,loadB,loadC,we_DM,selA,selB,loadPC,mode,alu_opcode,State); 
    
  end
  endtask
  
  
endmodule
  