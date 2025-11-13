module associative;
  typedef enum {APPLE,MANGO,BANANA,ORANGE}t_type;
  int arr[t_type];
  int arr1[int];
  
  initial begin
    arr[APPLE]=10;
    arr[MANGO]=23;
    arr[BANANA]=30;
    arr[ORANGE]=40;
    $display("arr=%p",arr);
    foreach(arr[i])begin
      $display("arr[%0d]=%0d",i,arr[i]);
    end
    $display("size_of_t_type=%0d",arr.size());
    
    arr1[3]=1;
    arr1[1]=2;
    arr1[0]=3;
    arr1[2]=4;
   
    $display("arr1=%p",arr1);
    foreach(arr1[i])begin
      $display("arr1[%0d]=%0d",i,arr1[i]);
    end
    $display("size_of_arrr1=%0d",arr1.size());
  end
endmodule
