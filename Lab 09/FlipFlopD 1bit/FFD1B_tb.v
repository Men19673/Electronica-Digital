module testbench();

  reg clk, reset;
  reg A, enable;
  wire Y;

//Iniciamos el clock
    always
      begin
      clk <= 0; reset<=0; #1 clk<=1; #1;

      end
//Llamamos al modelo FSM
      ffD U1(clk, reset, enable, A, Y);


      initial begin //iniciamos el display
            $display(" ");
            $display("  ");
            $display(" ");
            $display(" CLK | RST | EN | A | Y");
            $display("-------------------------");
            $monitor("  %b |  %b  |  %b  |  %b  | %b",clk ,reset, enable, A, Y);
               A=0; enable=1;
            #2 A=0; enable=1;
            #2 A=1; enable=1;
            #2 A=0; enable=1;
            #2 A=0; enable=1;
            #2 A=0; enable=1;
            #2 A=1; enable=1;
            #2 A=1; enable=1;
            #2 A=1; enable=1;
            //

            //  #2 reset=1;

          end

        initial
        #15 $finish;

        initial begin
          $dumpfile("FFD1B_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
