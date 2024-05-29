module drv_btn
(
input clk_i,
input rst_i,
input btn_i,

output srv_o   
);

dff DFF_inst_1
(
.clk_i(clk_i),
.rst_i(rst_i),
.d_i(btn_i),

.q_o(q1),
.qn_o()
);
dff DFF_inst_2
(
.clk_i(clk_i),
.rst_i(rst_i),
.d_i(q1),

.q_o(q2),
.qn_o()
);
dff DFF_inst_3
(
.clk_i(clk_i),
.rst_i(rst_i),
.d_i(q2),

.q_o(q3),
.qn_o()
);
dff DFF_inst_4
(
.clk_i(clk_i),
.rst_i(rst_i),
.d_i(q3),

.q_o(),
.qn_o(qn4)
);
and2 AND_inst_1
(
.in1_i(q3),
.in2_i(qn4),

.out1_o(srv_o)
);

endmodule