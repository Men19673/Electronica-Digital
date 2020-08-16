//Diego A. Méndez
//19673
//Ejercicio 04

module mux2_1(input wire inA, inB, inS, output wire Y);

  assign Y=inS?inB:inA;

endmodule

module mux4_1(input wire inA, inB, inC, inD, input wire[1:0] inS, output wire Y);
//Creacion de un mux 4 a 1 basado
  wire Y1, Y2;
  mux2_1 U1(inA, inB, inS[0], Y1);
  mux2_1 U2(inC, inD, inS[0], Y2);
  mux2_1 U3(Y1, Y2, inS[1], Y);

endmodule

module mux8_1(input wire inA, inB, inC, inD, inE, inF, inG, inH, input wire[2:0] inS, output wire Y);
//Creacion de un mux 8 a 1 basado
  wire Y1, Y2;
  mux4_1 U1(inA, inB, inC, inD, inS[1:0], Y1);
  mux4_1 U2(inE, inF, inG, inH, inS[1:0], Y2);
  mux2_1 U3(Y1, Y2, inS[2], Y);

endmodule
