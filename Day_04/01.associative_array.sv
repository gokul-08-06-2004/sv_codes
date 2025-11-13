module associate_array;
  integer i;
  int arr[string]='{"APPLE":10,"ORANGE":20,"MANGO":30,"FRUITS":4};
  int arr1[int]='{1:2,0:2,3:2,5:4,4:8,2:0};
  
  initial begin
    
    $display("arr=%p",arr);
    foreach(arr[i])
      $display("arr[%s]=%0d",i,arr[i]);
    
    $display("arr1=%p",arr1);
    for(i=0;i<$size(arr1);i++)begin
      $display("arr1[%0d]=%0d",i,arr1[i]);
    end 
  end
endmodule
