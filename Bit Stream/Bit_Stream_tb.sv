// Code your testbench here
// or browse Examples
module FSM_tb;
  reg clk;
  reg rst_n;
  reg din;
  wire lock;
  
  FSM fsm(
    .clk(clk),
    .rst_n(rst_n),
    .din(din),
    .lock(lock)
  );
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk=0;
    rst_n=1;
  end
//   string data= '1001010011001';
  reg [11:0]datain=12'b100100110011;
  reg [11:0] dataout;
  initial begin
    $monitor("din=%b , lock=%b , clock=%b , datain=%12b , dataout=%12b",din,lock,clk,datain,dataout);
// 	#10
//     din=1;
//     #10
//     din=0;
//     #10
//     din=0;
//     #10
//     din=1;
      for(int i=11;i>=0;i--)	begin
        #15
        din=datain[i];
        dataout[i]=datain[i];
        datain[i]=1'bx;
      end
    #10;
    $finish;
  end
  always #5 clk=~clk;
endmodule
    