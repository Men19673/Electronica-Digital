//Diego A. Méndez
//TestBench Ejercicio5

module testbench();

  reg clk, reset, set;
  reg[3:0] D;
  wire[3:0] Q;

    always
      begin
      #1 clk <= 1; set<=0 ;#1 clk<=0; set<=1;
      end

    ffD U1(clk, reset, set, D, Q);


     initial begin //iniciamos el mux8_1
      $display(" ");
      $display("  ");
      $display(" ");
      $display("CLK | RST | ST | D | Q");
      $display("----------");
      $monitor("%b | %b | %b | %b | %b",clk ,reset, set, D, Q);
           reset<=0;
        #1 D<=000;
        #1 D<=001;
        #1 D<=010;
        #1 D<=011;
        #1 D<=100;
        #1 D<=101;
        #1 D<=110;
        #1 D<=111;
        #1 reset<=1;
        #1 reset<=0;

        end

  initial
  #10 $finish;

  initial begin
    $dumpfile("FFD_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
