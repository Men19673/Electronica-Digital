//Diego A. Mendez
//PArte 2

//Buffer 4bit
module TriBuff(input wire[3:0] A, input wire EN, output wire[3:0] Y);

 assign Y= EN ? A : 4'bz;

endmodule // TriBuff

//Accumulator
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

//ALU
module ALU(input wire[3:0] A, B, input wire[2:0] F, output wire Carry, Zero, output wire[3:0] Y );

reg[4:0] Y_5;

  always@(A,B,F) begin

    case(F)
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
        //Para que carry no este en alta

    endcase
    end
assign Carry= Y_5[4];
assign Y=Y_5[3:0];
assign Zero = (Y_5[3:0]==0)? 1 : 0;

endmodule

module accualu(input wire[3:0] B, input wire[2:0] F, input wire ENbuff, clk, reset, ENaccu, output wire[3:0] Y, output wire carry, zero);

wire[3:0] wireB, wireA, wireY;

TriBuff U1 (B,ENbuff,wireB);
accu U2(clk, reset, ENaccu, wireY, wireA);
ALU U3(wireA, wireB, F, carry, zero, wireY);
TriBuff U4(wireY,ENbuff, Y);


endmodule
