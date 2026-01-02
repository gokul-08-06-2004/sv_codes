//dynamic array:

class Class1;
  rand bit[7:0]arr[];

  constraint range_size{
    arr.size()>2;arr.size()<9;
  }
extern constraint range_value;
endclass

constraint Class1::range_value{
  arr.sum() with (int'(item)) ==13;
}

module m1;
  Class1 c1;
  initial begin
    c1=new();
    for(int i=0;i<5;i++)begin
    if(c1.randomize())
      $display("iteraation %0d arr=%0p",i,c1.arr);
    else
      $display("randomization is failed");
    end
  end
endmodule

// Code your testbench here
// or browse Examples
//dynamic array:

class Class1;
  rand bit[7:0]arr[];

  constraint range_size{
    arr.size()>2;arr.size()<9;
  }
extern constraint range_value;
endclass

constraint Class1::range_value{
  arr.sum() with (int'(item)) ==13;
}

module m1;
  Class1 c1;
  initial begin
    c1=new();
    for(int i=0;i<5;i++)begin
    if(c1.randomize())
      $display("iteraation %0d arr=%0p",i,c1.arr);
    else
      $display("randomization is failed");
    end
  end
endmodule


class class2;
  rand bit[7:0]arr[][];
  int i,j;
  constraint range_size{arr.size()>2;arr.size()<9;}
  constraint range_size1{foreach(arr[i])
    arr[i].size() inside {[3:9]};}
  constraint range_value{foreach(arr[i])
    arr[i].sum()with (int'(item)) ==12;}
endclass


module m1;
  class2 c1;
  initial begin
    c1=new();
    for(int i=0;i<5;i++)begin
    if(c1.randomize())
      $display("arr=%0p",c1.arr);
    else 
      $display("randomization is failed");
    end
  end
endmodule
