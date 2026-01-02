//Queue 

class queue;
  
  rand bit[7:0]arr[$];
  int i;
  constraint range{arr.size()>2;arr.size()<5;}
  //constraint range_value{arr.sum() with (int'(item)) ==20;}
  constraint range_value{foreach(arr[i])
    arr[i]==i*i;}
  
endclass

module m1;
  queue q1;
  int i;
  initial begin
    q1=new();
    i=0;
    repeat(4)begin 
      if(q1.randomize())begin
      $display("iteration %0d arr=%0p",i,q1.arr);
      i++;
      end
    else
      $display("randomization is failed");
    end
  end
endmodule
