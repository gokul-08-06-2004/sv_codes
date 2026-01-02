//:/ dist_operator:

class divide_dist_operator;
  rand bit[7:0]src;
  rand bit[7:0]data;
  rand bit[7:0]dst;
  
  constraint range{src dist{2:/10,[3:6]:/50,7:/40};data dist{3:/50,12:/20,[13:15]:/30};}
  
  constraint range2{dst dist {3:/30,4:/40,[5:9]:/70};}
endclass

module m1;
  divide_dist_operator d1;
  initial begin
    d1=new();
    
    for(int i=0;i<10;i++)begin
      if(d1.randomize())
        $display("src[%0d]=%0d data[%0d]=%0d dst[%0d]=%0d",i,d1.src,i,d1.data,i,d1.dst);
      else
        $display("randomization is failed");
    end
  end
endmodule 

//ouptut:
// # src[0]=4 data[0]=3 dst[0]=4
// # src[1]=3 data[1]=12 dst[1]=8
// # src[2]=6 data[2]=3 dst[2]=4
// # src[3]=7 data[3]=3 dst[3]=7
// # src[4]=3 data[4]=3 dst[4]=3
// # src[5]=7 data[5]=13 dst[5]=8
// # src[6]=3 data[6]=3 dst[6]=8
// # src[7]=7 data[7]=12 dst[7]=4
// # src[8]=2 data[8]=13 dst[8]=8
// # src[9]=7 data[9]=3 dst[9]=5

//x is 100, 101, 102 (each weight = 1)
class Class1;
  rand bit[15:0]x;
  rand bit[15:0]y;
  
  constraint range{x dist{[100:102]:/3,200:=2,300:=1};y dist {[100:102]:=1,200:/2,300:/5};}
  
endclass

module m1;
  Class1 c1;
  initial begin
    c1=new();
    for(int i=0;i<10;i++)begin
      if(c1.randomize())
        $display("x[%0d]=%0d y[%0d]=%0d",i,c1.x,i,c1.y);
      else
        $display("randomization is failed");
    end
  end
endmodule 
  
// # x[0]=102 y[0]=101
// # x[1]=101 y[1]=300
// # x[2]=300 y[2]=102
// # x[3]=102 y[3]=101
// # x[4]=300 y[4]=300
// # x[5]=102 y[5]=300
// # x[6]=300 y[6]=100
// # x[7]=200 y[7]=300
// # x[8]=101 y[8]=200
// # x[9]=200 y[9]=101
