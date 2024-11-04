`timescale 1ns / 1ps

module FSM_tb;
  // Inputs
  reg clk;
  reg rst_n;
  reg din;

  // Outputs
  wire lock;
  wire [2:0] state;

  // Instantiate the FSM module
  FSM uut (
    .clk(clk),
    .rst_n(rst_n),
    .din(din),
    .lock(lock),
    .state(state)
  );

  // Clock generation: 10 ns period clock
  always #5 clk = ~clk;

  initial begin
    // Initialize inputs
    clk = 0;
    rst_n = 0;
    din = 0;

    // Apply reset
    #10;
    rst_n = 1; // Release reset
    #10;

    // Apply input sequence "1001001" to din
    $display("Applying input sequence 1001001...");
    apply_din_sequence(11'b10010011001);

    // End simulation
    #10;
    $finish;
  end

  // Task to apply each bit in a sequence to din
  task apply_din_sequence(input [10:0] seq);
    integer i;
    begin
      for (i = 10; i >= 0; i = i - 1) begin
        din = seq[i];
        @(posedge clk);
        #1; // Wait a little to see the output update
        $display("Time %0t: din = %b, state = %b, lock = %b", $time, din, state, lock);
      end
    end
  endtask
endmodule
