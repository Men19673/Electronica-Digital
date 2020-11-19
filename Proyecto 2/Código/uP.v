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

module Flags(input clk, reset, enable, carryon , zerroz, output wire Q[1], Q[0]);
 wire[2:0] D;
  D[1]= carryon;
  D[0]= zerroz;

    ffD2B U1(clk, reset, enable, D, Q);
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

module ffT (input clk, reset, output wire Q);
  reg enable;
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
module decoder(input wire[6:0] F, output reg inPC, loadPC, loadA, loadFlags, output reg[2:0]S, output reg csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut);


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
   $readmemb("EPROM.list", memory);
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
module RAM(input reg[11:0] RAMaddress, input wire csRAM, weRAM, output reg [3:0] RAMdata);

    wire[3:0] dataout;
    reg[3:0] memory[0:4095];


        //Modulo de ST
          always @ (RAMaddress or RAMdata or weRAM) begin
              if (csRAM && weRAM) begin
                    memory[RAMaddress]= RAMdata;
              end
          end

        //Modulo de lectura
        always @ (RAMaddress or RAMdata or weRAM) begin
            if (csRAM && !weRAM) begin
                  dataout = memory[RAMaddress];
            end
        end

        //Buffer de la RAM
        assign RAMdata= (csRAM && !weRAM) ? dataout : 4'bz;
  endmodule


//Modulo desde el contador hasta el Fetch
module PCFetch(input wire clk, reset, ENcounter, ENnotphase, Load, input wire[11:0] InputLoad, output wire[7:0] data, output wire[3:0] oprnd, instr);

        wire[11:0] Y;
        wire[7:0] data;

        contador U1(clk, reset, ENcounter, Load, InputLoad, Y);
        memoria U2(Y, data);
        fetch U3(clk, reset, ENnotphase, data, instr, oprnd);
endmodule

//Modulo desde el buffer despues de Fetch hasta el buffer despues de la ALU
module accualu(input wire[3:0] oprnd, input wire[2:0] F, input wire oeOprnd, oeALU, clk, reset, loadA, output wire[3:0] data_bus, output wire carry, zero);
      wire[3:0] data_bus, wireA, wireY;

      //Buffer de Oprnd despues del Fetch
      TriBuff U1 (oprnd, oeOprnd, data_bus);

      accu U2(clk, reset, loadA, wireY, wireA);
      ALU U3(wireA, data_bus, F, carry, zero, wireY);

      //Buffer de la salidad de la ALU
      TriBuff U4(wireY, oeALU, data_bus);
endmodule


module uP(input wire clock, reset, input wire[3:0] pushbuttons, output wire phase, c_flag, z_flag, output wire[3:0] instr, oprnd, data_bus, FF_out, accu, output wire[7:0] program_byte, output wire[11:0] pc, address_ram);
  wire notphase, carry, zerro;
  wire[11:0] address_RAM;
  wire[3:0] data_bus;
  wire[6:0] F;
  wire[2:0] S;
  F[6:3]= instr;
  F[2]= c_flag;
  F[1]= z_flag;
  F[0]= phase;
  address_RAM[11:8] = oprnd;
  address_RAM[7:0] = program_byte;
  not(notphase, phase);

  //Modulo flags es un FFD 2bit pero con cada bit independiente
  Flags U4(clock, reset, loadFlags, carry, zerro, c_flag, z_flag);

  decoder U0( F, inPC, loadPC, loadA, loadFlags, S, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut);
  ffT Phase(clk, reset, phase);
  PCFetch U1(clk, reset, inPC, notphase, loadPC, address_RAM, program_byte, oprnd, instr);
  accualu U2(oprnd, S, oeOprnd, oeALU, clk, reset, loadA, data_bus, carry, zerro);
  RAM U3(address_RAM, csRAM, weRAM, data_bus);

  TriBuff Inputs(pushbuttons, oeIN, data_bus);
  ffD4B output(clk, reset, loadOut, data_bus, FF_out);

endmodule
