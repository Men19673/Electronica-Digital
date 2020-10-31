//Diego A. Méndez
//Ejercicio 2
module ffD(input wire clk, reset, enable, input wire D, output reg Q);

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

module ffJK(input wire clk, reset, enable, input wire J, K, output wire Q );

  wire nQ, wire1, wire2, D;

    not U1(nQ, Q);
    not U2(nK, K);
    and U3(wire1, J, nQ);
    and U4(wire2, nK, Q);
    or U5(D, wire1, wire2);

    ffD U6(clk, reset, enable, D, Q);


endmodule
