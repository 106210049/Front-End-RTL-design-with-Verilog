// Code your testbench here
// or browse Examples

module adder_tb;
  reg [7:0]A;
  reg [7:0]B;
  reg Cin;
  wire Cout;
  wire [7:0]S;
  
  Full_Adder_by8 adder(.A(A),.B(B),.Cin(Cin),.Cout(Cout),.S(S));
  
  initial begin
    $monitor( A,B,Cin,Cout,S);
    $dumpfile("dump.vcd");// vcd=value change dump
    $dumpvars(1); // dump all variables in the wave form
    
    A[7:0]=8'h14;
    B[7:0]=8'h1e;
   	Cin=0;
    #20
    A[7:0]=8'ha;
    B[7:0]=8'ha;
    Cin=1;
    #20
    A[7:0]=8'h1001;
    B[7:0]=8'h0010;
    Cin=0;
    #20
    $finish;
  end
endmodule
  