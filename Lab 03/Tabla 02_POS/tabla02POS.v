module tabla02POS();

//SOP tabla02POS

  wire outAN,outBN,outCN,out01,out02,out03,out04,out05,outres;

  reg inA,inB,inC;

  not U1 (outAN, inA);
  not U2 (outBN, inB);
  not U3 (outCN, inC);

//Product of Sums
  or U4 (out01,inA,inB,inC);
  or U5 (out02,inA,outBN,inC);
  or U6 (out03,inA,outBN,outCN);
  or U7 (out04,outAN,inB,inC);
  or U8 (out05,outAN,inB,outCN);
  and UR(outres,out01,out02,out03,out04,out05);

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

//no olvidar el cambio de archivo
  initial
    begin
      $dumpfile("tabla02POS_tb.vcd");
      $dumpvars(0,tabla02POS);
  end

endmodule
