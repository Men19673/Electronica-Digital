//Diego A. Méndez
//Ejercicio 5

//FlipFlop 4 Bits
module ffD(input wire clk,
           input wire[3:0] D,
           output reg[3:0] Q);

    always @(posedge clk, reset);
      if(reset) Q<=4'b0

endmodule
