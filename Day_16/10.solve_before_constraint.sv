
//without solve before constraint:

class without_solve_before;
  
  rand bit data;
  rand bit[3:0]num;
  
  constraint val{
    if(data==1)
      num inside{[0:5]};
  }
endclass

module m1;
  without_solve_before w1;
  initial begin
    
    w1=new();
    
    for(int i=0;i<10;i++)begin
      if(w1.randomize())
        $display("data=%0d num=%0d",w1.data,w1.num);
      else
        $display("randomization is failed");
    end
  end
endmodule

// # data=0 num=3
// # data=1 num=5
// # data=0 num=7
// # data=0 num=7
// # data=0 num=4
// # data=0 num=15
// # data=0 num=10
// # data=1 num=4
// # data=0 num=12
// # data=0 num=14

class with_solve_before;
  rand bit data;
  rand bit[3:0]addr;
  
  constraint range{if(data==1)
    addr inside {[0:5]};
    solve data before addr;}
endclass

module m1;
  with_solve_before w1;
  initial begin
    w1=new();
    
    repeat(10)begin
      void'(w1.randomize());
      $display("data=%0d addr=%0d",w1.data,w1.addr);
    end
  end
endmodule

//  data=0 addr=12
// # data=1 addr=5
// # data=0 addr=6
// # data=1 addr=2
// # data=0 addr=11
// # data=0 addr=14
// # data=1 addr=1
// # data=0 addr=9
// # data=0 addr=14
// # data=0 addr=2
