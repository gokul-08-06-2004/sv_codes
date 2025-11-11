module copy_dynamic_to_fixed;// copy the size and elements array must have same datatype and size
  logic [7:0]arr[];
  logic [7:0]arr1[];
  logic [7:0]arr2[0:3];
  
  initial begin
    arr=new[4];  
    arr='{1,2,3,4};  //initial value to arr
    foreach(arr[i])begin
      $display("arr[%0d]=%0d",i,arr[i]);
    end
    
    arr1=arr;
    arr1=new[arr.size()](arr);// get the size of arr to arr1
    foreach(arr1[i])begin
      arr1[i]=arr1[i]*i;
      $display("size_of_arr1=%0d,arr1[%0d]=%0d",$size(arr),i,arr1[i]);
    end
    
    arr2=arr1;
    foreach(arr2[i])begin
      $display("size_of_arr2=%0d,arr2[%0d]=%0d",$size(arr2),i,arr2[i]);
    end
  end
endmodule
