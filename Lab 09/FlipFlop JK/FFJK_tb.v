//Diego A. Méndez
//Ejercicio 2 TestBench

module testbench();

  reg clk, reset;
  reg J, K, enable;
  wire Y;

//Iniciamos el clock
    always
      begin
      clk <= 0; reset<=0; #1 clk<=1; #1;

      end
//Llamamos al modelo FSM
       ffJK U1(clk, reset, enable, J, K, Y);


      initial begin //iniciamos el display
      reset=1; #1 reset=0;
            $display(" ");
            $display("  ");
            $display(" ");
            $display(" CLK | RST | EN | J | K |Y");
            $display("-------------------------");
            $monitor("  %b |  %b  |  %b  |  %b |  %b  | %b",clk ,reset, enable, J, K, Y);
               J=0; K=0; enable=1;
            #2 J=0; K=1; enable=1;
            #2 J=1; K=0; enable=1;
            #2 J=0; K=0; enable=1;
            #2 J=0; K=1; enable=0;
            #2 J=0; K=0; enable=1;
            #2 J=0; K=0; enable=1;
            #2 J=1; K=1; enable=1;
            #2 J=1; K=1; enable=1;
            #2 J=1; K=1; enable=1;
            //

            //  #2 reset=1;

          end

        initial
        #20 $finish;

        initial begin
          $dumpfile("FFJK_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
