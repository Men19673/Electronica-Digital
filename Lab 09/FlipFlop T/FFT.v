//Diego A. Méndez
//Ejercicio2

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

module ffT (input clk, reset, enable, output wire Q);

  wire jumper;
  not(jumper, Q);

  ffD U1(clk, reset, enable, jumper, Q);



endmodule // ffT
