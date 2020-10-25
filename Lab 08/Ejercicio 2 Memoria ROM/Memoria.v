//Diego A. Méndez
//Ejercicio 2
//Memoria ROM


module memoria(input wire[11:0] address, output wire [7:0] data);

reg[7:0] memory[0:4095];

  initial begin
//recordar hacer la lista con .list
 $readmemb("EPROM.list", memory);
  end

 assign data = memory[address];

endmodule
