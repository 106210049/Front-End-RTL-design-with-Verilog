// Code your testbench here
// or browse Examples
module Mux4_tb;
  reg I3,I2,I1,I0;
  reg S1,S0;
  wire OUT;
  
  MUX4 mux ( .s1(S1),
             .s0(S0),
             .i3(I3),
             .i2(I2),
             .i1(I1),
             .i0(I0),
             .f(OUT));
  
  initial 
begin
  I0=0; I1=0; I2=1; I3=1; // you may change them as you like
 
  for(int i=0; i<4; i=i+1 ) // checking all possible values of S1,S0
    begin
      #5 {S1, S0}=i;// 00,01,10,11
    end
  
   #5 $finish;
end
  
  initial 
    begin
     // dumps all values whenever there is a change in any.
      $monitor( I0, I1, I2, I3, S1, S0,OUT);
  // Uncomment the next two lines if you want to see the timing diagram as well
  $dumpfile("dump.vcd");// vcd=value change dump
  $dumpvars(1); // dump all variables in the wave form
  	end
endmodule

  