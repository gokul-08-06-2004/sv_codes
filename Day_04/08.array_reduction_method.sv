module array_reduction_method;
  int arr[$];
  int src;
  int i;
  initial begin
    
     for(i=0;i<4;i++)begin
       arr[i]={2{i[1:0]}};
      $display("arr[%0d]=%0d",i,arr[i]);
    end
    
    $display("arr=%p",arr);
    $display("arr=%0d",arr.and());
    $display("arr=%0d",arr.or());
    $display("arr=%0d",arr.xor());
    $display("arr=%0d",arr.sum());
    $display("arr=%0d",arr.product());
    
    src=arr.sum() with(item*5);
    $display("arr=%0d",src);
    
    src=arr.product() with(item*5);
    $display("arr=%0d",src);
    
    
  end
endmodule
