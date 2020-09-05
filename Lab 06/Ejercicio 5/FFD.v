//Diego A. Méndez
//Ejercicio 5

//FlipFlop 4 Bits
module ffD(input clk, reset, set,
           input[3:0] D,
           output reg[3:0] Q);



    always @(posedge clk, posedge reset, posedge set) begin
      //Hacemos que el reset haga Q = 0000
      if (reset) begin
        Q <= 4'b0;
        end
      //Hacemos que el set haga Q=1111
      else if (set) begin
        Q <= 4'b1111;
        end
      //Hacemos que Q se vuelva D
      else
        Q <= D;
      end


endmodule
