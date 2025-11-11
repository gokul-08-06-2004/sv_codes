module dyanmic_into_queue;
  int arr[];
  int arr1[$];
  int arr2[7:0];
  
  initial begin
    
    arr=new[8];
    arr='{1,3,2,4,5,3,4,3};
    $display("arr=%p",arr);
    $display("arr=%0d",arr.size());
    
    
    arr1=arr;
    $display("arr1=%p",arr1);
    $display("arr1=%0d",arr1.size());
    
    arr1.push_front(3);
    $display("arr1=%p",arr1);
    
    arr2=arr1;
    $display("arr2=%p",arr2);
    
  end
endmodule
