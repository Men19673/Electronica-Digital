// Diego A. Méndez
//Testbench Parte 1

module testbench();

  reg clk, reset, EN, Load;
  reg[11:0] InputLoad;
  wire[3:0] oprnd, instr;

//Iniciamos el clock
    always
      begin
      clk <= 0; #1 clk<=1; #1;
      end
//Llamamos al modulo de contador
 PCFetch U1(clk, reset, EN, Load, InputLoad, oprnd, instr);

      initial begin //iniciamos el display
            reset=1; Load=0;
            #1
            $display(" ");
            $display("  ");
            $display(" ");
            $display("CLK| RST | Enable | Load |    InputLoad    |   Instruction | Operand");
            $display("---------------------------------------------------");
            $monitor("| %b |  %b |   %b   |   %b   |   %b  |  %b  |  %b",clk ,reset, EN, Load, InputLoad, instr, oprnd);
             reset=0; EN=1; Load=0; InputLoad=12'b000000001110;
            #2 reset=0; EN=0; Load=0;
            #2 reset=0; EN=0; Load=0;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=1; Load=1;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=1; Load=0;
            #2 reset=0; EN=0; Load=0;
            #2 reset=0; EN=0; Load=0;


          end

        initial
        #30 $finish;

        initial begin
          $dumpfile("Parte1_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
