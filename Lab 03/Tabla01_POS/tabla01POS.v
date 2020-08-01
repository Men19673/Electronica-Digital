module tabla01POS();

//POS tabla01

  wire outAN,outBN,outCN,out01,out02,out03,outres;

  reg inA,inB,inC;

  not U1 (outAN, inA);
  not U2 (outBN, inB);
  not U3 (outCN, inC);

  or U4 (out01,inA,inB,outCN);
  or U5 (out02,inA,outBN,outCN);
  or U6 (out03,outAN,outBN,inC);
  and U4(outres,out01,out02,out03);

  initial begin

    $display("A B C | Y");
    $display("---------");
    $monitor("%b %b %b %b",inA,inB,inC,outres);
       inA=0; inB=0; inC=0;
    #1 inA=0; inB=0; inC=1;
    #1 inA=0; inB=1; inC=0;
    #1 inA=0; inB=1; inC=1;
    #1 inA=1; inB=0; inC=0;
    #1 inA=1; inB=0; inC=1;
    #1 inA=1; inB=1; inC=0;
    #1 inA=1; inB=1; inC=1;
    $finish;
  end

// no olvidar cambiar el dump
  initial
    begin
      $dumpfile("tabla01POS_tb.vcd");
      $dumpvars(0,tabla01POS);
  end

endmodule
