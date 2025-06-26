/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP3
// Date      : Tue Jun 24 22:29:35 2025
/////////////////////////////////////////////////////////////


module counter ( clk, rst_n, en, q );
  output [7:0] q;
  input clk, rst_n, en;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  SAEDRVT14_FDPRBQ_V2LP_0P5 \q_reg[4]  ( .D(n6), .CK(clk), .RD(rst_n), .Q(q[4]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 \q_reg[0]  ( .D(n2), .CK(clk), .RD(rst_n), .Q(q[0]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 \q_reg[3]  ( .D(n5), .CK(clk), .RD(rst_n), .Q(q[3]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 \q_reg[2]  ( .D(n4), .CK(clk), .RD(rst_n), .Q(q[2]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 \q_reg[5]  ( .D(n7), .CK(clk), .RD(rst_n), .Q(q[5]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 \q_reg[7]  ( .D(n9), .CK(clk), .RD(rst_n), .Q(q[7]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 \q_reg[1]  ( .D(n3), .CK(clk), .RD(rst_n), .Q(q[1]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 \q_reg[6]  ( .D(n8), .CK(clk), .RD(rst_n), .Q(q[6]) );
  SAEDRVT14_INV_0P5 U12 ( .A(q[2]), .X(n10) );
  SAEDRVT14_MUX2_MM_0P5 U13 ( .D0(n20), .D1(n13), .S(q[3]), .X(n5) );
  SAEDRVT14_MUX2_MM_0P5 U14 ( .D0(q[0]), .D1(n22), .S(en), .X(n2) );
  SAEDRVT14_ND3B_0P75 U15 ( .A(n22), .B1(en), .B2(q[1]), .X(n18) );
  SAEDRVT14_AN3_0P75 U16 ( .A1(n17), .A2(q[5]), .A3(q[6]), .X(n19) );
  SAEDRVT14_ND3B_0P75 U17 ( .A(n13), .B1(q[3]), .B2(q[4]), .X(n21) );
  SAEDRVT14_ND3B_0P75 U18 ( .A(n22), .B1(q[2]), .B2(q[1]), .X(n11) );
  SAEDRVT14_AN3_0P75 U19 ( .A1(q[3]), .A2(q[4]), .A3(n20), .X(n17) );
  SAEDRVT14_OA21_1 U20 ( .A1(n17), .A2(q[5]), .B(n16), .X(n7) );
  SAEDRVT14_AOI21_0P75 U21 ( .A1(n16), .A2(n15), .B(n19), .X(n8) );
  SAEDRVT14_AN2B_MM_12 U22 ( .B(q[5]), .A(n21), .X(n14) );
  SAEDRVT14_AOI21_0P75 U23 ( .A1(n10), .A2(n18), .B(n20), .X(n4) );
  SAEDRVT14_AN4_0P5 U24 ( .A1(en), .A2(q[0]), .A3(q[1]), .A4(q[2]), .X(n20) );
  SAEDRVT14_INV_0P5 U25 ( .A(q[6]), .X(n15) );
  SAEDRVT14_INV_0P5 U26 ( .A(q[0]), .X(n22) );
  SAEDRVT14_INV_0P5 U27 ( .A(n14), .X(n16) );
  SAEDRVT14_AO32_U_0P5 U28 ( .A1(n21), .A2(q[3]), .A3(n20), .B1(n21), .B2(q[4]), .X(n6) );
  SAEDRVT14_AO32_U_0P5 U29 ( .A1(n18), .A2(q[0]), .A3(en), .B1(n18), .B2(q[1]), 
        .X(n3) );
  SAEDRVT14_CLKSPLT_1 U30 ( .CK(en), .CKOUTB(n12) );
  SAEDRVT14_OR2_MM_0P5 U31 ( .A1(n12), .A2(n11), .X(n13) );
  SAEDRVT14_EO2_V1_0P75 U32 ( .A1(n19), .A2(q[7]), .X(n9) );
endmodule

