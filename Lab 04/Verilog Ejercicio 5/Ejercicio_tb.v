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

  module MK_GL(inA1, inB1, inC1, Y1);
  module MK_OP(inA2, inB2, inC2, Y2);
  module SOP_GL(inA3, inB3, inC3, Y3);
  module SOP_OP(inA4, inB4, inC4, Y4);
  module POS_GL(inA5, inB5, inC5, Y5);
  module POS_OP(inA6, inB6, inC6, Y6);


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
        $display(" ");         //iniciamos el módulo Ej1.3
        $display("SOP con Gate Modeling");
        $display("A B C  | Y");
        $display("----------");
        $monitor("%b %b %b %b  %b",inA3,inB3,inC3,Y3);
          inA3=0; inB3=0; inC3=0;
        #1 inA3=0; inB3=0; inC3=1;
        #1 inA3=0; inB3=1; inC3=0;
        #1 inA3=0; inB3=1; inC3=1;
        #1 inA3=1; inB3=0; inC3=0;
        #1 inA3=1; inB3=0; inC3=1;
        #1 inA3=1; inB3=1; inC3=0;
        #1 inA3=1; inB3=1; inC3=1;
  end
