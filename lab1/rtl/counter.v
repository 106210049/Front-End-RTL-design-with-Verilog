module counter #(
    parameter WIDTH = 8
)(
    input  wire              clk,
    input  wire              rst_n,
    input  wire              en,
    output reg  [WIDTH-1:0]  q
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        q <= 0;
    else if (en)
        q <= q + 1;
end

endmodule
