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
