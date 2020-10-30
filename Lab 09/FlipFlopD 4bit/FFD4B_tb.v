module testbench();

  reg clk, reset, enable;
  reg[3:0] A;
  wire[3:0] Y;

//Iniciamos el clock
    always
      begin
      clk <= 0; reset<=0; #1 clk<=1; #1;

      end
//Llamamos al modelo FSM
      ffD4B U1(clk, reset, enable, A, Y);


      initial begin //iniciamos el display
            $display(" ");
            $display("  ");
            $display(" ");
            $display(" CLK | RST | EN | A | Y");
            $display("-------------------------");
            $monitor("  %b |  %b  |  %b  |  %b  | %b",clk ,reset, enable, A, Y);
               A=0000; enable=1;
            #2 A=0000; enable=1;
            #2 A=1010; enable=1;
            #2 A=0000; enable=0;
            #2 A=0000; enable=1;
            #2 A=0000; enable=1;
            #2 A=1000; enable=1;
            #2 A=1100; enable=1;
            #2 A=1000; enable=1;
            //

            //  #2 reset=1;

          end

        initial
        #17 $finish;

        initial begin
          $dumpfile("FFD4B_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
