//Diego A. Méndez
//ALU TestBench
module testbench();

  reg[3:0] A,B;
  reg[2:0] F;
  wire[3:0] Y;

//No necesita de un clock
//Llamamos al modulo de contador
      ALU U1(A,B,F,Y);


      initial begin //iniciamos el display
            #1
            $display(" ");
            $display("  ");
            $display(" ");
            $display("|  A   |  B   |  F  |   Y  |");
            $display("----------------------------");
            $monitor("| %b | %b | %b | %b | ",A ,B, F, Y);
              A=1010; B=1001; F=000;
           #1 A=1010; B=1011; F=000;
           #1 A=0010; B=0101; F=001;
           #1 A=0010; B=0001; F=010;
           #1 A=0010; B=0001; F=011;
           #1 A=1010; B=0001; F=100;
           #1 A=0010; B=1001; F=101;
           #1 A=0100; B=0001; F=110;
           #1 A=0010; B=0001; F=111;
           #1 A=0001; B=1000; F=111;

            //

            //  #2 reset=1;

          end

        initial
        #30 $finish;

        initial begin
          $dumpfile("ALU_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
