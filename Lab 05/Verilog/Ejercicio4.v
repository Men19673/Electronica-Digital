Diego A. Méndez
19673
Ejercicio 04

module mux2_1(input wire inA, inB, inS, output wire Y);

  assign Y=inS?inA:inB;


endmodule()

module mux4_1(input wire inA, inB, inC, inD, input wire[1:0] inS, output wire Y);
//Creacion de un mux 4 a 1 basado

  mux2_1 U1(inA, inB, inS[1] );


endmodule()
