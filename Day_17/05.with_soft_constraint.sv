//with_soft_constriant:
class without_soft_constrint;
  
  rand bit[7:0]data;
  rand bit[7:0]addr;
  
  constraint c1{soft data<9;soft addr<9;
  }
  
endclass

module m1;
  without_soft_constrint w1;
  bit check;
  initial begin
    w1=new();
    $display("---------------normal randomize constraint-----------");
    for(int i=0;i<5;i++)begin
      if(w1.randomize())
        $display("PASS:data=%0d addr=%0d",w1.data,w1.addr);
      else
        $display("FAIL:randomization is failed data=%0d addr=%0d",w1.data,w1.addr);
    end
    
    $display("----------------inline constraint conflit------------");
    for(int i=0;i<5;i++)begin
      check=w1.randomize() with {data>9;addr>9;};
      if(check)
         $display("PASS:data=%0d addr=%0d",w1.data,w1.addr);
      else
        $display("FAIL:randomization is failed data=%0d addr=%0d",w1.data,w1.addr);
    end
    
    $display("---------------inline constraint without conflit-----");
        for(int i=0;i<5;i++)begin
          check=w1.randomize() with {data==3;addr==4;};
      if(check)
         $display("PASS:data=%0d addr=%0d",w1.data,w1.addr);
      else
        $display("FAIL:randomization is failed data=%0d addr=%0d",w1.data,w1.addr);
    end
    
  end
endmodule

// # ---------------normal randomize constraint-----------
// # PASS:data=0 addr=5
// # PASS:data=1 addr=4
// # PASS:data=0 addr=5
// # PASS:data=6 addr=2
// # PASS:data=2 addr=4

// # ----------------inline constraint conflit------------
// # PASS:data=239 addr=228
// # PASS:data=18 addr=216
// # PASS:data=249 addr=203
// # PASS:data=102 addr=191
// # PASS:data=13 addr=189

// # ---------------inline constraint without conflit-----
// # PASS:data=3 addr=4
// # PASS:data=3 addr=4
// # PASS:data=3 addr=4
// # PASS:data=3 addr=4
// # PASS:data=3 addr=4
