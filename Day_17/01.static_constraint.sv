//non static constraint:

class non_static_constraint;
  randc bit num;
  rand int  addr;
  rand int data;
  
  constraint range{
    if(num==1)
    {
      addr>0;addr<20;
      data>0;data<20;
    }
      else
      {
        addr>20;addr<30;
        data>20;data<30;
      }
  }
endclass
        
module m1;
  non_static_constraint n1,n2;
  initial begin
    n1=new();
    n2=new();
    n1.range.constraint_mode(0);
    $display("n1 object is:");
    for(int i=0;i<5;i++)begin
      void'(n1.randomize());
      $display(" num=%0d addr=%0d data=%0d",n1.num,n1.addr,n1.data);
    end
    $display("-----------------------------------------------------");
    $display("n2 object is:");
       for(int i=0;i<5;i++)begin
       void'(n2.randomize());
      $display("num=%0d addr=%0d data=%0d",n2.num,n2.addr,n2.data);
       end
  end
endmodule
    
// #  num=1 addr=-554541660 data=-703950114
// #  num=0 addr=-1925058473 data=-1752409002
// #  num=0 addr=1451451332 data=1518089567
// #  num=1 addr=-661323898 data=-4315301
// #  num=1 addr=-628027847 data=1296376467
// # -----------------------------------------------------
// # n2 object is:
// # num=0 addr=26 data=26
// # num=1 addr=2 data=5
// # num=1 addr=8 data=5
// # num=0 addr=23 data=21
// # num=0 addr=26 data=24
    
//static constraint:
    
class static_constraint;
  rand int data;
  rand int addr;
  
  static constraint c1{data inside {[0:20]};
                addr inside {[21:30]};}
endclass
    
module m1;
  static_constraint s1,s2;
  initial begin
    s1=new();
    s2=new();
    
    s1.c1.constraint_mode(0);
    $display("s1 object is:");
    for(int i=0;i<6;i++)begin
      void'(s1.randomize());
      $display("data=%0d addr=%0d",s1.data,s1.addr);
    end
    $display("------------------------------------");
    $display("s2 object is:");
        for(int i=0;i<6;i++)begin
          void'(s2.randomize());
          $display("data=%0d addr=%0d",s2.data,s2.addr);
    end
    //  s1 object is:
// # data=-703950114 addr=-554541660
// # data=-1752409002 addr=-1925058473
// # data=1518089567 addr=1451451332
// # data=-4315301 addr=-661323898
// # data=1296376467 addr=-628027847
// # data=1779763087 addr=810861914
// # ------------------------------------
// # s2 object is:
// # data=-1025893494 addr=554701875
// # data=1797101650 addr=656491699
// # data=723369144 addr=1313927408
// # data=-731019004 addr=-1678233595
// # data=1972555276 addr=951025614
// # data=-1374526355 addr=713954750   
    
    s1.c1.constraint_mode(1);
    $display("s1 object is:");
    for(int i=0;i<6;i++)begin
      void'(s1.randomize());
      $display("data=%0d addr=%0d",s1.data,s1.addr);
    end
    $display("------------------------------------");
    $display("s2 object is:");
        for(int i=0;i<6;i++)begin
          void'(s2.randomize());
          $display("data=%0d addr=%0d",s2.data,s2.addr);
    end
//     # s1 object is:
// # data=14 addr=22
// # data=6 addr=28
// # data=1 addr=21
// # data=18 addr=26
// # data=5 addr=21
// # data=4 addr=26
// # ------------------------------------
// # s2 object is:
// # data=9 addr=30
// # data=3 addr=27
// # data=3 addr=26
// # data=1 addr=22
// # data=6 addr=28
// # data=0 addr=25
  end
endmodule
