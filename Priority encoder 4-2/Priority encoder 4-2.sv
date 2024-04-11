// Code your design here
module Priority_encoder_4to2(
  input logic i0,
  input logic i1,
  input logic i2,
  input logic i3,
  output logic o0,
  output logic o1
);
  
  always_comb
    casex({i0,i1,i2,i3})
      4'b1000:	begin
        {o0,o1}=2'd0;
      end
      4'bx100:	begin
        {o0,o1}=2'd1;
      end
      4'bxx10:	begin
        {o0,o1}=2'd2;
      end
      4'bxxx1:	begin
        {o0,o1}=2'd3;
      end
      default:	begin
        {o0,o1}=2'bxx;
      end
    endcase
endmodule
