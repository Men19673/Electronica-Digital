//Diego A. Méndez
//Testbench FFD 2 bits

module testbench();

  reg clk, reset, enable;
  reg[1:0] A;
  wire[1:0] Y;

//Iniciamos el clock
    always
      begin
      clk <= 0; reset<=0; #1 clk<=1; #1;

      end
//Llamamos al modelo FSM
      ffD2B U1(clk, reset, enable, A, Y);


      initial begin //iniciamos el display
            $display(" ");
            $display("  ");
            $display(" ");
            $display(" CLK | RST | EN | A | Y");
            $display("-------------------------");
            $monitor("  %b |  %b  |  %b  |  %b  | %b",clk ,reset, enable, A, Y);
               A=00; enable=1;
            #2 A=00; enable=1;
            #2 A=10; enable=1;
            #2 A=00; enable=0;
            #2 A=00; enable=1;
            #2 A=00; enable=1;
            #2 A=10; enable=1;
            #2 A=11; enable=1;
            #2 A=10; enable=1;
            //

            //  #2 reset=1;

          end

        initial
        #18 $finish;

        initial begin
          $dumpfile("FFD2B_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
