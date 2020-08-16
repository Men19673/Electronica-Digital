//Diego A. Méndez
//19673
//Testbench

module testbench();
// registrar entradas

  reg inC2;
  reg inB3, inC3;
  reg inC5;
  reg inB6, inC6;


  reg[2:0] inS1, inS4;
  reg[1:0] inS2, inS5;
  reg inS3, inS6;
  wire Y1, Y2, Y3, Y4, Y5, Y6;

  //Llamando a los modulos
    tabla1mux8 U1(inS1, Y1);
    tabla1mux4 U2(inC2, inS2, Y2);
    tabla1mux2 U3(inS3, inB3, inC3 ,Y3);
    tabla2mux8 U4(inS4, Y4);
    tabla2mux4 U5(inC5, inS5, Y5);
    tabla2mux2 U6(inS6, inB6, inC6, Y6);


  initial begin //iniciamos el mux8_1
    $display(" ");
    $display(" Tabla 1 ");
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
        $display(" Tabla 1 ");
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
          $display(" Tabla 1 ");
          $display("Mux2 a 1");
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

      initial begin //iniciamos el mux8_1
      #25
        $display(" ");
        $display(" Tabla 2 ");
        $display("Mux8 a 1");
        $display("ABC | Y");
        $display("----------");
        $monitor("%b | %b",inS4 ,Y4);

             inS4=000;
          #1 inS4=001;
          #1 inS4=010;
          #1 inS4=011;
          #1 inS4=100;
          #1 inS4=101;
          #1 inS4=110;
          #1 inS4=111;
          end
      initial begin //iniciamos el mux8_1
      #33
          $display(" ");
          $display(" Tabla 2 ");
          $display("Mux4 a 1");
          $display("ABC | Y");
          $display("----------");
          $monitor("%b%b | %b",inS5, inC5 ,Y5);
               inS5=00; inC5=0;
            #1 inS5=00; inC5=1;
            #1 inS5=01; inC5=0;
            #1 inS5=01; inC5=1;
            #1 inS5=10; inC5=0;
            #1 inS5=10; inC5=1;
            #1 inS5=11; inC5=0;
            #1 inS5=11; inC5=1;
            end

      initial begin //iniciamos el mux8_1
      #41
          $display(" ");
          $display(" Tabla 1 ");
          $display("Mux2 a 1");
          $display("ABC | Y");
          $display("----------");
          $monitor("%b%b%b | %b",inS6, inB6, inC6 ,Y6);
               inS6=0; inB6=0; inC6=0;
            #1 inS6=0; inB6=0; inC6=1;
            #1 inS6=0; inB6=1; inC6=0;
            #1 inS6=0; inB6=1; inC6=1;
            #1 inS6=1; inB6=0; inC6=0;
            #1 inS6=1; inB6=0; inC6=1;
            #1 inS6=1; inB6=1; inC6=0;
            #1 inS6=1; inB6=1; inC6=1;
            end

    initial

    #49 $finish;

  initial begin

      $dumpfile("Ejercicio4_tb.vcd");
      $dumpvars(0,testbench);
  end

  endmodule
