//Proyecto de Electronica Digital


//FlipFlop
module ffD(input clk, reset, input D, output reg Q);

  always @(posedge clk, posedge reset) begin
   //Hacemos que el reset haga Q = 0
   if (reset) begin
    Q <= 0;
    end
   //Hacemos que Q se vuelva D
   else
    Q <= D;
    end
endmodule

module Timer(input wire TOn, clk, reset, output wire TDone);
  wire clk2;
  reg TD;
  //And del flipflop
  assign clk2 = TOn & clk;
  //Flip flop del Timer para atrasar
  ffD U1(clk2, reset, TD, TDone);
  //Creacion del Timer
  always @(TOn)

  //Hacemos que cambie
  if (TOn==1) begin
    TD=0;
    #5
    TD=1;

    end
  else
    TD=0;

endmodule

    //Modulo para Seguridad Timer
module FSMSeguridadTimer(input wire T, clk, reset,  output wire S, TOn);
 wire SF;
 wire SA;


//colocamos las ecuaciones del estado futuro

assign SF = (~SA & T & ~TDone)|(~SA & T & TDone)|(SA & ~T & ~TDone)|(SA & T & ~TDone)|(SA & T & TDone);
assign TOn = (~SA & T & ~TDone)|(~SA & T & TDone)|(SA & ~T & ~TDone)|(SA & T & ~TDone)|(SA & T & TDone);
assign S = (~SA & T & ~TDone)|(~SA & T & TDone)|(SA & ~T & ~TDone)|(SA & T & ~TDone)|(SA & T & TDone);

// conectamos los flip flops
 ffD U0(clk, reset, SF, SA);
 Timer U2(TOn, clk, reset, TDone);



endmodule

//Modulo para FSM
module FSMPrincipal(input wire[1:0] ME, SSP, PF, input wire EL, LP, clk, reset, output wire[1:0] LCD, LCD2, Mo, output wire MP ,LED, SN, SA3 ,SA2, SA1, SA0);
 wire SF3, SF2 ,SF1, SF0;



//colocamos las ecuaciones del estado futuro

  assign SF3 = (~SA3 & ~SA0 & ~ME[1] & ME[0])|(~SA3 & ~SA0 & ME[1] & ~ME[0])|(SA3 & ~SA2 & SA1 & SSP[1])| (SA3 & ~SA2 & ~SA1 & ~SSP[1])|(SA3 & ~SA2 & SA0 & SSP[0])|(SA3 & ~SA2 & ~SA0 & ~SSP[0])|(SA3 & SA2 & SA1 & ~ME[1])|(SA3 & SA2 & SA1 & ~ME[0]) | (SA3 & ~SA1 & SA0 & SSP[0])|(SA3 & ~SA1 & ~SSP[1] & ~SSP[0])|(SA3 & SA2 & ~SA1 & ~SA0 & SSP[1])|(~SA3 & ~SA2 & ~SA0 & PF[1] & EL & ~LP & ~ME[0])|(~SA3 & SA2 & ~SA0 & ~PF[1] & EL & ~LP & ~ME[0])|(~SA3 & ~SA1 & ~SA0 & PF[0] & EL & ~LP & ~ME[0])|(~SA3 & SA1 & ~SA0 & ~PF[0] & EL & ~LP & ~ME[0]);

  assign SF2 = (~SA3 & SA2 & SA0)|(SA2 & ~SA1 & SA0)|(SA2 & SA1 & ~ME[1] & ME[0])|(~SA3 & ~SA0 & ~ME[1] & ME[0])|(SA2 & SA1 & ME[1] & ~ME[0])|(~SA3 & ~SA0 & ME[1] & ~ME[0])|(SA3 & SA2 & ~SA1 & ~SSP[0])|(SA3 & ~SA1 & ~SA0 & SSP[1] & SSP[0])|(~SA3 & SA2 & ~EL & ~ME[0])|(~SA3 & SA2 & LP & ~ME[0])|(~SA3 & SA2 & SA1 & PF[0] & ~ME[0])|(~SA3 & SA2 & ~PF[1] & PF[0] & ~ME[0])|(~SA3 & SA2 & PF[1] & ~PF[0] & ~ME[0]);



  assign SF1 = (~SA3 & SA1 & SA0)|(SA3 & ~SA2 & SA1 & ~SA0)|(~SA3 & ~SA0 & ~ME[1] & ME[0])|(~SA3 & ~SA0 & ME[1] & ~ME[0])|(SA3 & ~SA2 & ~SA0 & SSP[1] & SSP[0])|(SA3 & ~SA2 & SA0 & SSP[1] & ~SSP[0])|(SA3 & SA2 & ~SA1 & ~SA0 & ~SSP[1] & SSP[0])|(SA3 & SA2 & SA1 & ~ME[1])|(SA3 & SA2 & SA1 & ~ME[0])|(SA1 & ~SA0 & ~EL & ~ME[0])|(SA1 & ~SA0 & LP & ~ME[0])|(~SA2 & SA1 & SA0 & SSP[0])|(SA2 & SA1 & PF[1] & PF[0] & ~ME[0])|(SA1 & ~SA0 & ~PF[1] & ~PF[0] & ~ME[0])|(~SA3 & ~SA2 & ~SA0 & ~PF[1] & PF[0] & EL & ~LP & ~ME[0])|(~SA3 & SA2 & ~SA0 & ~PF[1] & ~PF[0] & EL & ~LP & ~ME[0]);


  assign SF0 =(~SA3 & SA0 & LP)|(~SA3 & LP & ~ME[0])|(SA3 & SA2 & SA1 & ~ME[0])|(~SA3 & ~SA0 & ME[1] & ~ME[0])|(SA3 & ~SA1 & SA0 & ~SSP[1])|(SA3 & ~SA2 & SA0 & SSP[0])|(SA3 & ~SA1 & SA0 & SSP[0])|(SA3 & ~SA2 & SA1 & SA0 & SSP[1])|(~SA3 & SA1 & ~SA0 & ~PF[0] & EL & ME[0])|(~SA3 & ~SA2 & ~SA0 & PF[1] & ~PF[0] & EL & ~ME[0])|(~SA3 & SA2 & ~SA0 & ~PF[1] & ~PF[0] & EL & ~ME[0]);


  assign LCD[1] = (SA3 & ~SA2 & ~SA1)|(~SA3 & SA2 & SA0)|(~SA3 & SA2 & ~EL & ~ME[1] & ~ME[0])|(~SA3 & SA2 & LP & ~ME[1] & ~ME[0])|(~SA3 & ~SA0 & PF[1] & EL & ~LP & ~ME[1] & ~ME[0])|(SA2 & ~SA1 & SA0);

  assign LCD[0] = (~SA3 & SA1 & SA0)|(SA3 & ~SA2 & ~SA0)|(SA3 & ~SA1 & ~SA0)|(~SA3 & SA1 & ~EL & ~ME[1] & ~ME[0])|(~SA3 & SA1 & LP & ~ME[1] & ~ME[0])|(~SA3 & ~SA0 & PF[0] & EL & ~LP & ~ME[1] & ~ME[0]);

  assign LCD2[1] = (SA2 & SA1 & ~SA0 & ME[1] & ~ME[0])|(SA3 & ~SA2 & SA1 & SA0 & SSP[1])|(SA3 & ~SA2 & SA1 & SA0 & SSP[0])|(~SA3 & SA2 & SA1 & ~SA0 & ~PF[0] & EL & ~LP & ~ME[0])|(~SA3 & SA2 & ~SA0 & ~PF[1] & EL & ~LP & ~ME[1] & ~ME[0])|(~SA3 & SA1 & ~SA0 & ~PF[1] & ~PF[0] & EL & ~LP & ~ME[1] & ~ME[0])|(SA3 & SA2 & SA1 & ME[1] & ME[0])|(SA3 & SA2 & ~SA1 & SA0 & ~SSP[1])|(SA3 & SA2 & ~SA1 & SSP[1] & SSP[0])|(SA3 & SA2 & ~SA1 & ~SA0 & ~SSP[0]);

  assign LCD2[0] = (SA3 & ~SA2 & ~SA1 & ~SSP[1])|(SA3 & ~SA2 & ~SA0 & ~SSP[0])|(SA3 & SA2 & SA1 & ME[1] & ~ME[0])|(SA2 & SA1 & ~SA0 & ME[1] & ~ME[0])|(SA3 & ~SA2 & SA1 & ~SA0 & SSP[1])|(SA3 & ~SA2 & ~SA1 & SA0 & SSP[0])|(~SA3 & ~SA2 & ~SA0 & PF[1] & EL & ~LP & ~ME[1] & ~ME[0])|(~SA3 & ~SA2 & ~SA1 & ~SA0 & PF[0] & EL & ~LP & ~ME[1] & ~ME[0])|(~SA3 & ~SA1 & ~SA0 & PF[1] & PF[0] & EL & ~LP & ~ME[1] & ~ME[0]);

  assign Mo[1] = (SA3 & ~SA2 & SA1 & SA0 & SSP[1])|( SA3 & SA2 & ~SA1 & ~SA0 & SSP[1])|(SA3 & ~SA2 & SA1 & SA0 & SSP[0])|( SA3 & SA2 & ~SA1 & SSP[1] & SSP[0])|( ~SA3 & SA2 & ~SA0 & ~PF[1] & EL & ~LP & ~ME[1] & ~ME[0])|( ~SA3 & SA2 & SA1 & ~SA0 & ~PF[0] & EL & ~LP & ~ME[1] & ~ME[0])|( ~SA3 & SA1 & ~SA0 & ~PF[1] & ~PF[0] & EL & ~LP & ~ME[1] & ~ME[0]) ;

  assign Mo[0] = (SA3 & ~SA2 & ~SA1 & ~SSP[1])|(SA3 & ~SA2 & ~SA0 & ~SSP[0])|( SA3 & ~SA2 & SA1 & ~SA0 & SSP[1])|( SA3 & ~SA2 & ~SA1 & SA0 & SSP[0])|(~SA3 & ~SA2 & ~SA0 & PF[1] & EL & ~LP & ~ME[1] & ~ME[0])|(~SA3 & ~SA2 & ~SA1 & ~SA0 & PF[0] & EL & ~LP & ~ME[1] & ~ME[0])|(~SA3 & ~SA1 & ~SA0 & PF[1] & PF[0] & EL & ~LP & ~ME[1] & ~ME[0]);

  assign MP = (SA3 & ~SA2)|( SA3 & ~SA1)|( SA3 & ~ME[1])|( ~SA0 & ~ME[1] & ME[0])|(~SA2 & ~SA0 & PF[1] & EL & ~LP & ~ME[1])|( SA2 & ~SA0 & ~PF[1] & EL & ~LP & ME[1])|( ~SA1 & ~SA0 & PF[0] & EL & ~LP & ~ME[1])|( SA1 & ~SA0 & ~PF[0] & EL & ~LP & ~ME[1]) ;

  assign LED = (~SA3 & SA0 & LP)|(~SA3 & LP & ~ME[1] & ~ME[0]);

  assign SN = (~SA3 & SA0 & LP)|( ~SA3 & LP & ~ME[0])|(~SA3 & ~SA0 & ME[1] & ~ME[0])|( SA3 & SA2 & SA1 & ME[1] & ~ME[0]);


// conectamos los flip flops
 ffD U0(clk, reset, SF0, SA0);
 ffD U1(clk, reset, SF1, SA1);
 ffD U2(clk, reset, SF2, SA2);
 ffD U3(clk, reset, SF3, SA3);

endmodule
