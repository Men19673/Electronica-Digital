//Diego A. Méndez
//Contador TestBench
module testbench();

  reg clk, reset, EN, Load;
  reg[11:0] InputLoad;
  wire[11:0] Y;

//Iniciamos el clock
    always
      begin
      clk <= 0; #1 clk<=1; #1;
      end
//Llamamos al modulo de contador
      contador U1(clk, reset, EN, Load, InputLoad, Y);


      initial begin //iniciamos el display
            reset=1; Load=0;
            #1
            $display(" ");
            $display("  ");
            $display(" ");
            $display("CLK| RST | Enable | Load |    InputLoad    |      Y");
            $display("---------------------------------------------------");
            $monitor("| %b |  %b |   %b   |   %b   |   %b  |  %b ",clk ,reset, EN, Load, InputLoad, Y);
             reset=0; EN=1; Load=0; InputLoad=001001001001;
            #1 reset=0; EN=0; Load=0;
            #1 reset=0; EN=0; Load=0;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=1; Load=1;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=1; Load=0;
            #1 reset=0; EN=0; Load=0;
            #1 reset=0; EN=0; Load=0;


          end

        initial
        #30 $finish;

        initial begin
          $dumpfile("Contador_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
