//Diego A. Méndez
//19673
//Testbench

module testbench();
// registrar entradas

  reg inA2, inB2, inC2;
  reg inA3, inB3, inC3;


  reg[2:0] inS1, inS4;
  reg[1:0] inS2, inS5;
  reg inS3, inS6;
  wire Y1, Y2, Y3, Y4, Y5, Y6;

  //Llamando a los modulos
    tabla1mux8 U1(inS1, Y1);
    tabla1mux4 U2(inC2, inS2, Y2);
    tabla1mux2 U3(inS3, inB3, inC3 ,Y3);


  initial begin //iniciamos el mux8_1
    $display(" ");
    $display("Mux8 a 1");
    $display("ABC | Y");
    $display("----------");
    $monitor("%b | %b",inS1 ,Y1);

         inS1=000;
      #1 inS1=001;
      #1 inS1=010;
      #1 inS1=011;
      #1 inS1=100;
      #1 inS1=101;
      #1 inS1=110;
      #1 inS1=111;
      end

    initial begin //iniciamos el mux8_1
    #8
        $display(" ");
        $display("Mux4 a 1");
        $display("ABC | Y");
        $display("----------");
        $monitor("%b%b | %b",inS2, inC2 ,Y2);
             inS2=00; inC2=0;
          #1 inS2=00; inC2=1;
          #1 inS2=01; inC2=0;
          #1 inS2=01; inC2=1;
          #1 inS2=10; inC2=0;
          #1 inS2=10; inC2=1;
          #1 inS2=11; inC2=0;
          #1 inS2=11; inC2=1;
          end

      initial begin //iniciamos el mux8_1
      #16
          $display(" ");
          $display("Mux4 a 1");
          $display("ABC | Y");
          $display("----------");
          $monitor("%b%b%b | %b",inS3, inB3, inC3 ,Y3);
               inS3=0; inB3=0; inC3=0;
            #1 inS3=0; inB3=0; inC3=1;
            #1 inS3=0; inB3=1; inC3=0;
            #1 inS3=0; inB3=1; inC3=1;
            #1 inS3=1; inB3=0; inC3=0;
            #1 inS3=1; inB3=0; inC3=1;
            #1 inS3=1; inB3=1; inC3=0;
            #1 inS3=1; inB3=1; inC3=1;
            end

    initial

    #25 $finish;

  initial begin

      $dumpfile("Ejercicio4_tb.vcd");
      $dumpvars(0,testbench);
  end

  endmodule
