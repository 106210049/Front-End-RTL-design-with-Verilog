module MUX2(f,s,i0,i1);
input wire s,i0,i1;
output reg f;

 // Using gate level assignement
  wire sn, andout0, andout1;
  not (sn,s);
  and (andout0, sn,i0);
  and (andout1, s ,i1);
  or(f,andout0,andout1);

  
endmodule

module MUX4(f,s0,s1,i0,i1,i2,i3);

  input wire s0,s1,i0,i1,i2,i3;
  output reg f;
  
  wire tmp0,tmp1;

  MUX2 M0 (tmp0, s0,i0,i1);
  MUX2 M1 (tmp1, s0,i2,i3);
  MUX2 M2 (f, s1,tmp0,tmp1);
  
endmodule
