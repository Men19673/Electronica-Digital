//Diego Alejandro Mendez
//Carnet 19673
//Ejercicio 05

module MK_GL(input wire A,B,C, output wire Y);
//Mapa Karnaugh con Gate Modeling

  wire out01, out02, out03, out04, out05, AN, BN, CN;

//Not's
  not U1(AN,A);
  not U2(BN,B);
  not U3(CN,C);

//Compuerta
  and U4(out01,A,C);
  and U5(out02,A,BN);
  or U6(Y, out01, out02);

endmodule //MK_GL

module MK_OP(input wire A,B,C, output wire Y);
//Mapa de Karnaugh con Operadores

  assign Y= (A & C) | (A & ~B);

endmodule //MK_OP

module SOP_GL(input wire A,B,C, output wire Y);
//SOP con Gate Modeling

wire out01, out02, out03, out04, out05, AN, BN, CN;

//Not's
  not U1(AN,A);
  not U2(BN,B);
  not U3(CN,C);

//Compuerta
  and U4(out01,A,BN,CN);
  and U5(out02,A,BN,C);
  and U6(out03,A,B,C);
  or U6(Y, out01, out02, out03);

endmodule // SOP_GL

module SOP_OP (input wire A,B,C, output wire Y);
//SOP  con Operadores

  assign Y = (A & ~B & ~C) | (A & ~B & C) | (A & B & C);

endmodule // SOP_OP

module POS_GL (input wire A,B,C, output wire Y);
//POS con Gate
  wire out01, out02, out03, out04, out05, AN, BN, CN;

//Not's
  not U1(AN,A);
  not U2(BN,B);
  not U3(CN,C);

//Compuerta
  or U4(out01,A,B,C);
  or U5(out02,A,B,CN);
  or U6(out03,A,BN,C);
  or U6(out04,A,BN,CN);
  or U7(out05,AN,BN,C);
  and U8(Y,out01, out02, out03, out04, out05);

endmodule //POS_GL

module POS_OP (input wire A,B,C, output wire Y);
//POS con Operadores

  assign Y = (A | B | C) & (A | B | ~C) & (A | ~B | C) & (A | ~B | ~C) & (~A | ~B | C);

endmodule //POS_OP
