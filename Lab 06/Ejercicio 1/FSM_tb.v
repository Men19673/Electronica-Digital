//Diego A. Méndez
//TestBench Ejercicio5

module testbench();

  reg clk, reset;
  reg A, B;
  wire Y;

//Iniciamos el clock
    always
      begin
      clk <= 0; reset<=0; #1 clk<=1; #1;

      end
//Llamamos al modelo FSM
      FSM U1(A, B, clk, reset, Y);


      initial begin //iniciamos el display
            $display(" ");
            $display("  ");
            $display(" ");
            $display("CLK | RST | A | B | Y");
            $display("----------");
            $monitor("%b | %b | %b | %b | %b",clk ,reset, A, B, Y);
             A=0; B=0;
            #2 A=0; B=1;
            #2 A=1; B=0;
            #2 A=1; B=1;
            #2 A=0; B=0;
            #2 A=0; B=1;
            #2 A=1; B=0;
            #2 A=1; B=1;
            #2 A=1; B=1;
            //

            //  #2 reset=1;

          end

        initial
        #15 $finish;

        initial begin
          $dumpfile("FSM_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
