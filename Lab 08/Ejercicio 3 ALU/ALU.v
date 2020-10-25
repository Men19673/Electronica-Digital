//Diego A. Méndez
//Ejercicio 3
//ALU


module ALU(input wire[3:0] A, B, input wire[2:0] F, output reg[3:0] Y);

  always@(A,B,F) begin
    case(F)
        //Implementación de un AND
        3'b000: assign Y= A & B;
        //Implementación de un OR
        3'b001: assign Y= A | B;
        //Implementación de una suma
        3'b010: assign Y= A + B;
        //Muestra 0
        3'b011: assign Y= 0;
        //Implementación de in AND con B'
        3'b100: assign Y= A & ~B;
        //Implementación de un OR con B'
        3'b101: assign Y= A | ~B;
        //Implementación de una resta
        3'b110: assign Y= A - B;
        //Implementación de un comparador
        3'b111: assign Y= (A<B) ? 1:0;
    endcase
    end

endmodule
