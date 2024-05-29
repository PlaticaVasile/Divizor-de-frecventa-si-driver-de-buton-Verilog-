module ctu #(parameter NrBiti = 27, parameter Limita = 'h3B9AC9FF) 
//2^27 - 1 = 'h7FFFFFF (maximuml posibil cu 27 de biti)
//Limita = 10^8 - 1 = 'h3B9AC9FF
//10^8 = h5F5E100
(
input clk_i,
input rst_i,
input enable_i,
input count_up_i,

output reg [NrBiti-1:0] data_o,
output reg overflow_o,
output reg overflow2sec_o,
output reg [1:0] check_ovf_o
);

always @(posedge clk_i or negedge rst_i) //data_o
begin
if (!rst_i) data_o <= 'b0; //cand rst_i = 0, data_o se reseteaza
else if (!enable_i) data_o <= data_o;
else if (count_up_i) data_o <= data_o + 1; 
else data_o <= data_o;//daca nu se declara explicit, compilatorul o va face automat in locul nostru
end

always @(posedge clk_i or negedge rst_i) //overflow_o
begin
if (!rst_i) overflow_o = 'b0;//cazul rst_i = 0, overflow_o se reseteaza
else if ( (data_o == Limita) & (enable_i & count_up_i) ) 
begin
overflow_o <= 'b1;
data_o <= 'b0;
end
else overflow_o <= 'b0;//isi perpetueaza valoarea daca overflow_o <= overflow_o;
end

always @(posedge clk_i or negedge rst_i) //overflow2sec_o
begin
if (!rst_i) overflow2sec_o <= 'b0;
else if (check_ovf_o == 'b10) overflow2sec_o <= 'b1;
else overflow2sec_o <= 'b0;
end

always @(posedge clk_i or negedge rst_i) //check_ovf_o
begin
if(!rst_i) check_ovf_o <= 'b0;
else if(overflow_o) check_ovf_o <= check_ovf_o + 'b1;
else if(check_ovf_o == 'b10) check_ovf_o <= 'b0;
else check_ovf_o <= check_ovf_o;
end

endmodule