module tabla02SOP();

//SOP tabla02

  wire outAN,outBN,outCN,out01,out02,out03,out04,outres;

  reg inA,inB,inC;

  not U1 (outAN, inA);
  not U2 (outBN, inB);
  not U3 (outCN, inC);

  and U4 (out01,outAN,outBN,inC);
  and U5 (out02,inA,inB,outCN);
  and U6 (out03,inA,inB,inC);
  or U4(outres,out01,out02,out03);

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
      $dumpfile("tabla02SOP_tb.vcd");
      $dumpvars(0,tabla02SOP);
  end

endmodule
