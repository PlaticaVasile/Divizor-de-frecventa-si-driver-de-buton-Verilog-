module dff 
(
input clk_i,
input rst_i,
input d_i,

output reg q_o,
output reg qn_o
);

always @(posedge clk_i or negedge rst_i) 
begin
    q_o <= d_i;
    qn_o <= !d_i;
end

endmodule