module tb();

localparam SP = 5; //semiperioada ceasului
localparam CLK1 = 10; //apasare normala = 10 ceasuri
localparam CLK2 = 20; //apasare lunga = 20 ceasuri
localparam CLK3 = 5; //apasare scurta = 5 ceasuri
localparam NrBiti = 27;
localparam NrBiti1 = 4;
localparam Limita = 'h3B9AC9FF;//10^8
localparam Limita1 = 'b1111;//15 in decimal - 16 unitati

wire btn1;
wire btn2;
wire btn3;
wire clk;
wire rst;
wire srv1;
wire srv2;
wire srv3;
wire enbl;
wire count_up;
wire [NrBiti1-1:0] dt;
wire ovf_1sec;
wire ovf_2sec;
wire [1:0] chk;

//ceasul de 100MHZ
clock #(SP) CLOCK_inst_1
(
.clk_o(clk),
.rst_o(rst)
);

//scenariul 1 de btn, btn este 1 timp de 10 de ceasuri
btn #(CLK1) BTN_inst_1
(
.clk_i(clk),
.btn_o(btn1)
);
drv_btn DRV_BTN_inst_1(
.clk_i(clk),
.rst_i(rst),
.btn_i(btn1),

.srv_o(srv1)
);

//scenariul 2 de btn, btn este 1 timp de 20 de ceasuri
btn #(CLK2) BTN_inst_2
(
.clk_i(clk),
.btn_o(btn2)
);
drv_btn DRV_BTN_inst_2(
.clk_i(clk),
.rst_i(rst),
.btn_i(btn2),

.srv_o(srv2)
);

//scenariul 3 de btn, btn este 1 timp de 5 de ceasuri
btn #(CLK3) BTN_inst_3
(
.clk_i(clk),
.btn_o(btn3)
);
drv_btn DRV_BTN_inst_3(
.clk_i(clk),
.rst_i(rst),
.btn_i(btn2),

.srv_o(srv3)
);

//instantiere modul contor pentru de o secunda si doua secunde la 16 ceasuri
ctu #(NrBiti1, Limita1) CTU_inst_2
(
.clk_i(clk),
.rst_i(rst),
.enable_i(enbl),
.count_up_i(count_up),

.data_o(dt),
.overflow_o(ovf_1sec),
.overflow2sec_o(ovf_2sec),
.check_ovf_o(chk)
);
scn_ctu #(Limita1) SCN_CTU_inst_2
(
.enable_o(enbl),
.count_up_o(count_up)
);

endmodule