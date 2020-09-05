//Diego A. Méndez
//Ejercicio 5

//FlipFlop 4 Bits
module ffD(input clk, reset, set,
           input[3:0] D,
           output reg[3:0] Q);



    always @(posedge clk, posedge reset, posedge set) begin
      //Hacemos que el reset haga Q = 0

      //Hacemos que el set haga Q=
      if (reset) begin
        Q <= 4'b0;
        end
      else if (set) begin
        Q <= 4'b1111;
        end
      else
        Q <= D;
      end
      //Hacemos que Q se vuelva D




endmodule
