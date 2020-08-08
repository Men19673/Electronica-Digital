module E1.1GL(input wire A, B, output wire Y);
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
  or U7 (Y, out01, out02, out03);
endmodule

module E1.2GL(input wire A, B, output wire Y);
//ejercicio 1.2 con GateLevel Modeling

  wire outAN, outBN, outCN, out01, out02, out03, out04;

//not's
  not U1 (outAN,A);
  not U2 (outBN,B);
  not U3 (outCN,C);

//compuertas

  and U4 (out01, outAN, outBN);
  and U5 (out02, A, outBN);
  or U7 (Y, out01, out02, B);
  
endmodule
