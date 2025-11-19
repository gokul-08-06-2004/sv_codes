module for_loop;
  
  int a[10];
  int i,j;
  initial begin
    
    for(int i=0;i<10;i++)begin
      a[i]=i*i;
      $display("a[%0d]=%0d",i,a[i]);
    end
    $display("\n");
    
    for(i=1;i<=$size(a);i++)begin//size of a
      a[i]=i+2*2;
      $display("a[%0d]=%0d",i,a[i]);
    end
    $display("\n");
    
    for(i=0;i<5;i++)begin//nested for loop
      $display("i=%0d",i);
      for(j=0;j<5;j++)begin
        a[j]=j+1;
        $display("a[%0d]=%0d",j,a[j]);
      end
      end
    
  end
    endmodule

//foreach loop

module foreach_loop;
  
  int a[10:0];
  int arr[10];// int arr[0:9];// both same
  initial begin
    
    foreach(a[i])begin
      a[i]=i*i;
    end
    
    foreach(a[i])begin
      $display("a[%0d]=%0d",i,a[i]);
    end
    
    $display("a=%p",a);
//     a[10]=100
// # a[9]=81
// # a[8]=64
// # a[7]=49
// # a[6]=36
// # a[5]=25
// # a[4]=16
// # a[3]=9
// # a[2]=4
// # a[1]=1
// # a[0]=0
// # a='{100, 81, 64, 49, 36, 25, 16, 9, 4, 1, 0}
    
 
    foreach(arr[i])begin
      arr[i]=i*i;
    end
    foreach(arr[i])begin
      $display("a[%0d]=%0d",i,arr[i]);
    end  
    $display("arr=%p",arr);
  
  end
endmodule
