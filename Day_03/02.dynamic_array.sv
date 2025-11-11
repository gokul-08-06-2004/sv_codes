module dynamic_array;
  int arr[][][];
  integer i,j,k;
 
  initial begin
    arr=new[3];
    for(i=0;i<3;i++)begin
       arr[i]=new[4];
      for(j=0;j<4;j++)begin
        arr[i][j]=new[4];
      end
    end
        arr='{'{'{1,2,3,4},'{5,6,7,9},'{10,11,12,13},'{14,15,16,17}},
              '{'{1,2,3,4},'{5,6,7,8},'{10,11,12,13},'{14,15,16,17}},
              '{'{1,2,3,4},'{5,6,7,8},'{10,11,12,13},'{14,15,16,17}}};
        foreach(arr[i,j,k])begin
          $display("arr[%0d][%0d][%0d]=%0d",i,j,k,arr[i][j][k]);
    end
  end
endmodule

module two_dimensional_arry_dynamic;
  int arr[][];
  integer i,j;
  int temp[][];
  initial begin
    arr=new[3];
    for(i=0;i<3;i++)begin
      arr[i]=new[4];
    end
    
    arr='{'{1,2,3,4},'{5,6,7,8},'{9,10,11,12}};
    foreach(arr[i,j])begin
      $display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
    end
  end
endmodule
