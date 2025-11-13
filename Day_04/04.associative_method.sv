module associate_arry_method_2;
  integer i;
  int arr[*];
  int arr1;
  
  initial begin
//     arr='{0:100,3:300,5:500,2:200,4:400,6:600,7:700,1:100};
//     for(i=0;i<30;i++)begin
//       arr[i]=i*5;
//       $display("arr[%0d]=%0d",i,arr[i]);
//     end
    arr1=1;
    repeat(8)begin
      arr[arr1]=arr1*5;
      $display("arr1[%0d]=%0d",arr1,arr[arr1]);
       arr1=arr1<<1;
    end
    
    
    $display("arr=%p",arr);
    $display("size of arr is %0d",$size(arr));
    $display("\n");
    for(i=0;i<$size(arr);i++)
      $display("arr[%0d]=%0d",i,arr[i]);
    
    $display("arr=%p",arr);
    if(arr.exists(4))
      $display("the exists value is 4");
    else 
      $display("the exists value is not 4");
    
    $display("arr=%p",arr);
    
    if(arr.exists(10))
      $display("the exists value is 10");
    else 
      $display("the exists value is not 10");
    
    arr.first(arr1);
    $display("the first index of arr is %0d",arr1);
    
    arr.last(arr1);
    $display("the last index of arr is %0d",arr1);
    
    arr.prev(arr1);
    $display("the prev index of arr is %0d",arr1);
    
    arr1=2;
    arr.next(arr1);
    $display("the next value of arr is %0d",arr1);
    
    arr.delete(4);
    $display("arr=%p",arr);
    
    arr.delete();
    $display("arr=%p",arr);
    
  end
endmodule
