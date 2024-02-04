// Code your testbench here
// or browse Examples
module Multiple_4bit_tb;
  reg [3:0]X;
  reg [3:0]Y;
  wire [7:0]s;
  
  Multiple_4bit Mul(.X(X),.Y(Y),.s(s));
  
  initial begin
    $monitor( X,Y,s);
    $dumpfile("dump.vcd");// vcd=value change dump
    $dumpvars(1); // dump all variables in the wave form
    
    X[3:0]=4'b0010;
    Y[3:0]=4'b0010;
    #150
    X[3:0]=4'b1010;
    Y[3:0]=4'b0010;
    #150
    X[3:0]=4'b0110;
    Y[3:0]=4'b1010;
    #150
    X[3:0]=4'b1011;
    Y[3:0]=4'b0011;
    #150
    X[3:0]=4'b1111;
    Y[3:0]=4'b0011;
    #150
    X=0;
    repeat(16)begin
      Y=0;
      repeat(16)begin
        #20
        Y=Y+1;
      end
      X=X+1;
    end
    #20
    $finish;
  end
endmodule