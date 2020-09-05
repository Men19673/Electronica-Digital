//Diego A. Méndez
//Ejercicio 1

//FlipFlop del ejercicio 5
module ffD(input clk, reset, input D, output reg Q);

    always @(posedge clk, posedge reset) begin
      //Hacemos que el reset haga Q = 0
      if (reset) begin
        Q <= 0;
        end
      //Hacemos que Q se vuelva D
      else
        Q <= D;
      end
endmodule
//Modulo para FSM
module FSM(input wire A, clk, reset, output Y );
  wire Sf2, Sf1, Sf0;
  wire S2, S1, S0;

  not(nS2, S2);
  not(nS1, S1);
  not(nS0, S0);
  not(nA, A);

  assign Sf2 = S2 & S0 + A & S1 & nS0 + nA & nS1 & nS0;
  assign Sf1 = S1 & nS0 + nA & S2 & S0 + A & nS2 & S0;
  assign Sf0 = A & S2 & S1 + nA & nS2 & S1 + nA & S2 & nS1 + A & nS2 & nS1;

  ffD U1(clk, reset, Sf1, S1);
  ffD U2(clk, reset, Sf0, S0);
  ffD U3(clk, reset, Sf2, S2);

  endmodule
