// Code your design here
module RAM #(
  				parameter DATA_WIDTH=16,
  				parameter ADDRESS_WIDTH=8,
  				parameter ADDRESS_MAX_WIDTH=2<<ADDRESS_WIDTH
)
(
  input Write_clock,
  input [ADDRESS_WIDTH-1:0] write_address,
  input wire Write_Enable,
  input [DATA_WIDTH-1:0] DATA_WRITE,

  input Read_clock,
  input [ADDRESS_WIDTH-1:0] read_address,
  input wire Read_Enable,
  output reg [DATA_WIDTH-1:0] DATA_READ
);
  
  reg [DATA_WIDTH-1:0] Memories [ADDRESS_MAX_WIDTH];
  
  always@(posedge Write_clock)
    begin
      if(Write_Enable) begin
        Memories[write_address]<=DATA_WRITE;
      end
    end
  
  always@(posedge Read_clock)	begin
    if(Read_Enable)	begin
      DATA_READ<=Memories[read_address];
    end
  end
endmodule

  