//Diego A. Méndez
//Ejercicio 1

//FlipFlop de 2bit
module ffD(input clk, reset, enable, input D, output reg Q);

    always @(posedge clk, posedge reset) begin
      //Hacemos que el reset haga Q = 0
      if (reset) begin
        Q <= 0;
        end
      //Hacemos que el Enable funcione
      else if (enable) begin
        Q <= D;
        end
      end //Always

endmodule

module ffD2B (input clk, reset, enable, input[1:0] D, output wire[1:0] Q);

    ffD U2(clk, reset, enable, D[1], Q[1]);
    ffD U1(clk, reset, enable, D[0], Q[0]);

endmodule // ffD2B
