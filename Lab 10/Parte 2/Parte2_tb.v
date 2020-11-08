//TestBench
module testbench();

  reg[3:0] B;
  reg ENbuff, ENaccu,  reset, clk;
  wire[3:0] Y;
  wire carry, zero;
  reg[2:0] F;

  //Iniciamos el clock
      always
        begin
        clk <= 0; reset<=0; #1 clk<=1; #1;

        end

//Llamamos al modulo
      accualu U1( B, F, ENbuff, clk, reset, ENaccu, Y, carry, zero);


      initial begin //iniciamos el display
      #1 reset=1; #1 reset=0; B=00000; #1
            $display(" ");
            $display("  ");
            $display(" ");
            $display(" B    |  Enable  |  F  |  Y  | Carry | Zero");
            $display("--------------------------------------");
            $monitor("  %b |   %b , %b  | %b |  %b  | %b | %b  ", B , ENbuff, ENaccu, F, Y, carry, zero);
            #2  B=4'b0010; ENbuff=1; ENaccu=1; F= 010;
            #2  B=4'b0001; ENbuff=1; ENaccu=1; F= 011;
            #2  B=4'b0011; ENbuff=1; ENaccu=1; F= 001;
            #1  B=4'b0000; F=000;
            #1  B=4'b0000; ENbuff=1; ENaccu=1; F= 011;
            #2  B=4'b1000; ENbuff=1; ENaccu=1; F= 010;
            #2  B=4'b1110; ENbuff=1; ENaccu=1; F= 100;
            #1  B=4'b0000; F=000;
            #2  B=4'b1111; ENbuff=1; ENaccu=1; F= 001;

            //

            //  #2 reset=1;

          end

        initial
        #20 $finish;

        initial begin
          $dumpfile("Parte2_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
