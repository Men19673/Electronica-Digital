module tabla03POS();

//SOP tabla03POS

  wire outAN,outBN,outCN,out01,out02,out03,out04,out05,out06,out07,out08,outres;

  reg inA,inB,inC,inD;

  not U1 (outAN, inA);
  not U2 (outBN, inB);
  not U3 (outCN, inC);
  not U3 (outDN, inD);

// Products of sum
  or U4 (out01,inA,outBN,inC,inD);
  or U5 (out02,inA,outBN,inC,outD);
  or U6 (out03,inA,outBN,outC,inD);
  or U7 (out04,inA,outBN,outC,outD);
  or U8 (out05,outAN,inB,inC,outDN);
  or U9 (out06,outAN,inB,outCN,outDN);
  or U10 (out07,outAN,outBN,inC,inD);
  or U11 (out08,outAN,outBN,inC,outDN);
  or U11 (out09,outAN,outBN,outCN,outDN);

  or UR(outres,out01,out02,out03,out04,out05,out06,out07,out08,out09);

  initial begin

    $display("A B C D| Y");
    $display("----------");
    $monitor("%b %b %b %b %b",inA,inB,inC,inD,outres);
       inA=0; inB=0; inC=0; inD=0;
    #1 inA=0; inB=0; inC=0; inD=1;
    #1 inA=0; inB=0; inC=1; inD=0;
    #1 inA=0; inB=0; inC=1; inD=1;
    #1 inA=0; inB=1; inC=0; inD=0;
    #1 inA=0; inB=1; inC=0; inD=1;
    #1 inA=0; inB=1; inC=1; inD=0;
    #1 inA=0; inB=1; inC=1; inD=1;
    #1 inA=1; inB=0; inC=0; inD=0;
    #1 inA=1; inB=0; inC=0; inD=1;
    #1 inA=1; inB=0; inC=1; inD=0;
    #1 inA=1; inB=0; inC=1; inD=1;
    #1 inA=1; inB=1; inC=0; inD=0;
    #1 inA=1; inB=1; inC=0; inD=1;
    #1 inA=1; inB=1; inC=1; inD=0;
    #1 inA=1; inB=1; inC=1; inD=1;



    $finish;
  end

//no olvidar el cambio de archivo
  initial
    begin
      $dumpfile("tabla03POS_tb.vcd");
      $dumpvars(0,tabla03POS);
  end

endmodule
