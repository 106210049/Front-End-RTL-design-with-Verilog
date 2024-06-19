 # Circuit that compares two 8-bit numbers
  To design a circuit to compare two 8-bit numbers, we will design a circuit to compare two 1-bit numbers.
  Using logic cabinet parts, we can easily design a 1-bit comparator circuit as above. Although
  However, the above comparison circuit cannot be developed to compare multiple bits. Want to compare
  To generate two multi-bit numbers, we must follow the comparison sequence from the highest bit first (the present bit
  most meaningful). If a number has a higher bit, that number becomes larger and ends
  Comparing, if the two bits in the highest number are equal, the two numbers will be compared
  lower weight, and so on until the lowest bit, the two numbers are equal if all the
  The corresponding bits of two numbers are equal. To compare 8-bit numbers, we must add bits
  Control into a comparator circuit that generates two one-bit numbers, called a full 1-bit comparator circuit. We have
  The block diagram is as follows:
  
<img src="Sơ đồ khối bộ so sánh 1 bit đầy đủ.png" width="200" >  

## The status table describes the 1-bit comparator operation as follows:

<img src="Bảng mô tả trạng thái.png" width="600" >  

<img src="Phương trình trạng thái bộ so sánh 2 bit đầy đủ.png" width="400" >  

## Full 2-bit comparator logic circuit diagram:

<img src="Sơ đồ mạch logic bộ so sánh 2bit đầy đủ.png" width="600" >  

## The complete 1-bit comparator block diagram is as follows:

<img src="Sơ đồ khối bộ so sánh 1 bit đầy đủ.png" width="200" >  

### Source code 1-bit comparator:
```SystemVerilog
module Comparator_1bit(a,b,equal,lower,greater,c2,c1,c3);
  input wire  a;
  input wire  b;
  input reg c1,c2,c3;
  output reg equal;
  output reg lower;
  output reg greater;
    
  assign lower=c1|c2&((~a)&b);
  assign equal=c2&(~a)&(~b)|c2&a&b;
  assign greater=c3|c2&(a&(~b));
endmodule
```

From there, to have a comparator of two 8-bit numbers, we must combine 8 complete 1-bit comparison cards together:
<img src="Sơ đồ bộ so sánh hai số nhị phân 8 bit.png" width="700" >  

### Source code 8-bit comparator

```SystemVerilog
module Comparator_8bit(a,b,equal,lower,greater);
  input wire  [7:0]a;
  input wire  [7:0]b;
  output reg equal;
  output reg lower;
  output reg greater;

  reg [6:0]c1;
  reg [6:0]c2;
  reg [6:0]c3;
  
  Comparator_1bit Compare7(a[7],b[7],c2[6],c1[6],c3[6],1,0,0);
  Comparator_1bit Compare6(a[6],b[6],c2[5],c1[5],c3[5],c2[6],c1[6],c3[6]);
  Comparator_1bit Compare5(a[5],b[5],c2[4],c1[4],c3[4],c2[5],c1[5],c3[5]);
  Comparator_1bit Compare4(a[4],b[4],c2[3],c1[3],c3[3],c2[4],c1[4],c3[4]);
  Comparator_1bit Compare3(a[3],b[3],c2[2],c1[2],c3[2],c2[3],c1[3],c3[3]);
  Comparator_1bit Compare2(a[2],b[2],c2[1],c1[1],c3[1],c2[2],c1[2],c3[2]);
  Comparator_1bit Compare1(a[1],b[1],c2[0],c1[0],c3[0],c2[1],c1[1],c3[1]);
  Comparator_1bit Compare0(a[0],b[0],equal,lower,greater,c2[0],c1[0],c3[0]);
endmodule
```
