module JKFF(
  input wire J,
  input wire K,
  input wire CLK,
  input wire RST,
  output reg Q,
  output reg QB
);
  assign QB=~Q;
  always @(posedge CLK or posedge RST)
    begin
      if(RST) begin 
      	Q<=1'b0;
      end
      else
        begin
          if(J==1&&K==0) begin
            Q<=1'b1;
          end
          else if(J==0&&K==1) begin
            Q<=1'b0;
          end
          else if(J==1&&K==1) begin
            Q<=~Q;
          end
          else if(J==0&&K==0) begin 
            Q<=Q;
          end
        end
    end
endmodule