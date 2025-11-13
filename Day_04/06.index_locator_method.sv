module index_locator_array;
  int i,j,k;
  bit [7:0]arr[$];
  bit [7:0]arr1[];
  bit [7:0]arr2[7:0];
  int src[$];
  
                    
   initial begin
     
     arr2='{3,28,39,45,23,1,2,2};
     $display("arr2=%p",arr2);
     
     arr1=arr2;
     $display("arr1=%p",arr1);
     arr1.reverse();
     $display("arr1=%p",arr1);
     i=0;
     while(i<10)begin
       arr[i]=i*3+2;
       $display("arr[%0d]=%0d",i,arr[i]);
        i=i+1;
     end
     $display("arr=%p",arr);
     src=arr.find_index with (item>2);
     $display("arr of find index=%p",src);
     
     src=arr.find_first_index with (item>3);
     $display("arr of first index =%p",src);
     
     src=arr.find_last_index with (item>5);
     $display("arr of last index=%p",src);

     src=(arr.unique_index with (item<5));
     $display("arr unipue index=%p",src);
          
   end
endmodule
