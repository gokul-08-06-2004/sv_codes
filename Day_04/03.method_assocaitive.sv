module method_associate;
  int arr[int]='{0:1,3:4,1:2,2:3};
  int index;
  
  initial begin 
    $display("arr=%p",arr);
    
    $display("arr size is %0d and arr  num is %0d",arr.size(),arr.num());
    
    if(arr.exists(3))
      $display("arr index is exists number is 3");
    else 
      $display("arr index is not exiss numbber is 3");
    
    if(arr.exists(4))
      $display("arr index is exists number is 4");
    else 
      $display("arr index is not exists number is 4");
    
    arr.first(index);
    $display("arr=%0d",index);
    
    arr.last(index);
    $display("arr=%0d",index);
    
    arr.prev(index);
    $display("arr=%0d",index);
    index=0;
    arr.next(index);
    $display("arr=%0d",index);
    
    arr.delete(3);
    $display("arr=%p",arr);

  end
endmodule
