// Code your testbench here
// or browse Examples
module shift_reg_tb;
  parameter MSB=8;
  reg d,clk,rst_n,drive,enable;
  wire [MSB-1:0] out;
  
  shift_reg_nbit  #(MSB) shift_reg(
    .d(d),
    .clk(clk),
    .rst_n(rst_n),
    .drive(drive),
    .enable(enable),
    .out(out)
  );
  
  initial begin
    #1
    clk <= 0;
    enable <= 0;
    drive <= 0;
    rst_n <= 1;
    d<= 1'b0;
  end
  
  always #15 clk=~clk;
  
  initial begin
    
    rst_n <= 1;
      #20 
    	rst_n <= 0;
        enable <= 1;
 
    // 2. For 7 clocks, drive alternate values to data pin
    repeat (7) begin @ (posedge clk)
         d <= ~d;
    end
    $display("Pass. Finish shift left. Begin Shift right");
     // 4. Shift direction and drive alternate value to data pin for another 7 clocks
      #20 drive <= 1;
    repeat (7)begin  @ (posedge clk)
         d <= ~d;
    end

      // 5. Drive nothing for next 7 clocks, allow shift register to simply shift based on dir
    repeat (7)begin @ (posedge clk);end
     
      // 6. Finish the simulation
    #15
      $dislay("Finish Simulation");
      $finish;
   end
 
  
  initial begin
    $monitor("rst_n=%0b, d=%b, enable=%0b, drive=%0b, out=%b",rst_n,d,enable,drive,out);
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
  