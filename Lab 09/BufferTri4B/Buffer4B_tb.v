//Diego A. Méndez
//Ejercicio2
//TestBench
module testbench();

  reg[3:0] A;
  reg enable;
  wire[3:0] Y;


//Llamamos al modelo FSM
      TriBuff U1(A, enable, Y);


      initial begin //iniciamos el display
      #1
            $display(" ");
            $display("  ");
            $display(" ");
            $display(" A   |  EN  |   Y");
            $display("-------------------------");
            $monitor("  %b |  %b  |  %b  ", A , enable, Y);
                A=0000; enable=1;
            #1  A=0010; enable=1;
            #1  A=0110; enable=1;
            #1  A=1100; enable=1;
            #1  A=1010; enable=0;
            #1  A=0110; enable=0;
            #1  A=0000; enable=1;
            #1  A=1111; enable=1;
            #1  A=1101; enable=1;
            //

            //  #2 reset=1;

          end

        initial
        #15 $finish;

        initial begin
          $dumpfile("Buffer4B_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
