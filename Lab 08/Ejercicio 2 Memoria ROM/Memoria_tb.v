module testbench();

  reg[11:0] address;
  wire[7:0] data;

//No necesita de un clock
//Llamamos al modulo de memoria
      memoria U1(address, data);


      initial begin //iniciamos el display
            #1
            $display(" ");
            $display("  ");
            $display(" ");
            $display("|  ADDRESS  |   DATA    | ");
            $display("----------------------------");
            $monitor("| %b | %b | ", address, data);
              address=12'b000000000000;
           #1 address=12'b000000000001;
           #1 address=12'b000000000010;
           #1 address=12'b000000000011;
           #1 address=12'b000000000100;
           #1 address=12'b000000000101;
           #1 address=12'b000000000110;
           #1 address=12'b000000000111;
           #1 address=12'b000000001000;
           #1 address=12'b000000001001;
           #1 address=12'b000000001010;

          end

        initial
        #50 $finish;

        initial begin
          $dumpfile("Memoria_tb.vcd");
          $dumpvars(0, testbench);
        end

      endmodule
