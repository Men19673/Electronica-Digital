//Diego A. Méndez
//Ejercicio 1
//Contador de 12bits


module contador(input wire clk, reset, EN, load, input wire[11:0] inpload, output reg[11:0] Q);

    wire D[11:0];

      always @(posedge clk, posedge reset, load) begin
        //Hacemos que el reset haga Q = 0
        if (reset) begin
          Q <= 12'b0;
        end

        //Hacemos que Q se 10 cuando sea load
        else if (load) begin
            Q <= inpload;
        end

        //Hacemos que Q sea D
        else if (EN) begin
            Q <= Q +1;
        end
      end

endmodule
