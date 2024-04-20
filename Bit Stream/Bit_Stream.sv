// Code your design here
module FSM(
	input wire clk,
  	input wire rst_n,
  	input wire din,
  	output logic lock
);
  localparam pSTS_WIDTH=3;
  localparam pSTS_IDLE=3'd0,
  			 pSTS_S1_1=3'd1,
  			 pSTS_S2_0=3'd2,
  			 pSTS_S3_0=3'd3,
  			 pSTS_S4_1=3'd4;
  reg [pSTS_WIDTH-1:0] current_state,next_state;
  reg current_lock,next_lock;
  assign lock=current_lock;
  always_ff@(posedge clk or negedge rst_n)
    begin
      if(!rst_n)	begin
  		current_state<=pSTS_IDLE;
        current_lock<=1'b0;
      end
      else	begin 
        current_state<=next_state;
        current_lock<=next_lock;
      end
    end

  always_comb
    begin
      next_state=pSTS_IDLE;
      next_lock=1'b0;
      case(current_state)
        
        pSTS_IDLE:	begin
          if(din)	begin
            next_state=pSTS_S1_1;
      		next_lock=1'b0;
          end
        end
        
        pSTS_S1_1:	begin
          if(!din)	begin
            next_state=pSTS_S2_0;
      		next_lock=1'b0;
          end
          else	begin
            next_state=pSTS_S1_1;
      		next_lock=1'b0;
          end 
    	end
        pSTS_S2_0:	begin
          if(!din)	begin
            next_state=pSTS_S3_0;
      		next_lock=1'b0;
          end
          else	begin
            next_state=pSTS_S2_0;
      		next_lock=1'b0;
          end
        end
        pSTS_S3_0:	begin
          if(din)	begin
            next_state=pSTS_S4_1;
      		next_lock=1'b1;
          end
          else	begin
            next_state=pSTS_S3_0;
      		next_lock=1'b0;
          end
        end
        pSTS_S4_1:	begin
          if(din)	begin
            next_state=pSTS_S1_1;
      		next_lock=1'b1;
          end
          else	begin
            next_state=pSTS_IDLE;
      		next_lock=1'b0;
          end
        end
    endcase
   end
endmodule

  