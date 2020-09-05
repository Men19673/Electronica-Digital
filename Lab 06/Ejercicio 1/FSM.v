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
module FSM(input wire A, B, clk, reset, output Y );
  wire Sf1, Sf0;
  wire S1, S0;

  not(nS1, S1);
  not(nS0, S0);



  assign Sf1= S0 & B + S1 & A & B;
  assign Sf0= nS1 & nS0 & A;
  assign Y= S1 & A & B;

  ffD U1(clk, reset, Sf1, S1);
  ffD U2(clk, reset, Sf0, S0);




endmodule
