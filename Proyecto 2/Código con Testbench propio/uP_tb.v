module testbench();

    reg clock, reset;
    reg [3:0] pushbuttons;
    wire phase, c_flag, z_flag;
    wire [3:0] instr, oprnd, accu, data_bus, FF_out;
    wire [7:0] program_byte;
    wire [11:0] PC, address_RAM;

     uP uPmod(clock, reset, pushbuttons, phase, c_flag, z_flag, instr, oprnd, data_bus, FF_out, accu, program_byte, PC, address_RAM);

     initial
         #500 $finish;

     always
         #5 clock = ~clock;

         initial begin
             clock = 0; reset = 0;
             #2 reset = 1;
             #1 reset = 0;
             $display("\n");
             $display("Observar los datos en GTKWave");
             $display("\n");

             pushbuttons = 4'b0010;
        end
     initial begin
         $dumpfile("uP_tb.vcd");
         $dumpvars(0, testbench);
     end

endmodule
