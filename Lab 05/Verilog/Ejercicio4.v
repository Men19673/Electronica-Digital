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



module tabla1mux8(input wire[2:0] inS, output wire Y);
//modulo para mux 8 tabla 1

//registrar cables
  wire inA1, inB1, inC1, inD1, inE1, inF1, inG1, inH1;

//asignar valores
  assign inA1=0; assign inB1=1; assign inC1=1; assign inD1=0;
  assign inE1=1; assign inF1=0; assign inG1=0; assign inH1=1;

  mux8_1 U1(inA1, inB1, inC1, inD1, inE1, inF1, inG1, inH1, inS, Y);
endmodule


module tabla1mux4(input wire inC, input wire[1:0] inS, output wire Y);
  //aplicando la primera tabla con un mux4a1 y compuertas
  wire NC;

  not N1(NC,inC);
// la compuerta not nos sirve para trabajar unicamente con una entrada C y el mux 4
  mux4_1 U1(inC,NC,NC,inC,inS, Y);
endmodule

module tabla1mux2(input wire inS, inB, inC, output wire Y);
//aplicacion de mux2 en tabla1
  wire Y1, Y2;

  assign Y1= inB ^ inC ;
  assign Y2= inB ~^ inC;

  mux2_1 U1(Y1, Y2, inS, Y);


endmodule

//Tabla2

module tabla2mux8(input wire[2:0] inS, output wire Y);
//modulo para mux 8 tabla 2

//registrar cables
  wire inA1, inB1, inC1, inD1, inE1, inF1, inG1, inH1;

//asignar valores
  assign inA1=1; assign inB1=0; assign inC1=0; assign inD1=0;
  assign inE1=0; assign inF1=1; assign inG1=1; assign inH1=0;

  mux8_1 U1(inA1, inB1, inC1, inD1, inE1, inF1, inG1, inH1, inS, Y);
endmodule


module tabla2mux4(input wire inC, input wire[1:0] inS, output wire Y);
  //aplicando la segunda tabla con un mux4a1 y compuertas
  wire NC, P;
  assign P=0;
  not N1(NC,inC);
// la compuerta not nos sirve para trabajar unicamente con una entrada C y el mux 4
  mux4_1 U1(NC,P,inC,NC,inS, Y);
endmodule

module tabla2mux2(input wire inS, inB, inC, output wire Y);
//aplicacion de mux2 en tabla1
  wire Y1, Y2;

  assign Y1= inB ~| inC ;
  assign Y2= inB ^ inC;

  mux2_1 U1(Y1, Y2, inS, Y);


endmodule
