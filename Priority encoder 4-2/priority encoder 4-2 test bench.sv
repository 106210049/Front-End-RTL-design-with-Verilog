// Code your testbench here
// or browse Examples
module Priority_encoder_4to2_tb;
  logic i0;
  logic i1;
  logic i2;
  logic i3;
  logic o0;
  logic o1;
  
  	Priority_encoder_4to2 encoder(
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .o0(o0),
    .o1(o1)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    {i0,i1,i2,i3}=4'bzzzz;
  end
  
  initial begin
    $monitor("TIME = %d, {i0,i1,i2,i3}=%4b , {o0,o1}=%2b",$time, {i0,i1,i2,i3},{o0,o1});
    #2
    {i0,i1,i2,i3}=4'b1000;
    #10
    {i0,i1,i2,i3}=4'bx100;
    #10
    {i0,i1,i2,i3}=4'bxx10;
    #10
    {i0,i1,i2,i3}=4'bxxx1;
    #10
    $finish;
  end
endmodule
