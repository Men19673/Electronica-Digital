//Diego A. Méndez
//Ejercicio 5

//FlipFlop 4 Bits
module ffD(input clk, reset,
           input[3:0] D,
           output reg[3:0] Q);

    

    always @(posedge clk, posedge reset) begin
      //Hacemos que el reset haga Q = 0
      if(reset) begin
        Q <= 4'b0;
        end
      //Hacemos que Q se vuelva D
      else
        Q <= D;
        end




endmodule
