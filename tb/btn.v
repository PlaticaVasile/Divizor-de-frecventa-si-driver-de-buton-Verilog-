module btn#(parameter CLK = 1) //CLK ceasuri pe 1
(
input clk_i,
output reg btn_o
);

initial 
begin
btn_o <= 'b0; repeat(20) @(posedge clk_i); //20 de ceasuri pe 0
//se incepe simularea btn dupa trecerea a 10 ceasuri
btn_o <= 'b1; repeat(CLK) @(posedge clk_i); //CLK ceasuri pe 1
btn_o <= 'b0; //revenire la stare initiala
end

endmodule