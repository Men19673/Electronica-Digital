//Proyecto de Electronica Digital


//FlipFlop
module ffD(input wire clk, reset, input wire D, output reg Q);

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



//Modulo para FSM
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
