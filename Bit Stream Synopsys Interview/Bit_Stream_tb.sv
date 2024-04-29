module Bit_Stream_tb;

  // Declare signals
  reg clk;
  reg rst_n;
  reg din;
  reg en;
  wire lock;
  logic [3:0] state;
  reg [15:0] datain = 16'b1111100010000000;
  reg [15:0] dataout;
  
  // Instantiate the Bit_Stream module
  Bit_Stream dut(
    .clk(clk),
    .rst_n(rst_n),
    .din(din),
    .en(en),
    .lock(lock)
  );

  // Initial block for simulation setup
  initial begin
    // Dump VCD file for waveform viewer
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    // Initialize signals
    clk = 0;
    rst_n = 0;
    en = 0;

    // Delay before enabling
    #5;
    
    // Enable the module and release reset
    en = 1;
    rst_n = 1;
    
    // Monitor signals and simulate data stream
    $monitor("din=%b, lock=%b, clk=%b, datain=%b, dataout=%b, state=%d", din, lock, clk, datain, dataout,state);
    for (int i = 15; i >= 0; i = i - 1) begin
      #10;
      clk = ~clk; // Toggle clock
      din = datain[i]; // Set input data
      dataout[i] = din; // Store output data
      datain[i] = 1'bx; // Simulate input data being processed
    end
    
    // Finish simulation
    #10;
    $finish;
  end
  
  // Clock generation
  always #10 clk = ~clk;

endmodule

