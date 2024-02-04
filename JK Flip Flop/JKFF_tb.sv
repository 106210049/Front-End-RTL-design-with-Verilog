module testbench;
  reg clk;
  reg reset;
  reg j;
  reg k;
  wire q;
  wire qb;
  
  // Instantiate design under test
  JKFF jkff(.CLK(clk), .RST(reset),
            .J(j),.K(k), .Q(q), .QB(qb));
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    $display("Reset flop.");
    clk = 0;
    reset = 1;
    j = 1'bx;
    k=1'b1;
    display;
    
    $display("Release reset.");
    j = 0;
    k = 1;
    reset = 0;
    display;

    $display("Toggle clk.");
    clk = 1;
    display;
    
    $display("Set Clock to Zero");
    RZ;
   
    j=1;
    k=1;
    reset=0;
    display;
    
    $display("Toggle clk.");
    clk = 1;
    display;
    
    $display("Set Clock to Zero");
    RZ;
    
  end
  
  task display;
    #1 $display("j:%0h, k:%0h,q:%0h, qb:%0h",
      j,k, q, qb);
  endtask
  
  task RZ;
    clk=0;
  endtask

endmodule