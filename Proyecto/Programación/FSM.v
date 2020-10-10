//Diego Alejandro Méndez Hernández
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

//Modulo para FSM
module FSM Principal(input wire[1:0]  ME, SSP, PF, input wire EL, LP,  clk, reset, output wire[1:0] LCD, LCD2, Mo, output wire MP,LED, SN);
  wire SF3, SF2 ,SF1, SF0;
  wire SA3 ,SA2, SA1, SA0;


//colocamos las ecuaciones del estado futuro

assign SF3 = ~SA3 & ~SA0 & ~ME[1] & ME[0]  + ~SA3 & ~SA0 & ME[1] & ~ME[0]  + SA3 & ~SA2 & SA1 & SSP[1]  + SA3 & ~SA2 & ~SA1 & ~SSP[1]  + SA3 & ~SA2 & SA0 & SSP[0] + SA3 & ~SA2 & ~SA0 & ~SSP[0]
+ SA3 & SA2 & SA1 & ~ME[1] + SA3 & SA2 & SA1 & ~ME[0]  + SA3 & ~SA1 & SA0 & SSP[0] + SA3 & ~SA1 & ~SSP[1] & ~SSP[0] + SA3 & SA2 & ~SA1 & ~SA0 & SSP[1]  + ~SA3 & ~SA2 & ~SA0 & PF[1] & EL & ~LP & ~ME[0]
+ ~SA3 & SA2 & ~SA0 & ~PF[1] & EL & ~LP & ~ME[0] + ~SA3 & ~SA1 & ~SA0 & PF[0] & EL & ~LP & ~ME[0]  + ~SA3 & SA1 & ~SA0 & ~PF[0] & EL & ~LP & ~ME[0] ;

assign SF2 = ~SA3 & SA2 & SA0  + SA2 & ~SA1 & SA0  + SA2 & SA1 & ~ME[1] & ME[0]  + ~SA3 & ~SA0 & ~ME[1] & ME[0]  + SA2 & SA1 & ME[1] & ~ME[0]  + ~SA3 & ~SA0 & ME[1] & ~ME[0]  + SA3 & SA2 & ~SA1 & ~SSP[0]
+ SA3 & ~SA1 & ~SA0 & SSP[1] & SSP[0] + ~SA3 & SA2 & ~EL & ~ME[0] + ~SA3 & SA2 & LP & ~ME[0] + ~SA3 & SA2 & SA1 & PF[0] & ~ME[0] + ~SA3 & SA2 & ~PF[1] & PF[0] & ~ME[0]
+ ~SA3 & SA2 & PF[1] & ~PF[0] & ~ME[0];

assign SF1 = ~SA3 & SA1 & SA0  + SA3 & ~SA2 & SA1 & ~SA0  + ~SA3 & ~SA0 & ~ME[1] & ME[0]  + ~SA3 & ~SA0 & ME[1] & ~ME[0] + SA3 & ~SA2 & ~SA0 & SSP[1] & SSP[0] + SA3 & ~SA2 & SA0 & SSP[1] & ~SSP[0]
+ SA3 & SA2 & ~SA1 & ~SA0 & ~SSP[1] & SSP[0] + SA3 & SA2 & SA1 & ~ME[1] + SA3 & SA2 & SA1 & ~ME[0] + SA1 & ~SA0 & ~EL & ~ME[0]  + SA1 & ~SA0 & LP & ~ME[0]
+ ~SA2 & SA1 & SA0 & SSP[0] + SA2 & SA1 & PF[1] & PF[0] & ~ME[0]  + SA1 & ~SA0 & ~PF[1] & ~PF[0] & ~ME[0] + ~SA3 & ~SA2 & ~SA0 & ~PF[1] & PF[0] & EL & ~LP & ME[0]
+ ~SA3 & SA2 & ~SA0 & ~PF[1] & ~PF[0] & EL & ~LP & ~ME[0];

assign SF0 = ~SA3 & SA0 & LP + ~SA3 & LP & ~ME[0] + SA3 & SA2 & SA1 & ~ME[0] + ~SA3 & ~SA0 & ME[1] & ~ME[0]  + SA3 & ~SA1 & SA0 & ~SSP[1]  + SA3 & ~SA2 & SA0 & SSP[0] + SA3 & ~SA1 & SA0 & SSP[0]
+ SA3 & ~SA2 & SA1 & SA0 & SSP[1]  + ~SA3 & SA1 & ~SA0 & ~PF[0] & EL & ME[0] + ~SA3 & ~SA2 & ~SA0 & PF[1] & ~PF[0] & EL & ~ME[0]  + ~SA3 & SA2 & ~SA0 & ~PF[1] & ~PF[0] & EL & ~ME[0];

assign LCD[1] = SA3 & ~SA2 & ~SA1  + ~SA3 & SA2 & SA0 + ~SA3 & SA2 & ~EL & ~ME[1] & ~ME[0] + ~SA3 & SA2 & LP & ~ME[1] & ~ME[0] + ~SA3 & ~SA0 & PF[1] & EL & ~LP & ~ME[1] & ~ME[0] + SA2 & ~SA1 & SA0;

assign LCD[0] = ~SA3 & SA1 & SA0  + SA3 & ~SA2 & ~SA0 + SA3 & ~SA1 & ~SA0 + ~SA3 & SA1 & ~EL & ~ME[1] & ~ME[0] + ~SA3 & SA1 & LP & ~ME[1] & ~ME[0]
+ ~SA3 & ~SA0 & PF[0] & EL & ~LP & ~ME[1] & ~ME[0] ;

assign LCD2[1] = SA2 & SA1 & ~SA0 & ME[1] & ~ME[0] + SA3 & ~SA2 & SA1 & SA0 & SSP[1]  + SA3 & ~SA2 & SA1 & SA0 & SSP[0] + ~SA3 & SA2 & SA1 & ~SA0 & ~PF[0] & EL & ~LP & ~ME[0]
 + ~SA3 & SA2 & ~SA0 & ~PF[1] & EL & ~LP & ~ME[1] & ~ME[0] + ~SA3 & SA1 & ~SA0 & ~PF[1] & ~PF[0] & EL & ~LP & ~ME[1] & ~ME[0] + SA3 & SA2 & SA1 & ME[1] & ME[0]
 + SA3 & SA2 & ~SA1 & SA0 & ~SSP[1]  + SA3 & SA2 & ~SA1 & SSP[1] & SSP[0] + SA3 & SA2 & ~SA1 & ~SA0 & ~SSP[0];

assign LCD2[0] = SA3 & ~SA2 & ~SA1 & ~SSP[1] + SA3 & ~SA2 & ~SA0 & ~SSP[0] + SA3 & SA2 & SA1 & ME[1] & ~ME[0]  + SA2 & SA1 & ~SA0 & ME[1] & ~ME[0] + SA3 & ~SA2 & SA1 & ~SA0 & SSP[1]
+ SA3 & ~SA2 & ~SA1 & SA0 & SSP[0] + ~SA3 & ~SA2 & ~SA0 & PF[1] & EL & ~LP & ~ME[1] & ~ME[0] + ~SA3 & ~SA2 & ~SA1 & ~SA0 & PF[0] & EL & ~LP & ~ME[1] & ~ME[0]
+ ~SA3 & ~SA1 & ~SA0 & PF[1] & PF[0] & EL & ~LP & ~ME[1] & ~ME[0];

assign Mo[1] = SA3 & ~SA2 & SA1 & SA0 & SSP[1]  + SA3 & SA2 & ~SA1 & ~SA0 & SSP[1]  + SA3 & ~SA2 & SA1 & SA0 & SSP[0] + SA3 & SA2 & ~SA1 & SSP[1] & SSP[0]
+ ~SA3 & SA2 & ~SA0 & ~PF[1] & EL & ~LP & ~ME[1] & ~ME[0] + ~SA3 & SA2 & SA1 & ~SA0 & ~PF[0] & EL & ~LP & ~ME[1] & ~ME[0]
+ ~SA3 & SA1 & ~SA0 & ~PF[1] & ~PF[0] & EL & ~LP & ~ME[1] & ~ME[0] ;

assign Mo[0] = SA3 & ~SA2 & ~SA1 & ~SSP[1] + SA3 & ~SA2 & ~SA0 & ~SSP[0] + SA3 & ~SA2 & SA1 & ~SA0 & SSP[1]  + SA3 & ~SA2 & ~SA1 & SA0 & SSP[0]
+ ~SA3 & ~SA2 & ~SA0 & PF[1] & EL & ~LP & ~ME[1] & ~ME[0] + ~SA3 & ~SA2 & ~SA1 & ~SA0 & PF[0] & EL & ~LP & ~ME[1] & ~ME[0]
+ ~SA3 & ~SA1 & ~SA0 & PF[1] & PF[0] & EL & ~LP & ~ME[1] & ~ME[0];

assign MP = SA3 & ~SA2  + SA3 & ~SA1 + SA3 & ~ME[1] + ~SA0 & ~ME[1] & ME[0]  + ~SA2 & ~SA0 & PF[1] & EL & ~LP & ~ME[1] + SA2 & ~SA0 & ~PF[1] & EL & ~LP & ME[1]
+ ~SA1 & ~SA0 & PF[0] & EL & ~LP & ~ME[1]  + SA1 & ~SA0 & ~PF[0] & EL & ~LP & ~ME[1] ;

assign LED = ~SA3 & SA0 & LP  + ~SA3 & LP & ~ME[1] & ~ME[0];

assign SN = ~SA3 & SA0 & LP  + ~SA3 & LP & ~ME[0] + ~SA3 & ~SA0 & ME[1] & ~ME[0] + SA3 & SA2 & SA1 & ME[1] & ~ME[0];


// conectamos los flip flops
  ffD U0(clk, reset, SF0, SA0);
  ffD U1(clk, reset, SF1, SA1);
  ffD U2(clk, reset, SF2, SA2);
  ffD U3(clk, reset, SF3, SA3);

endmodule
