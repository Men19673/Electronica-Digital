module testbench();
// registrar entradas
  reg inA1, inB1, inC1, inD1;
  reg inA2, inB2, inC2, inD2;
  reg inA3, inB3, inC3, inD3;
  wire Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8;

  E1_1GL E1(inA1, inB1, inC1, Y1);
  E1_2GL E2(inA2, inB2, inC2, Y2);
  E1_3OP E3(inA3, inB3, inC3, inD3, Y3);
  initial begin
    $display(" ");                                                               //iniciamos el módulo Ej1.1
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

  initial begin                                                                 //iniciamos el módulo Ej1.1
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
      $display(" ");                                                               //iniciamos el módulo Ej1.1
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

      $dumpfile("ejercicios_tb.vcd");
      $dumpvars(0,testbench);
  end

  endmodule
