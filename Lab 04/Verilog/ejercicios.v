
module E1_1GL(input wire A, B, C, output wire Y1);
//ejercicio 1.1 con GateLevel Modeling

  wire outAN, outBN, outCN, out01, out02, out03, out04;

//not's
  not U1 (outAN,A);
  not U2 (outBN,B);
  not U3 (outCN,C);

//compuertas

  and U4 (out01, outAN, outCN);
  and U5 (out02, A, C);
  and U6 (out03, A, outBN);
  or U7 (Y1, out01, out02, out03);
endmodule

module E1_2GL(input wire A, B, C, output wire Y2);
//ejercicio 1.2 con GateLevel Modeling

  wire outAN, outBN, outCN, out01, out02, out03, out04;

//not's
  not U2 (Y2,B);

endmodule

module E1_3OP(input wire A, B, C, D, output wire Y3);
//ejercicio 1.3 con operadores
  assign Y3 = (~A & ~B & ~C & ~D) | (~A & ~B & C & D) | (~A & B & ~C & D) | (~A & B & C & ~D) | (A & B & ~C & ~D) | (A & B & C & D) | (A & ~B & ~C & D) | (A & ~B & C & ~D);

endmodule

module E1_4GL (input wire A, B, C, D, output wire Y4);
  //Ejercicio 1.4 con GateLevel Modeling

  wire outAN, outBN, outCN, outDN, out01, out02, out03, out04;
  //not's
    not U1 (outAN,A);
    not U2 (outBN,B);
    not U3 (outCN,C);
    not U4 (outDN,D);

  //compuertas

  and U5(out01, A, B);
  and U6(out02, A, outCN, outDN);
  and U7(out03, A, B, C);
  or U8(Y4, out01, out02, out03);
endmodule //E1_4

module E2_1OP (input wire A, B, C, D, output wire Y5);
//Ejercicio 2.1  con operadores
  assign Y5 = (~B & ~C & ~D) | (A & ~C) | (A & ~B) | (A & C & ~D);

endmodule // E2_1OP


module E2_3GL (input A, B, C, B, output wire Y6);
//Ejercicio 2.2 con GateLevel Modeling

  //Not's
  not U1 (outAN,A);
  not U2 (outBN,B);
  not U3 (outCN,C);
  not U4 (outDN,D);

  //compuertas
  or U5 (Y6, C, outBN);

endmodule // E2_3GL
