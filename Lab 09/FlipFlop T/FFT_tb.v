//Diego A. Méndez
//Ejercicio2
//TestBench
module testbench();

  reg clk, reset, enable;
  wire Y;

//Iniciamos el clock
    always
      begin
      clk <= 0; reset<=0; #1 clk<=1; #1;

      end
//Llamamos al modelo FSM
      ffT U1(clk, reset, enable, Y);


      initial begin //iniciamos el display
      reset=1; #1 reset=0;
            $display(" ");
            $display("  ");
            $display(" ");
            $display(" CLK | RST | EN | Y");
            $display("-------------------------");
            $monitor("  %b |  %b  |  %b  | %b",clk ,reset, enable, Y);
                enable=1;
            #2  enable=1;
            #2  enable=1;
            #2  enable=1;
            #2  enable=0;
            #2  enable=0;
            #2  enable=1;
            #2  enable=1;
            #2  enable=1;
            //

            //  #2 reset=1;

          end

        initial
        #15 $finish;

        initial begin
          $dumpfile("FFT_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
