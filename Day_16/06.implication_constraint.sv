//implication  operator:
class implication_operator;
 randc bit data;
  rand bit[7:0]src;
  rand bit[7:0]dst;
  rand int num;
  
  constraint range{(data==1)->src<9;  (data==0)->src>9;src<20;}
  extern constraint range2;
endclass

constraint implication_operator::range2{}

module m1;
  implication_operator i1;
  initial begin
    i1=new();
    
    for(int i=0;i<7;i++)begin
      if(i1.randomize())
        $display("data=%0d src=%0d",i1.data,i1.src);
      else 
        $display("randomization is failed");
    end
    
    
  end
endmodule

//output:
// # data=0 src=12
// # data=1 src=3
// # data=1 src=7
// # data=0 src=11
// # data=1 src=8
// # data=0 src=12
// # data=1 src=2

class string_randomize;
  
 rand string name;
  
  constraint range{name inside{[A:Z]};}
endclass

module m1;
  string_randomize s1;
  initial begin
    s1=new();
    for(int i=0;i<6;i++)begin
      if(s1.randomize())
        $display("name=%s",s1.name);
      else
        $display("randomize is failed");
    end
  end
endmodule
