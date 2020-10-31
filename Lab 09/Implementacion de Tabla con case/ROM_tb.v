//Diego A. Mendez
//Tabla
module testbench();

  reg[6:0] address;
  wire[12:0] data;

//No necesita de un clock
//Llamamos al modulo de memoria
      ops U1(address, data);


      initial begin //iniciamos el display
            #1
            $display(" ");
            $display("  ");
            $display(" ");
            $display("|  ADDRESS  |   DATA    | ");
            $display("----------------------------");
            $monitor("| %b | %b | ", address, data);

                    address=7'b0000000;
                  #1address=7'b1000000;
                  #1address=7'b0000101;
                  #1address=7'b0000111;
                  #1address=7'b0000001;
                  #1address=7'b0000011;
                  #1address=7'b0001101;
                  #1address=7'b0001001;
                  #1address=7'b0001101;
                  #1address=7'b0010001;
                  #1address=7'b0011001;
                  #1address=7'b0100001;
                  #1address=7'b0100011;
                  #1address=7'b0101001;
                  #1address=7'b0110001;
                  #1address=7'b0111001;
                  #1address=7'b1000011;
                  #1address=7'b1000001;
                  #1address=7'b1001011;
                  #1address=7'b1001001;
                  #1address=7'b1010001;
                  #1address=7'b1011001;
                  #1address=7'b1100001;
                  #1address=7'b1101001;
                  #1address=7'b1110001;
                  #1address=7'b1111001;

          end

        initial
        #50 $finish;

        initial begin
          $dumpfile("ROM_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
