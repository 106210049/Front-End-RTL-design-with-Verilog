# Synchronous FiFo memory 

## 1. Introduction:
Note, different data processing speeds do not mean different clock pulses or asynchrony with each other. In this case, both domains use synchronous clock pulses with each other, but because one domain is fast and the other is slow, data cannot be transmitted continuously between the two domains.
The solution to this problem is to use a temporary data storage between the two domains to store data that has not been processed in time.
FIFO operates on the principle that the data stored first will be the data retrieved first. That is, the order in which data is read out is the same as the order in which data is written in. 
Two typical parameters of FIFO are:
The number of memory cells is also known as the depth of FIFO
Memory cell width corresponds to the width of data written in and read out.
The above two parameters will indicate the capacity of the FIFO. For example, a FIFO has 4 memory cells, each memory cell stores 8 bits of data, then the FIFO capacity is 4*8 = 32 bits or 4 bytes. 
To address FIFO memory cells, a common method is to use write pointers and read pointers. The pointer here is essentially a sequential counter.

### FiFo Block:
