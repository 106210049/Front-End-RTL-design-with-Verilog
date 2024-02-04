// Code your testbench here
// or browse Examples
module Full_Subtractor_tb;
  reg [7:0]a;
  reg [7:0]b;
  reg Bin;
  wire B;
  wire [7:0]D;
  
  Full_Subtractor_by8 FS8(.a(a),.b(b),.Bin(Bin),.B(B),.D(D));
  initial begin
    $monitor( a,b,Bin,B,D);
    $dumpfile("dump.vcd");// vcd=value change dump
    $dumpvars(1); // dump all variables in the wave form
    
    a[7:0]=8'b1111;
    b[7:0]=8'b1001;
   	Bin=0;
    #20
    a[7:0]=8'b1111;
    b[7:0]=8'b1001;
   	Bin=1;
    #20
    a[7:0]=8'h1e;
    b[7:0]=8'h14;
   	Bin=0;
    #20
    a[7:0]=8'b1111;
    b[7:0]=8'b1011;
   	Bin=1;
    #20
    $finish;
  end
endmodule
