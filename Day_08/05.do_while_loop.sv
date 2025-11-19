module do_while_loop;
  int arr[10];
  int i=0;
  initial begin
    
    do begin
      $display("a[%0d]=%0d",i,arr[i]);
      i++;
      arr[i]=i*2;
    end
    while(i<$size(arr));
    
    $display("arr=%p",arr);
  end
endmodule
