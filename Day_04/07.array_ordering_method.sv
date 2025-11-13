module array_ordering_method;
  int arr[6];
  int arr1[$];
  int i;
  initial begin
    i=0;
    while(i<6)begin
      arr[i]=i*5;
      $display("arr[%0d]=%0d",i,arr[i]);
      i=i+1;
    end
    
    $display("arr=%p",arr);
    i=0;
    repeat(6)begin
      arr1[i]=i+1;
      $display("arr1[%0d]=%0d",i,arr1[i]);
      i=i+1;
    end
    
    arr.shuffle();
    $display("arr shuffle =%p",arr);
    arr1.shuffle();
    $display("arr1 shuffle=%p",arr1);
    
    arr.sort();
    $display("arr sort =%p",arr);
    arr1.shuffle();
    $display("arr1 sort =%p",arr1);
    
    arr.rsort();
    $display("arr rsort =%p",arr);
    arr1.rsort();
    $display("arr1 rsort =%p",arr1);
    
    arr.reverse();
    $display("arr reverse=%p",arr);
    arr1.reverse();
    $display("arr1 reverse=%p",arr1);
    
  end
endmodule
