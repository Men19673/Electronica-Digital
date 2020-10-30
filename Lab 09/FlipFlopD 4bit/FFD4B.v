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

module ffD4B (input clk, reset, enable, input[3:0] D, output wire[3:0] Q);
    ffD U1(clk, reset, enable, D[0], Q[0]);
    ffD U2(clk, reset, enable, D[1], Q[1]);
    ffD U3(clk, reset, enable, D[2], Q[2]);
    ffD U4(clk, reset, enable, D[3], Q[3]);

endmodule // ffD4B
