module tabla01();

//POS tabla01

  wire outAN,outBN,outCN,out01,out02,out03, outres;

  reg inA,inB,inC;

  not U1 (outAN, inA);
  not U2 (outBN, inB);
  not U3 (outCN, inC);

  or U4 (outO1,inA,inB,outCN)
  or U5 (out02,inA,outBN,outCN)
  or U6 (out03,outAN,outBN,inC)
  and U4(outres,out01,out02,out03)

  initial begin
    $display("A B C | Y")
    $display("---------")
    $monitor( "%b %b b% | %b", inA, inB, inC, outres)
    A=0; B=0; C=0;
    #1 A=0; B=0; C=1;
    #1 A=0; B=1; C=0;
    #1 A=0; B=1; C=1;
    #1 A=1; B=0; C=0;
    #1 A=1; B=0; C=1;
    #1 A=1; B=1; C=0;
    #1 A=1; B=1; C=1;
    #1 $finish;
  end

  initial
    begin
      $dumpfile("tabla01POS_tb.v");
      $dumpvars(0, tabla01POS);
    end

endmodule
