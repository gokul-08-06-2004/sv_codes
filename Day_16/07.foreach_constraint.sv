class foreach_constraint;
  rand bit[7:0]arr[2][3];
  constraint arr_range{foreach(arr[i])
    arr[i].sum()with (int'(item))==12;}
endclass

module m1;
  foreach_constraint f1;
  initial begin
    f1=new();
    
    for(int i=0;i<5;i++)begin
    if(f1.randomize())
      $display("arr=%0p",f1.arr);
    else
      $display("randomization is failed");
    end
  end
endmodule


class foreach_constraint;
  rand bit [7:0]arr[2][3][4];
  
  constraint arr_range{foreach (arr[i,j])
    arr[i][j].sum() with (int'(item))==12;}
endclass

module m1;
  foreach_constraint f1;
  initial begin
    f1=new();
    
    for(int i=0;i<6;i++)begin
      if(f1.randomize())
        $display("arr=%0p",f1.arr);
      else
        $display("randomization is failed");
    end
  end
endmodule
