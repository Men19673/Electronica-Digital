module tabla04SOP();

//SOP tabla04SOP

  wire outAN,outBN,outCN,out01,out02,out03,out04,out05,out06,out07,out08,outres;

  reg inA,inB,inC,inD;

  not U1 (outAN, inA);
  not U2 (outBN, inB);
  not U3 (outCN, inC);
  not U3 (outDN, inD);

// Sum of Products
  and U4 (out01,outAN,outBN,outCN,outDN);
  and U5 (out02,outAN,outBN,inC,outDN);
  and U6 (out03,outAN,outBN,inC,inD);
  and U7 (out04,outAN,inB,inC,outDN);
  and U8 (out05,outAN,inB,inC,inD);
  and U9 (out06,inA,outBN,outCN,outDN);
  and U10 (out07,inA,outBN,outCN,inD);
  and U11 (out08,inA,outBN,inC,outDN);

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
      $dumpfile("tabla04SOP_tb.vcd");
      $dumpvars(0,tabla04SOP);
  end

endmodule
