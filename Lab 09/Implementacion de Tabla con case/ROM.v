//Diego A. Méndez
//Ejercicio 5

module ops(input wire[6:0] F, output reg[12:0] Y);

  always@(F) begin
    case(F)
//Implementamos la tabla con cses
        7'b0000000: assign Y= 13'b1000000001000;
        7'b1000000: assign Y= 13'b1000000001000;
        7'b0000101: assign Y= 13'b0100000001000;
        7'b0000111: assign Y= 13'b0100000001000;
        7'b0000001: assign Y= 13'b1000000001000;
        7'b0000011: assign Y= 13'b1000000001000;
        7'b0001101: assign Y= 13'b1000000001000;
        7'b0001001: assign Y= 13'b0100000001000;
        7'b0001101: assign Y= 13'b0100000001000;
        7'b0010001: assign Y= 13'b0001001000010;
        7'b0011001: assign Y= 13'b1001001100000;
        7'b0100001: assign Y= 13'b0011010000010;
        7'b0100011: assign Y= 13'b0011010000010;
        7'b0101001: assign Y= 13'b0011010000100;
        7'b0110001: assign Y= 13'b1011010100000;
        7'b0111001: assign Y= 13'b1000000111000;
        7'b1000011: assign Y= 13'b0100000001000;
        7'b1000001: assign Y= 13'b1000000001000;
        7'b1001011: assign Y= 13'b1000000001000;
        7'b1001001: assign Y= 13'b0100000001000;
        7'b1010001: assign Y= 13'b0011011000010;
        7'b1011001: assign Y= 13'b1011011100000;
        7'b1100001: assign Y= 13'b0100000001000;
        7'b1101001: assign Y= 13'b0000000001001;
        7'b1110001: assign Y= 13'b0011100000010;
        7'b1111001: assign Y= 13'b1011100100000;
      endcase

  end
endmodule
