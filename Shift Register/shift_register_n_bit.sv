// Code your design here
module shift_reg_nbit #(parameter MSB=8)(
  input wire d,
  input wire clk,
  input wire rst_n,
  input wire drive,
  input wire enable,
  output reg [MSB-1:0]out);
  
  always@(posedge clk)
    begin
      if(rst_n)begin out<=0;end
      else	begin
        if(enable) begin
          case(drive)
            0: out<={out[MSB-2:0],d};
            1: out<={d,out[MSB-1:1]};
          endcase
        end
      end
    end
endmodule