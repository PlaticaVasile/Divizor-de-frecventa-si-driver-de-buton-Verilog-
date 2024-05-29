module scn_ctu #(parameter Limita = 'b10000)//la 16 fronturi vine un reset
(
output reg enable_o,
output reg count_up_o
);

initial 
begin
enable_o <= 'b1;
count_up_o <= 'b1;
end

endmodule