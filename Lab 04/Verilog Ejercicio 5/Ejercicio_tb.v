//Diego Alejandro Mendez
//Carnet 19673
//Ejercicio 05

module testbench();
// registrar entradas
  reg inA1, inB1, inC1;
  reg inA2, inB2, inC2;
  reg inA3, inB3, inC3;
  reg inA4, inB4, inC4;
  reg inA5, inB5, inC5;
  reg inA6, inB6, inC6;

  wire Y1, Y2, Y3, Y4, Y5, Y6;

  MK_GL U1(inA1, inB1, inC1, Y1);
  MK_OP U2(inA2, inB2, inC2, Y2);
  SOP_GL U3(inA3, inB3, inC3, Y3);
  SOP_OP U4(inA4, inB4, inC4, Y4);
  POS_GL U5(inA5, inB5, inC5, Y5);
  POS_OP U6(inA6, inB6, inC6, Y6);


  initial begin //iniciamos el módulo MK_GL
    $display(" ");
    $display("Mapa Karnaugh de Gate Modeling");
    $display("A B C | Y");
    $display("----------");
    $monitor("%b %b %b  %b",inA1,inB1,inC1,Y1);
       inA1=0; inB1=0; inC1=0;
    #1 inA1=0; inB1=0; inC1=1;
    #1 inA1=0; inB1=1; inC1=0;
    #1 inA1=0; inB1=1; inC1=1;
    #1 inA1=1; inB1=0; inC1=0;
    #1 inA1=1; inB1=0; inC1=1;
    #1 inA1=1; inB1=1; inC1=0;
    #1 inA1=1; inB1=1; inC1=1;
    end

  initial begin   //iniciamos el módulo MK_OP
    #9
    $display("");
    $display("Mapa Karnaugh de Operadores");
    $display("A B C | Y");
    $display("----------");
    $monitor("%b %b %b  %b",inA2,inB2,inC2,Y2);
       inA2=0; inB2=0; inC2=0;
    #1 inA2=0; inB2=0; inC2=1;
    #1 inA2=0; inB2=1; inC2=0;
    #1 inA2=0; inB2=1; inC2=1;
    #1 inA2=1; inB2=0; inC2=0;
    #1 inA2=1; inB2=0; inC2=1;
    #1 inA2=1; inB2=1; inC2=0;
    #1 inA2=1; inB2=1; inC2=1;
    end

  initial begin
    #18
    $display(" ");         //iniciamos el módulo SOP_GL
    $display("SOP con Gate Modeling");
    $display("A B C  | Y");
    $display("----------");
    $monitor("%b %b %b  %b",inA3,inB3,inC3,Y3);
      inA3=0; inB3=0; inC3=0;
    #1 inA3=0; inB3=0; inC3=1;
    #1 inA3=0; inB3=1; inC3=0;
    #1 inA3=0; inB3=1; inC3=1;
    #1 inA3=1; inB3=0; inC3=0;
    #1 inA3=1; inB3=0; inC3=1;
    #1 inA3=1; inB3=1; inC3=0;
    #1 inA3=1; inB3=1; inC3=1;
    end

  initial begin           //iniciamos el SOP con Operadores
    #27
      $display(" ");
      $display("SOP con Operadores");
      $display("A B C | Y");
      $display("----------");
      $monitor("%b %b %b  %b",inA4,inB4,inC4,Y4);
        inA4=0; inB4=0; inC4=0;
      #1 inA4=0; inB4=0; inC4=1;
      #1 inA4=0; inB4=1; inC4=0;
      #1 inA4=0; inB4=1; inC4=1;
      #1 inA4=1; inB4=0; inC4=0;
      #1 inA4=1; inB4=0; inC4=1;
      #1 inA4=1; inB4=1; inC4=0;
      #1 inA4=1; inB4=1; inC4=1;
    end

    initial begin           //iniciamos el POS con Gate Modeling
      #36
        $display(" ");
        $display("POS con Gate Modeling");
        $display("A B C | Y");
        $display("----------");
        $monitor("%b %b %b  %b",inA5,inB5,inC5,Y5);
          inA5=0; inB5=0; inC5=0;
        #1 inA5=0; inB5=0; inC5=1;
        #1 inA5=0; inB5=1; inC5=0;
        #1 inA5=0; inB5=1; inC5=1;
        #1 inA5=1; inB5=0; inC5=0;
        #1 inA5=1; inB5=0; inC5=1;
        #1 inA5=1; inB5=1; inC5=0;
        #1 inA5=1; inB5=1; inC5=1;
      end

      initial begin
        #45
          $display(" ");         //iniciamos el módulo POS con Operadores
          $display("POS con Operadores");
          $display("A B C | Y");
          $display("----------");
          $monitor("%b %b %b   %b",inA6,inB6,inC6,Y6);
          inA6=0; inB6=0; inC6=0;
       #1 inA6=0; inB6=0; inC6=1;
       #1 inA6=0; inB6=1; inC6=0;
       #1 inA6=0; inB6=1; inC6=1;
       #1 inA6=1; inB6=0; inC6=0;
       #1 inA6=1; inB6=0; inC6=1;
       #1 inA6=1; inB6=1; inC6=0;
       #1 inA6=1; inB6=1; inC6=1;
        end

  initial
  #54 $finish;

  initial begin

      $dumpfile("Ejercicio_tb.vcd");
      $dumpvars(0,testbench);
  end

  endmodule
