//bidirectional constraints:

class packet;
  rand bit[15:0]a,b,c,d;
  
  constraint range{b<30;
                   c==b;
                   d<30;
                   c>=25;
                  }
endclass

module m1;
  packet p1;
  initial begin
    p1=new();
    
    for(int i=0;i<5;i++)begin
      if(p1.randomize())
        $display("b=%0d c=%0d d=%0d",p1.b,p1.c,p1.d);
      else 
        $display("randomization is defined");
    end
  end
endmodule 
//output:
// # b=25 c=25 d=13
// # b=25 c=25 d=1
// # b=26 c=26 d=11
// # b=28 c=28 d=21
// # b=25 c=25 d=12

//bidirectional constraints:

class item;
  rand bit[7:0]a,b;
  
  constraint range{a>=2;b<=10;b==a;}
endclass

module m1;
  item i1;
  initial begin
    i1=new();
    for(int i=0;i<5;i++)begin
      if(i1.randomize())
        $display("a=%0d b=%0d",i1.a,i1.b);
      else
        $display("randomization is failed");
    end
  end
endmodule 

//output:
// # a=4 b=4
// # a=5 b=5
// # a=7 b=7
// # a=7 b=7
// # a=10 b=10
