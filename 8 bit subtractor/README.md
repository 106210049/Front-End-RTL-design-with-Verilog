# Full subtractor

## Introduction to subtractor:
A Full Subtractor is a combinational logic circuit which performs a subtraction between the two 1-bit binary numbers and it also considers the borrow of the previous bit i.e., whether 1 has been borrowed by the previous minuend bit.

So, a Full Subtractor has three inputs, in which two inputs corresponding to the two bits to be subtracted (minuend A and subtrahend B), and a borrow bit, usually represented as BIN, corresponding to the borrow operation. There are two outputs, one corresponds to the difference D output and the other Borrow output BO.

## Block diagram of full subtractor:

The following image shows the block diagram of a full subtractor.

<img src="8 bit subtractor/Image/Full_subtractor.png" width="700" >  

## True table of full subtractor:

The following table shows the truth table of a Full Subtractor.

<img src="8 bit subtractor/Image/True_table.png" width="700" >  

## Schematic of full subtractor:

By deriving the Boolean expression for the full subtractor from above truth table, we get the expression that tells that a full subtractor can be implemented with half subtractors with OR gate as shown in figure below.

<img src="8 bit subtractor/Image/Full_subtractor_schematic.png" width="700" >  

### Source code of 1-bit full subtractor:

```SystemVerilog
module Full_Subtractor_by1(a,b,Bin,B,D);
  input wire a;
  input wire b;
  input wire Bin;
  output reg B;
  output reg D;
  
  wire tmp,tmp2,tmp3;
  xor(D,a,b,Bin);
  or(tmp,~a,b);
  and(tmp2,Bin,tmp);
  and(tmp3,~a,b);
  or(B,tmp3,tmp2);
endmodule
```

## 4-bit Subtractor:

<img src="8 bit subtractor/Image/4-bit subtractor.png" width="700" >  

### Source code of 4-bit full subtractor:

```SystemVerilog
module Full_Subtractor_by8(a,b,Bin,B,D);
  input wire [7:0]a;
  input wire [7:0]b;
  input wire Bin;
  output reg B;
  output reg [7:0]D;
  
  reg [6:0] Carries;
  
  Full_Subtractor_by1 Sub1(.a(a[0]),.b(b[0]),.Bin(Bin),.B(Carries[0]),.D(D[0]));
  Full_Subtractor_by1 Sub2(.a(a[1]),.b(b[1]),.Bin(Carries[0]),.B(Carries[1]),.D(D[1]));
  Full_Subtractor_by1 Sub3(.a(a[2]),.b(b[2]),.Bin(Carries[1]),.B(Carries[2]),.D(D[2]));
  Full_Subtractor_by1 Sub4(.a(a[3]),.b(b[3]),.Bin(Carries[2]),.B(Carries[3]),.D(D[3]));
  Full_Subtractor_by1 Sub5(.a(a[4]),.b(b[4]),.Bin(Carries[3]),.B(Carries[4]),.D(D[4]));
  Full_Subtractor_by1 Sub6(.a(a[5]),.b(b[5]),.Bin(Carries[4]),.B(Carries[5]),.D(D[5]));
  Full_Subtractor_by1 Sub7(.a(a[6]),.b(b[6]),.Bin(Carries[5]),.B(Carries[6]),.D(D[6]));
  Full_Subtractor_by1 Sub8(a[7],b[7],Carries[6],B,D[7]);

endmodule
```

## Simulation:

<img src="8 bit subtractor/Image/EPWAVE.png" width="1000" >  
