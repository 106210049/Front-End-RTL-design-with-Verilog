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

From there, to have a comparator of two 8-bit numbers, we must combine 8 complete 1-bit comparison cards together:
<img src="Sơ đồ bộ so sánh hai số nhị phân 8 bit.png" width="700" >  
