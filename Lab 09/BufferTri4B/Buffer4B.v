//Ejercicio 4
//Diego A. Méndez

module TriBuff(input wire[3:0] A, input wire EN, output wire[3:0] Y);

 assign Y= EN ? A : 4'bz;

endmodule // TriBuff
