module testbench();
// registrar entradas
  reg inA1, inB1, inC1, inD1;
  reg inA2, inB2, inC2, inD2;
  reg inA3, inB3, inC3, inD3;
  reg inA4, inB4, inC4, inD4;
  reg inA5, inB5, inC5, inD5;
  wire Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8;

  E1_1GL E1(inA1, inB1, inC1, Y1);
  E1_2GL E2(inA2, inB2, inC2, Y2);
  E1_3OP E3(inA3, inB3, inC3, inD3, Y3);
  E1_4GL E4(inA4, inB4, inC4, inD4, Y4);
  E2_1OP E5(inA5, inB5, inC5, inD5, Y5);

  initial begin
    $display(" ");          //iniciamos el módulo Ej1.1
    $display("EJERCICIO 1.1");
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

  initial begin                //iniciamos el módulo Ej1.2
    #9
    $display("");
    $display("EJERCICIO 1.2");
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
      $display("EJERCICIO 1.3");
      $display("A B C D | Y");
      $display("----------");
      $monitor("%b %b %b %b  %b",inA3,inB3,inC3,inD3,Y3);
        inA3=0; inB3=0; inC3=0; inD3=0;
      #1 inA3=0; inB3=0; inC3=0; inD3=1;
      #1 inA3=0; inB3=0; inC3=1; inD3=0;
      #1 inA3=0; inB3=0; inC3=1; inD3=1;
      #1 inA3=0; inB3=1; inC3=0; inD3=0;
      #1 inA3=0; inB3=1; inC3=0; inD3=1;
      #1 inA3=0; inB3=1; inC3=1; inD3=0;
      #1 inA3=0; inB3=1; inC3=1; inD3=1;
      #1 inA3=1; inB3=0; inC3=0; inD3=0;
      #1 inA3=1; inB3=0; inC3=0; inD3=1;
      #1 inA3=1; inB3=0; inC3=1; inD3=0;
      #1 inA3=1; inB3=0; inC3=1; inD3=1;
      #1 inA3=1; inB3=1; inC3=0; inD3=0;
      #1 inA3=1; inB3=1; inC3=0; inD3=1;
      #1 inA3=1; inB3=1; inC3=1; inD3=0;
      #1 inA3=1; inB3=1; inC3=1; inD3=1;
    end

    initial begin
      #25
        $display(" ");         //iniciamos el módulo Ej1.4
        $display("EJERCICIO 1.4");
        $display("A B C D | Y");
        $display("----------");
        $monitor("%b %b %b %b  %b",inA4,inB4,inC4,inD4,Y4);
          inA4=0; inB4=0; inC4=0; inD4=0;
        #1 inA4=0; inB4=0; inC4=0; inD4=1;
        #1 inA4=0; inB4=0; inC4=1; inD4=0;
        #1 inA4=0; inB4=0; inC4=1; inD4=1;
        #1 inA4=0; inB4=1; inC4=0; inD4=0;
        #1 inA4=0; inB4=1; inC4=0; inD4=1;
        #1 inA4=0; inB4=1; inC4=1; inD4=0;
        #1 inA4=0; inB4=1; inC4=1; inD4=1;
        #1 inA4=1; inB4=0; inC4=0; inD4=0;
        #1 inA4=1; inB4=0; inC4=0; inD4=1;
        #1 inA4=1; inB4=0; inC4=1; inD4=0;
        #1 inA4=1; inB4=0; inC4=1; inD4=1;
        #1 inA4=1; inB4=1; inC4=0; inD4=0;
        #1 inA4=1; inB4=1; inC4=0; inD4=1;
        #1 inA4=1; inB4=1; inC4=1; inD4=0;
        #1 inA4=1; inB4=1; inC4=1; inD4=1;
      end

      initial begin
        #25
          $display(" ");         //iniciamos el módulo Ej2.1
          $display("EJERCICIO 2.1");
          $display("A B C D | Y");
          $display("----------");
          $monitor("%b %b %b %b  %b",inA5,inB5,inC5,inD5,Y5);
            inA5=0; inB5=0; inC5=0; inD5=0;
          #1 inA5=0; inB5=0; inC5=0; inD5=1;
          #1 inA5=0; inB5=0; inC5=1; inD5=0;
          #1 inA5=0; inB5=0; inC5=1; inD5=1;
          #1 inA5=0; inB5=1; inC5=0; inD5=0;
          #1 inA5=0; inB5=1; inC5=0; inD5=1;
          #1 inA5=0; inB5=1; inC5=1; inD5=0;
          #1 inA5=0; inB5=1; inC5=1; inD5=1;
          #1 inA5=1; inB5=0; inC5=0; inD5=0;
          #1 inA5=1; inB5=0; inC5=0; inD5=1;
          #1 inA5=1; inB5=0; inC5=1; inD5=0;
          #1 inA5=1; inB5=0; inC5=1; inD5=1;
          #1 inA5=1; inB5=1; inC5=0; inD5=0;
          #1 inA5=1; inB5=1; inC5=0; inD5=1;
          #1 inA5=1; inB5=1; inC5=1; inD5=0;
          #1 inA5=1; inB5=1; inC5=1; inD5=1;
        end

        initial begin
          #45
            $display(" ");         //iniciamos el módulo Ej2.2
            $display("EJERCICIO 2.2");
            $display("A B C D | Y");
            $display("----------");
            $monitor("%b %b %b %b  %b",inA6,inB6,inC6,inD6,Y6);
              inA6=0; inB6=0; inC6=0; inD6=0;
            #1 inA6=0; inB6=0; inC6=0; inD6=1;
            #1 inA6=0; inB6=0; inC6=1; inD6=0;
            #1 inA6=0; inB6=0; inC6=1; inD6=1;
            #1 inA6=0; inB6=1; inC6=0; inD6=0;
            #1 inA6=0; inB6=1; inC6=0; inD6=1;
            #1 inA6=0; inB6=1; inC6=1; inD6=0;
            #1 inA6=0; inB6=1; inC6=1; inD6=1;
            #1 inA6=1; inB6=0; inC6=0; inD6=0;
            #1 inA6=1; inB6=0; inC6=0; inD6=1;
            #1 inA6=1; inB6=0; inC6=1; inD6=0;
            #1 inA6=1; inB6=0; inC6=1; inD6=1;
            #1 inA6=1; inB6=1; inC6=0; inD6=0;
            #1 inA6=1; inB6=1; inC6=0; inD6=1;
            #1 inA6=1; inB6=1; inC6=1; inD6=0;
            #1 inA6=1; inB6=1; inC6=1; inD6=1;
          end

  initial begin

      $dumpfile("ejercicios_tb.vcd");
      $dumpvars(0,testbench);
  end

  endmodule
