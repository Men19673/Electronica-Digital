//Diego A Mendez
//Lab 10 Ejercicio 1

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

//Memoria ROM
module memoria(input wire[11:0] address, output wire [7:0] data);

reg[7:0] memory[0:4095];

  initial begin
//recordar hacer la lista con .list
 $readmemb("EPROM.list", memory);
  end

 assign data = memory[address];

endmodule

module fetch(input wire clk, reset, enable, input wire[7:0] D, output wire[3:0] instr, oprnd);

reg[7:0]Q;

  always @(posedge clk, posedge reset) begin

    if (reset) begin
      Q<=0;
    end

    if (clk) begin
      Q<=D;
    end
  end

assign instr = Q[7:4];
assign oprnd = Q[3:0];

endmodule

module PCFetch(input wire clk, reset, EN, Load, input wire[11:0] InputLoad, output wire[3:0] oprnd, instr);

wire[11:0] Y;
wire[7:0] data;

contador U1(clk, reset, EN, Load, InputLoad, Y);
memoria U2(Y, data);
fetch U3(clk, reset, EN, data, instr, oprnd);

endmodule
