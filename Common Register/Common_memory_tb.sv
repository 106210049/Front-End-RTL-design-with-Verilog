// Code your testbench here
// or browse Examples
import CPU_package::*;
module Register_tb;
  
  reg iclk,ien,irst_n;
  reg [DATA_WIDTH-1:0] idata;
  wire [DATA_WIDTH-1:0]	odata;
  
  Common_Register register(
    .iclk(iclk),
    .ien(ien),
    .irst_n(irst_n),
    .idata(idata),
    .odata(odata)
);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  
  initial begin
    iclk=0;
    ien=0;
    irst_n=0;
    idata=0;
  end
  
  initial begin
    irst_n=1;
    idata=10;
    #100
    ien=1;
    #10;
    idata=5;
    #100
    ien=0;
    idata=12;
    idata=2;
    #100;
    ien=1;
    #200
    $finish;
  end
  always #5 iclk=~iclk;
endmodule
    