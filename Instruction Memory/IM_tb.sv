import CPU_package::*;

module tb_instmem();
reg clk;
reg we_IM;
reg [DATA_WIDTH-1:0] dataIM;
reg [DATA_WIDTH-ALU_OPCODE-2:0] address_IM;
wire [DATA_WIDTH-1:0] out_IM;

// Instantiation of the design
  	Instruction_memory IM (
    .clk(clk),
    .we_IM(we_IM),
    .dataIM(dataIM),
    .address_IM(address_IM),
    .out_IM(out_IM)
  );

// Initialization of signals
initial
begin
  	$dumpfile("dump.vcd");
    $dumpvars(1);
	clk <= 0;
	we_IM <= 0;
	dataIM <= 16'h0000;
	address_IM <= 11'h000;
end

// Clock setup
always #5 clk = ~clk;

// Address setup 
always #60 address_IM = address_IM + 11'h001;

// Stimulus
initial 
begin
	#5 we_IM <= 1;
	#5 dataIM <= 16'd16;
	#30 we_IM <= 0;

	#60 we_IM <= 1;
	#60 dataIM <= 16'd22;
	#90 we_IM <= 0;
  
  	#60 we_IM <= 1;
	#60 dataIM <= 16'd30;
	#90 we_IM <= 0;
  	#100
  	$finish;
end
endmodule