class constraint_conflit;
   rand bit[7:0]addr;
   rand bit[7:0]data;
   
   constraint c1{addr inside {[0:5]};
                 data inside {[0:5]};}
   constraint c2{addr inside {[6:10]};
                 data inside {[6:10]};}
 endclass

module m1;
  constraint_conflit s1;
  initial begin
    s1=new();
    
    for(int i=0;i<5;i++)begin
      if(s1.randomize())
        $display("addr=%0d data=%0d",s1.addr,s1.data);
      else
        $display("Randomization fail because conflict occurs addr=%0d data=%0d",s1.addr,s1.data);
    end
  end
endmodule

//# Randomization fail because conflict occurs addr=0 data=0
