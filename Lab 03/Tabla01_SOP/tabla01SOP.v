module tabla01SOP();

//POS tabla01

  wire outAN,outBN,outCN,out01,out02,out03,out04,out05,outres;

  reg inA,inB,inC;

  not U1 (outAN, inA);
  not U2 (outBN, inB);
  not U3 (outCN, inC);

  and U4 (out01,outAN,outBN,outCN);
  and U5 (out02,outAN,inB,outCN);
  and U6 (out03,inA,outBN,outCN);
  and U7 (out04,inA,outBN,inC);
  and U8 (out05,inA,inB,inC);
  or UR(outres,out01,out02,out03,out04,out05);

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

  initial
    begin
      $dumpfile("tabla01SOP_tb.vcd");
      $dumpvars(0,tabla01SOP);
  end

endmodule
