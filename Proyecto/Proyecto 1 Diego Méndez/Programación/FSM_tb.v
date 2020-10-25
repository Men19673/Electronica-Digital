//Diego Alejandro Méndez Hernández
//TestBench Proyecto

module testbench();

  reg[1:0]  SSP, PF;
  reg  LP, clk, reset, T, SP, B, L;
  wire[1:0] LCD, LCD2, Mo, ME;
  wire MP, EL, LED, SN;

//Iniciamos el clock
    always
      begin
      clk <= 0; #1 clk<=1; #1;

      end
//Llamamos al modelo FSM
      FSMPrincipal U1(ME, SSP, PF, EL, LP, clk, reset, LCD, LCD2, Mo, MP, LED, SN, SA3 ,SA2, SA1, SA0);
      FSMSeguridadTimer U2(T, clk, reset, S, TOn);
      assign ME[1]= (~L & B) | (L & B);
      assign ME[0]= (L & ~B);
      assign EL= S & SP;
//Falta hacer lo de Boton y LLave


      initial begin //iniciamos el display
            $display(" ");
            $display("  ");
            $display(" ");
            $display("CLK | RST |  PF  |  SSP |  T |  LP | B | L | S | LCD | LCD2 | Mo | MP | LED | SN | SA3 | SA2 | SA1 | SA0 |");
            $display("----------");
            $monitor("%b   |  %b  |  %b  |  %b  |  %b  |  %b | %b | %B | %b |  %B |  %b  | %b |  %b |  %b  |  %b |  %b  |  %b  |  %b  |  %b  |",clk ,reset, PF, SSP, T, LP, B, L, S, LCD, LCD2, Mo, MP, LED, SN, SA3 ,SA2, SA1, SA0);
               reset =1; PF=00; SSP=00; B=0; L=0; T=0; LP=0;
            #1 reset =0;
            #1 PF=00; SSP=00; B=0; L=0; T=0; LP=0; SP=0;
            #1 PF=00; SSP=00; B=0; L=0; T=0; LP=1; SP=0;
            #1 PF=00; SSP=00; B=0; L=0; T=0; LP=0; SP=0;

            #1 PF=00; SSP=00; B=1; L=0; T=0; LP=0; SP=0;
            #1 PF=00; SSP=00; B=1; L=0; T=0; LP=0; SP=0;
            #1 PF=00; SSP=00; B=0; L=0; T=1; LP=0; SP=0;
            #2 PF=00; SSP=00; B=0; L=0; T=0; LP=0; SP=0;
            #2 PF=01; SSP=00; B=0; L=0; T=0; LP=0; SP=1;
            #2 PF=01; SSP=00; B=0; L=0; T=0; LP=0; SP=0;
            #2 PF=01; SSP=01; B=0; L=0; T=0; LP=0; SP=0;
            #2 PF=01; SSP=01; B=0; L=0; T=0; LP=1; SP=0;
            #2 PF=01; SSP=01; B=0; L=0; T=0; LP=0; SP=0;
            #2 PF=01; SSP=01; B=0; L=0; T=0; LP=0; SP=0;
            #2 PF=01; SSP=01; B=0; L=0; T=0; LP=0; SP=0;

            #2 PF=10; SSP=01; B=0; L=0; T=0; LP=0;
            #2 PF=10; SSP=01; B=0; L=0; T=1; LP=0; SP=0;
            #2 PF=10; SSP=01; B=0; L=0; T=0; LP=0; SP=1;
            #2 PF=10; SSP=10; B=0; L=0; T=0; LP=0;
            #2 PF=10; SSP=10; B=0; L=1; T=0; LP=0;
            #2 PF=10; SSP=10; B=0; L=0; T=0; LP=0;
            #2 PF=10; SSP=00; B=0; L=0; T=0; LP=0;

            #2 PF=11; SSP=10; B=0; L=0; T=1; LP=0;
            #2 PF=11; SSP=10; B=0; L=0; T=0; LP=0;
            #2 PF=11; SSP=10; B=0; L=0; T=0; LP=0;
            #2 PF=11; SSP=10; B=0; L=0; T=0; LP=0;
            #2 PF=11; SSP=11; B=0; L=0; T=0; LP=0;
            #2 PF=11; SSP=11; B=0; L=0; T=0; LP=1;
            #2 PF=11; SSP=11; B=0; L=0; T=0; LP=0;
            #2 PF=11; SSP=11; B=0; L=0; T=0; LP=0;
            #2 PF=11; SSP=11; B=0; L=0; T=1; LP=0;

            #2 PF=00; SSP=11; B=0; L=0; T=0; LP=0;
            #2 PF=00; SSP=10; B=0; L=0; T=0; LP=0;
            #2 PF=00; SSP=01; B=0; L=0; T=0; LP=0;
            #2 PF=00; SSP=00; B=0; L=0; T=0; LP=0;
            #2 PF=00; SSP=00; B=0; L=0; T=0; LP=0;
            //

            //  #2 reset=1;

          end

        initial
        #65 $finish;

        initial begin
          $dumpfile("FSM_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
