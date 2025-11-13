// Code your testbench here
// or browse Examples
module arry_element_locator_method;
  integer i;
  int all[$];
  int arr[$];
  int arr1[];
  int arr2[7:0];
  
  initial begin
       
    for(i=0;i<10;i++)begin
      if(i%2==0)
        arr.push_back(i);
        else 
          arr.push_back(i);
      end
    
    foreach(arr[i])
      $display("arr[%0d]=%0d",i,arr[i]);
    $display("arr=%p",arr);
    
    arr1=arr;
    arr1.reverse();
    $display("arr1 or reverse=%p",arr1);
    
    arr2={3,2,4,5,6,7,1,7};
    
    all=arr.find with(item>3);
    $display("arr of find=%p",all);
    
    all=arr1.find with (item<3);
    $display("arr of find=%p",all);
    
    all=arr.find_first with(item>2&item<=8 );
    $display("arr of find first=%p",all);
    
    all=arr.find_last with(item<=8);
    $display("arr of find last=%p",all);
    
    all=arr.unique();
    $display("arr of unique=%p",all);
    
    all=arr.max ();
    $display("arr of max=%p",all);
    
    all=arr.min();
    $display("arr of min=%p",all);
    
    arr.rsort();
    $display("arr=%p",arr);
    
    
    
  end
  
endmodule
