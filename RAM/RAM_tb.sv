// Code your testbench here
// or browse Examples
module RAM_tb;
  
  parameter DATA_WIDTH=8;
  parameter ADDRESS_WIDTH=4;
  parameter ADDRESS_MAX_WIDTH=2<<ADDRESS_WIDTH;
  
  reg Write_clock;
  reg [ADDRESS_WIDTH-1:0] write_address;
  reg Write_Enable;
  reg [DATA_WIDTH-1:0] DATA_WRITE;
  
  reg Read_clock;
  reg [ADDRESS_WIDTH-1:0] read_address;
  reg Read_Enable;
  wire [DATA_WIDTH-1:0] DATA_READ; 
  
  RAM #(DATA_WIDTH,ADDRESS_WIDTH,ADDRESS_MAX_WIDTH) ram(
    // Write memory
    .Write_clock(Write_clock),
    .write_address(write_address),
    .Write_Enable(Write_Enable),
    .DATA_WRITE(DATA_WRITE),
  	// Read Memory
    .Read_clock(Read_clock),
    .read_address(read_address),
    .Read_Enable(Read_Enable),
    .DATA_READ(DATA_READ)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  initial begin
    Write_clock=0;
    Write_Enable=0;
    write_address=4'h9;
    DATA_WRITE=0;
    read_address=write_address;
    Read_clock=0;
    Read_Enable=0;
  end
  
  initial begin
    $display("Read initial data.");
    toggle_clk_read;
    $display("data[%0h]: %0h",
    read_address, DATA_READ);
    #20
    $display("Write new data.");
    Write_Enable = 1;
    DATA_WRITE = 8'hC5;
    toggle_clk_write;
    Write_Enable = 0;
    #20
    $display("Read new data.");
    Read_Enable=1;
    toggle_clk_read;
    $display("data[%0h]: %0h",
    read_address, DATA_READ);
    Read_Enable=0;
    #20
    
    write_address=4'hf;
    read_address=write_address;
    $display("Write new data.");
    Write_Enable = 1;
    DATA_WRITE = 8'h9;
    toggle_clk_write;
    Write_Enable = 0;
    #20
    $display("Read new data.");
    Read_Enable=1;
    toggle_clk_read;
    $display("data[%0h]: %0h",
    read_address, DATA_READ);
    Read_Enable=0;
    #20
    
    write_address=4'h1;
    read_address=write_address;
    $display("Write new data.");
    Write_Enable = 1;
    DATA_WRITE = 8'hf;
    toggle_clk_write;
    Write_Enable = 0;
    #20
    $display("Read new data.");
    Read_Enable=1;
    toggle_clk_read;
    $display("data[%0h]: %0h",
    read_address, DATA_READ);
    Read_Enable=0;
    #20
    $finish;
  end
  
  
  task toggle_clk_write;
    begin
      #10 Write_clock = ~Write_clock;
      #10 Write_clock = ~Write_clock;
    end
  endtask

  task toggle_clk_read;
    begin
      #10 Read_clock = ~Read_clock;
      #10 Read_clock = ~Read_clock;
    end
  endtask
endmodule