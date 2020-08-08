module testbench();
// registrar entradas
  reg inA1, inB1, inC1, inD1;
  wire Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8;

  E1_1GL E1(inA1, inB1, inC1, Y1);
  initial begin                                                                   //iniciamos el módulo Ej1.1

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


  initial
    #10 $finish;

  initial begin

      $dumpfile("ejercicios_tb.vcd");
      $dumpvars(0,testbench);
  end

  endmodule
