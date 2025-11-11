module dynamic_array_method;
  integer i;
  int arr[];
  int arr1[];
  
  initial begin
    arr=new[5];
    arr='{12,23,34,45,56};
    foreach(arr[i])begin
      arr[i]=arr[i]+2;
      $display("arr[%0d]=%0d",i,arr[i]);
    end
     $display("size_of_arr=%0d",$size(arr));
    
    
    arr1=new[6];
    for(i=0;i<$size(arr1);i++)begin
      arr1[i]=i;
      $display("arr[%0d]=%0d",i,arr1[i]);
    end
    $display("size_of_aar1=%0d",$size(arr1));
    
      arr.sort();
    $display("sort_of_arr=%p",arr);
    
    arr.rsort();
    $display("rsort_of_arr=%p",arr);
    
    arr.reverse();
    $display("reverse_of_arr=%p",arr);
    
    arr.shuffle();
    $display("shuffle_of_arr=%p",arr);
    $display("size_of_arr=%0d",arr.size());
    arr.delete();
    $display("delete_the_arr=%0d",arr.size());
    
  
    end
    endmodule
