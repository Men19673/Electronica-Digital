//Diego Alejandro Méndez Hernández
//TestBench Proyecto

module testbench();
  reg clk, reset;
  reg T;
  wire S, TOn;

//Iniciamos el clock
    always
      begin
      clk <= 0; #1 clk<=1; #1;

      end
//Llamamos al modelo FSM
      FSMSeguridadTimer U1(T, clk, reset, S, TOn);


      initial begin //iniciamos el display
            $display(" ");
            $display("  ");
            $display(" ");
            $display("CLK | RST |  T  |  S | TOn | ");
            $display("----------");
            $monitor("%b | %b | %b | %b | %b |",clk ,reset, T, S, TOn);
               T=0; reset =1 ;
            #1 reset =0;
            #2 T=0;
            #2 T=1;
            #2 T=0;
            #2 T=0;
            #2 T=0;
            #2 T=0;
            #2 T=0;
            #2 T=0;
            #2 T=0;
            #2 T=0;
            #2 T=0;
            #2 T=0;
            #2 T=0;
            //

            //  #2 reset=1;

          end

        initial
        #25 $finish;

        initial begin
          $dumpfile("FSM_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
