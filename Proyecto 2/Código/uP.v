//Diego Alejandro Méndez Hernández
//Proyecto uP en Verilog

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

module ffD2B (input clk, reset, enable, input[1:0] D, output wire[1:0] Q);

    ffD U2(clk, reset, enable, D[1], Q[1]);
    ffD U1(clk, reset, enable, D[0], Q[0]);

endmodule // ffD2B

module ffD4B (input clk, reset, enable, input[3:0] D, output wire[3:0] Q);
    ffD U1(clk, reset, enable, D[0], Q[0]);
    ffD U2(clk, reset, enable, D[1], Q[1]);
    ffD U3(clk, reset, enable, D[2], Q[2]);
    ffD U4(clk, reset, enable, D[3], Q[3]);

endmodule // ffD4B

module Flags(input wire clk, reset, enable, carryon, zerroz, output wire Q1, Q0);
 wire[1:0] D, Q;
  assign D[1]= carryon;
  assign D[0]= zerroz;

    ffD2B U1(clk, reset, enable, D, Q);
  assign  Q1=Q[1];
  assign  Q0=Q[0];
endmodule

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

module ALU(input wire[3:0] A, B, input wire[2:0] S, output wire Carry, Zero, output wire[3:0] Y );

  reg[4:0] Y_5;

    always@(A,B,S) begin

      case(S)
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
          3'b100:  Y_5<={ 1'b0, ~(A&B)};


      endcase
      end
    assign Carry= Y_5[4];
    assign Y=Y_5[3:0];
    assign Zero = (Y_5[3:0]==0)? 1 : 0;

endmodule

module ffT (input wire clk, reset, output wire Q);
  wire enable;
  assign enable=1;
  wire jumper;
  not(jumper, Q);

  ffD U1(clk, reset, enable, jumper, Q);

endmodule // ffT

//Contador de 12bits
module contador(input wire clk, reset, EN, load, input wire[11:0] inpload, output reg[11:0] Q);

    wire D[11:0];

      always @(posedge clk, posedge reset) begin
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
//Decoder
module decoder(input wire[6:0] F, output wire inPC, loadPC, loadA, loadFlags, output wire[2:0]S, output wire csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut);

  reg[12:0] Y;

  always@(F) begin
    casez(F)

       default: Y <= 13'b0000000000000;
    //Implementamos la tabla con cases
    7'bzzzzzz0: Y <= 13'b1000000001000;
    7'b00001z1: Y <= 13'b0100000001000;// JC
    7'b00000z1: Y <= 13'b1000000001000;// JC
    7'b00011z1: Y <= 13'b1000000001000;// JNC
    7'b00010z1: Y <= 13'b0100000001000;// JNC
    7'b0010zz1: Y <= 13'b0001001000010;// CMPI
    7'b0011zz1: Y <= 13'b1001001100000;// CMPM
    7'b0100zz1: Y <= 13'b0011010000010;// LIT
    7'b0101zz1: Y <= 13'b0011010000100;// IN
    7'b0110zz1: Y <= 13'b1011010100000;// LD
    7'b0111zz1: Y <= 13'b1000000111000;// ST
    7'b1000z11: Y <= 13'b0100000001000;// JZ
    7'b1000z01: Y <= 13'b1000000001000;// JZ
    7'b1001z11: Y <= 13'b1000000001000;// JNZ
    7'b1001z01: Y <= 13'b0100000001000;// JNZ
    7'b1010zz1: Y <= 13'b0011011000010;// ADDI
    7'b1011zz1: Y <= 13'b1011011100000;// ADDM
    7'b1100zz1: Y <= 13'b0100000001000;// JMP
    7'b1101zz1: Y <= 13'b0000000001001;// OUT
    7'b1110zz1: Y <= 13'b0011100000010;// NANDI
    7'b1111zz1: Y <= 13'b1011100100000;// NANDM


      endcase
      end

    assign inPC=Y[12];
    assign loadPC= Y[11];
    assign loadA= Y[10];
    assign loadFlags= Y[9];
    assign S= Y[8:6];
    assign csRAM= Y[5];
    assign weRAM= Y[4];
    assign oeALU= Y[3];
    assign oeIN= Y[2];
    assign oeOprnd= Y[1];
    assign loadOut= Y[0];

endmodule

//Memoria ROM
module memoria(input wire[11:0] address, output wire [7:0] data);

  reg[7:0] memory[0:4095];

    initial begin
  //recordar hacer la lista con .list
   $readmemh("EPROM.list", memory);
    end

   assign data = memory[address];

endmodule
  //Fetch
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
module RAM(input wire[11:0] RAMaddress, input wire csRAM, weRAM, inout wire [3:0] RAMdata);

    reg[3:0] dataout;
    reg[3:0] memory[0:4095];


        //Modulo de ST
          always @ (RAMaddress or RAMdata or weRAM or RAMdata) begin
              if (csRAM && weRAM) begin
                memory[RAMaddress]<= RAMdata;
              end
          end

        //Modulo de lectura
        always @ (RAMaddress or RAMdata or csRAM) begin
            if (csRAM && !weRAM) begin
               dataout <= memory[RAMaddress];
            end
        end

        //Buffer de la RAM
         assign RAMdata= (csRAM && !weRAM) ? dataout : 4'bz;
  endmodule


module uP(input wire clock, reset, input wire[3:0] pushbuttons, output wire phase, c_flag, z_flag, output wire[3:0] instr, oprnd, data_bus, FF_out, accu, output wire[7:0] program_byte, output wire[11:0] PC, address_RAM);
  wire notphase, carry, zerro;

  wire[6:0] F;
  wire[3:0] wireY;
  wire[2:0] S;
  assign F[6:3]= instr;
  assign F[2]= c_flag;
  assign F[1]= z_flag;
  assign F[0]= phase;
  assign address_RAM[11:8] = oprnd;
  assign address_RAM[7:0] = program_byte;
  not(notphase, phase);

  ffT ffphase(clock, reset, phase);

  contador ProgCounter(clock, reset, inPC, loadPC, address_RAM, PC);

  memoria ROM(PC, program_byte);

  decoder Deco(F, inPC, loadPC, loadA, loadFlags, S, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut);

  fetch Fetch(clock, reset, notphase, program_byte, instr, oprnd);

  TriBuff BuffOprnd(oprnd, oeOprnd, data_bus);

  RAM Ram(address_RAM, csRAM, weRAM, data_bus);

  ALU Alu(accu, data_bus, S, carry, zero, wireY);

  TriBuff BuffALU(wireY, oeALU, data_bus);

  accu ACCU(clock, reset, loadA, wireY , accu);

  Flags flags(clock, reset, loadFlags, carry, zero, c_flag, z_flag);

  TriBuff Inputs(pushbuttons, oeIN, data_bus);

  ffD4B Outputs(clock, reset, loadOut, data_bus, FF_out);






endmodule
