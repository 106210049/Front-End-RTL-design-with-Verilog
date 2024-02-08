`include"CPU_package.sv"
import CPU_package::*;
module Common_Register(
    input iclk,
    input ien,
    input irst_n,
    input [DATA_WIDTH-1:0]  idata,
    output reg [DATA_WIDTH-1:0] odata
);
    `ifndef SYNTHESIS
        timeunit 1ns;
        timeprecision 1ns;
    `endif
    always_ff@(posedge iclk or negedge irst_n)  begin
        if(!irst_n) begin
            odata<=0;
        end
        else if(ien)    begin
            odata<=idata;
       end
    end
endmodule: Common_Register