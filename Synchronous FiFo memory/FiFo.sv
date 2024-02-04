module Write_pointer #(
  									parameter DATASIZE=8, 
									parameter DEPTH=16,
  									parameter PTR_WIDTH=$clog2(DEPTH)
//   									parameter PTR_WIDTH=5

)
(
	w_en,
  	rst_n,
  	clk,
	fifo_full,
  	fifo_w_en,
  	w_ptr
);
  input w_en,fifo_full,clk,rst_n;
  output reg [PTR_WIDTH:0] w_ptr;
  output wire fifo_w_en;
  
  assign fifo_w_en= (~fifo_full)&w_en;
  always@(posedge clk or negedge rst_n)	begin
    if(!rst_n)	w_ptr<=0;
    else if(fifo_w_en)
      w_ptr<=w_ptr+1;
    else 
      w_ptr<=w_ptr;
  end
endmodule

module Read_pointer #(
  									parameter DATASIZE=8, 
									parameter DEPTH=16,
  									parameter PTR_WIDTH=$clog2(DEPTH)
//   									parameter PTR_WIDTH=5

)
(
	r_en,
  	rst_n,
  	clk,
	fifo_empty,
  	fifo_r_en,
  	r_ptr
);
  input r_en,fifo_empty,clk,rst_n;
  output reg [PTR_WIDTH:0] r_ptr;
  output wire fifo_r_en;
  
  assign fifo_r_en= (~fifo_empty)&r_en;
  always@(posedge clk or negedge rst_n)	begin
    if(!rst_n)	r_ptr<=0;
    else if(fifo_r_en)
      r_ptr<=r_ptr+1;
    else 
      r_ptr<=r_ptr;
  end
endmodule

module Memory_Array #(
  									parameter DATASIZE=8, 
									parameter DEPTH=16,
  									parameter PTR_WIDTH=$clog2(DEPTH)
//   									parameter PTR_WIDTH=5

)
(
	clk,
  	rst_n,
  	fifo_w_en,
  	w_ptr,
  	r_ptr,
  	data_in,
  	data_out
);
  input wire clk,rst_n,fifo_w_en;
  input [PTR_WIDTH:0] w_ptr,r_ptr;
  input [DATASIZE-1:0] data_in;
  output [DATASIZE-1:0] data_out;
  reg [DATASIZE-1:0] data_out2 [DEPTH];
  
  always@(posedge clk) begin
    if(fifo_w_en)	
      data_out2 [w_ptr[PTR_WIDTH-1:0]]<=data_in;
  end
  assign data_out=data_out2[r_ptr[PTR_WIDTH-1:0]];
endmodule

module Memory_State #(
  									parameter DATASIZE=8, 
									parameter DEPTH=16,
  									parameter PTR_WIDTH=$clog2(DEPTH)
//   									parameter PTR_WIDTH=5

)
(
	fifo_full,
    fifo_empty,
    fifo_overflow_flag,
    fifo_underflow_flag,
    w_en,
    r_en,
    fifo_w_en,
    fifo_r_en,
    w_ptr,
    r_ptr,
    clk,
    rst_n
);
  	input clk,rst_n,w_en,r_en,fifo_w_en,fifo_r_en;
  	input wire [PTR_WIDTH:0] w_ptr,r_ptr;
	wire msb_diff,lsb_equal;
  	output reg fifo_empty,fifo_full;
  	output reg fifo_overflow_flag,fifo_underflow_flag;
  	wire fifo_overflow_set,fifo_underflow_set;
  	assign msb_diff= w_ptr[PTR_WIDTH]^r_ptr[PTR_WIDTH];
  	assign lsb_equal= w_ptr[PTR_WIDTH-1:0]-r_ptr[PTR_WIDTH-1:0] ? 0:1;
  	assign fifo_overflow_set= fifo_full&w_en;
  	assign fifo_underflow_set= fifo_empty&r_en;
  	
  	always@(*)	begin
    	 fifo_full=msb_diff&lsb_equal;
  		 fifo_empty=lsb_equal&(~msb_diff);
    end
  
  always@(posedge clk or negedge rst_n) begin
    if(~rst_n)  fifo_overflow_flag <=0; 
    else if((fifo_overflow_set==1)&&(fifo_r_en==0))  
   fifo_overflow_flag <=1;  
    else if(fifo_r_en)  
    fifo_overflow_flag <=0;  
    else  
     fifo_overflow_flag <= fifo_overflow_flag;  
  end  
    
  always @(posedge clk or negedge rst_n)  
  begin  
    if(~rst_n) fifo_underflow_flag <=0;  
    else if((fifo_underflow_set==1)&&(fifo_w_en==0))  
   fifo_underflow_flag <=1;  
    else if(fifo_w_en)  
    fifo_underflow_flag <=0;  
    else  
     fifo_underflow_flag <= fifo_underflow_flag;  
  end  
endmodule  
  

module Synchronous_FiFo_memmory #(
  									parameter DATASIZE=8, 
									parameter DEPTH=16,
  									parameter PTR_WIDTH=$clog2(DEPTH)
//   									parameter PTR_WIDTH=5

)
(
  data_out,
  fifo_full,
  fifo_empty,
  fifo_overflow_flag,
  fifo_underflow_flag,
  clk,
  rst_n,
  w_en,
  r_en,
  data_in
);  
  input w_en, r_en, clk, rst_n;  
  input[DATASIZE-1:0] data_in;   // FPGA projects using Verilog/ VHDL
  output[DATASIZE-1:0] data_out;  
  output fifo_full, fifo_empty,  fifo_overflow_flag, fifo_underflow_flag;  
  wire[PTR_WIDTH:0] w_ptr,r_ptr;  
  wire fifo_w_en,fifo_r_en;   
  Write_pointer top1(
    w_en,
  	rst_n,
  	clk,
	fifo_full,
  	fifo_w_en,
  	w_ptr
  );  
  
  Read_pointer  top2(
    r_en,
  	rst_n,
  	clk,
	fifo_empty,
  	fifo_r_en,
  	r_ptr
  );  
  
  Memory_Array  top3(
    clk,
  	rst_n,
  	fifo_w_en,
  	w_ptr,
  	r_ptr,
  	data_in,
  	data_out
  );  
  
  Memory_State top4(
    fifo_full,
    fifo_empty,
    fifo_overflow_flag,
    fifo_underflow_flag,
    w_en,
    r_en,
    fifo_w_en,
    fifo_r_en,
    w_ptr,
    r_ptr,
    clk,
    rst_n
  );  
 endmodule  