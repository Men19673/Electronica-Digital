//Diego A. Méndez
//TestBench Ejercicio3

module testbench();

  reg clk, reset;
  reg A;
  wire[2:0] Y;

//Iniciamos el clock
    always
      begin
      clk <= 1 ; #1 clk<=0; #1;

      end
//Llamamos al modelo FSM
      FSM U1(A, clk, reset, Y);


      initial begin //iniciamos el display
            $display(" ");
            $display("  ");
            $display(" ");
            $display("CLK | RST | A | Y");
            $display("----------");
            $monitor("%b | %b | %b | %b",clk ,reset, A, Y);

               A=1; reset=1;
            #2 A=1; reset=0;
            #2 A=1;
            #2 A=1;
            #2 A=1;
            #2 A=1;
            #2 A=1;
            #2 A=1;
            #2 A=0;
            #2 A=0;
            #2A=0;
            #2A=0;


          end

        initial
        #20 $finish;

        initial begin
          $dumpfile("FSM_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
