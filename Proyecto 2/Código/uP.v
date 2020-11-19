//Diego Alejandro Méndez Hernández
//Proyecto uP en Verilog

//Este es un buffer de 4 bits que son los que se encuentran conectados al data bus
module TriBuff(input wire[3:0] A, input wire EN, output wire[3:0] Y);

 assign Y= EN ? A : 4'bz;

endmodule // TriBuff

module accu(input clk, reset, enable, input wire[3:0] D, output reg[3:0] Q);

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

module ALU(input wire[3:0] A, B, input wire[2:0] F, output wire Carry, Zero, output wire[3:0] Y );

  reg[4:0] Y_5;

    always@(A,B,F) begin

      case(F)
      //Para que carry no este en alta
          default: Y_5 <= 5'b00000;
          //Sacar del accumulator
          3'b000:  Y_5<= A ;
          //Compare y Resta
          3'b001:  Y_5<= A - B;
          //Dejar pasar B
          3'b010:  Y_5<= B;
          //Suma A y B
          3'b011:  Y_5<= A + B;
          //NAND
          3'b100:  Y_5<=(A~&B);


      endcase
      end
    assign Carry= Y_5[4];
    assign Y=Y_5[3:0];
    assign Zero = (Y_5[3:0]==0)? 1 : 0;

endmodule


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

//Modulo de la memoria RAM
module RAM(input reg[11:0] RAMaddress, input wire csRAM, weRAM, output reg [3:0] RAMdata);

    wire[3:0] dataout;
    reg[3:0] memory[0:4095];


        //Modulo de ST
          always @ (RAMaddress or RAMdata or weRAM) begin
              if (csRAM && weRAM) begin
                    memory[address]= RAMdata;
              end
          end

        //Modulo de lectura
        always @ (RAMaddress or RAMdata or weRAM) begin
            if (csRAM && !weRAM) begin
                  memory[address]= RAMdata;
            end
        end

        //Buffer de la RAM
        assign RAMdata= (csRAM && !weRAM) ? dataout : 4'bz;
  endmodule
  //Decoder
  module deco(input wire[6:0] F, output reg[12:0] Y);

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


//Modulo desde el contador hasta el Fetch
module PCFetch(input wire clk, reset, ENcounter, ENnotphase, Load, input wire[11:0] InputLoad, output wire[3:0] oprnd, instr);

        wire[11:0] Y;
        wire[7:0] data;

        contador U1(clk, reset, ENcounter, Load, InputLoad, Y);
        memoria U2(Y, data);
        fetch U3(clk, reset, ENnotphase, data, instr, oprnd);
endmodule

//Modulo desde el buffer despues de Fetch hasta el buffer despues de la ALU
module accualu(input wire[3:0] B, input wire[2:0] F, input wire oeOprnd, oeALU, clk, reset, ENaccu, output wire[3:0] Y, output wire carry, zero);
      wire[3:0] wireB, wireA, wireY;

      //Buffer de Oprnd despues del Fetch
      TriBuff U1 (B, oeOprnd, wireB);

      accu U2(clk, reset, ENaccu, wireY, wireA);
      ALU U3(wireA, wireB, F, carry, zero, wireY);

      //Buffer de la salidad de la ALU
      TriBuff U4(wireY, oeALU, Y);
endmodule
