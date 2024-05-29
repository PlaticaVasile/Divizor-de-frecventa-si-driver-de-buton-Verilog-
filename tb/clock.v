module clock#(parameter SP = 5)
(
output reg clk_o,
output reg rst_o //reset activ pe 0
);

initial 
begin
clk_o <= 0;
forever #SP clk_o <= ~clk_o;
end
 
initial 
begin
rst_o <= 'b1; #10
rst_o <= 'b0; #20
rst_o <= 'b1;
end

endmodule