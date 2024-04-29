// Code your design here
module Bit_Stream(
  input logic clk,
    input logic rst_n,
    input logic din,
    input logic en,
    output logic lock,
  output logic [3:0] state // debug variable
);
  localparam pSTATE_WIDTH=4;
  localparam pSTS_IDLE=4'd0,
         pSTS_S1_1=4'd1,
         pSTS_S2_1=4'd2,
         pSTS_S3_1=4'd3,
         pSTS_S4_1=4'd4,
         pSTS_S5_1=4'd5;
  
  localparam pSTS_S1_0=4'd6,
         pSTS_S2_0=4'd7,
         pSTS_S3_0=4'd8,
         pSTS_S4_0=4'd9,
         pSTS_S5_0=4'd10;
  
  logic [pSTATE_WIDTH-1:0] current_state,next_state;
  logic current_lock,next_lock;
  
  assign lock=current_lock;
  
  always_ff@(posedge clk or negedge rst_n)  begin: ff_proc
    if(!rst_n)  begin
      current_state<=pSTS_IDLE;
      state<=pSTS_IDLE;
      current_lock<=1'b0;
    end
    else if(en)  begin 
      current_state<=next_state;
      current_lock<=next_lock;
      state<=next_state;
    end 
  end: ff_proc
  
  always_comb  begin: comb_proc
    next_state=pSTS_IDLE;
    next_lock=1'b0;
    case(current_state)
      pSTS_IDLE:  begin
        if(din)  begin
          next_state=pSTS_S1_1;
          next_lock=1'b0;
        end
        else  begin
            next_state=pSTS_S1_0;
          next_lock=1'b0;
        end
      end
      pSTS_S1_1:  begin
        if(din)  begin
          next_state=pSTS_S2_1;
          next_lock=1'b0;
        end
        else  begin
            next_state=pSTS_S1_0;
          next_lock=1'b0;
        end
      end
      pSTS_S2_1:  begin
        if(din)  begin
          next_state=pSTS_S3_1;
          next_lock=1'b0;
        end
        else  begin
            next_state=pSTS_S1_0;
          next_lock=1'b0;
        end
      end
      pSTS_S3_1:  begin
        if(din)  begin
          next_state=pSTS_S4_1;
          next_lock=1'b0;
        end
        else  begin
            next_state=pSTS_S1_0;
          next_lock=1'b0;
        end
      end
      pSTS_S4_1:  begin
        if(din)  begin
          next_state=pSTS_S5_1;
          next_lock=1'b1;
        end
        else  begin
            next_state=pSTS_S1_0;
          next_lock=1'b0;
        end
      end
      pSTS_S5_1:  begin
        if(din)  begin
          next_state=pSTS_S5_1;
          next_lock=1'b1;
        end
        else  begin
            next_state=pSTS_S1_0;
          next_lock=1'b0;
        end
      end
      
      pSTS_S1_0:  begin
        if(!din)  begin
          next_state=pSTS_S2_0;
          next_lock=1'b0;
        end
        else  begin
            next_state=pSTS_S1_1;
          next_lock=1'b0;
        end
      end
      
      pSTS_S2_0:  begin
        if(!din)  begin
          next_state=pSTS_S3_0;
          next_lock=1'b0;
        end
        else  begin
            next_state=pSTS_S1_1;
          next_lock=1'b0;
        end
      end
      
      pSTS_S3_0:  begin
        if(!din)  begin
          next_state=pSTS_S4_0;
          next_lock=1'b0;
        end
        else  begin
            next_state=pSTS_S1_1;
          next_lock=1'b0;
        end
      end
      
      pSTS_S4_0:  begin
        if(!din)  begin
          next_state=pSTS_S5_0;
          next_lock=1'b1;
        end
        else  begin
            next_state=pSTS_S1_1;
          next_lock=1'b0;
        end
      end
      
      pSTS_S5_0:  begin
        if(!din)  begin
          next_state=pSTS_S5_0;
          next_lock=1'b1;
        end
        else  begin
            next_state=pSTS_S1_1;
          next_lock=1'b0;
        end
      end
        endcase
  end: comb_proc
endmodule