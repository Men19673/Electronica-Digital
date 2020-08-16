//Diego A. Méndez
//19673
//Testbench

module testbench();
// registrar entradas
  reg inA1, inB1, inC1, inD1, inE1, inF1, inG1, inH1;
  reg[2:0] inS;
  wire Y;
  mux8_1 U1(inA1, inB1, inC1, inD1, inE1, inF1, inG1, inH1, inS, Y);
  initial begin //iniciamos el mux8_1
    $display(" ");
    $display("Mux8_1");
    $display("A B C | Y");
    $display("----------");
    $monitor("%b  %b",inS ,Y);
       inA1=0; inB1=1; inC1=1; inD1=0;
       inE1=1; inF1=0; inG1=0; inH1=1;
         inS=000;
      #1 inS=001;
      #1 inS=010;
      #1 inS=011;
      #1 inS=100;
      #1 inS=101;
      #1 inS=110;
      #1 inS=111;
      end



    initial

    #10 $finish;

  initial begin

      $dumpfile("Ejercicio4_tb.vcd");
      $dumpvars(0,testbench);
  end

  endmodule
