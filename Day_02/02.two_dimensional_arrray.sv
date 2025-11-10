// Code your design here
module two_dimensional_arry;
  integer i,j;
  int arr[2][3]='{'{1,2,3},'{1,2,3}};
  initial begin
    for(i=0;i<2;i++)begin
      for(j=0;j<3;j++)begin
        $display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
      end
    end
  end
endmodule


module two_dimensional;
  integer i,j;
//   int arr[3:0][4:0]='{'{1,2,3,4,5},'{5,6,7,8,9},'{9,10,11,12,10},'{13,14,15,16,3}};
  int arr[3:0][4:0];
  initial begin
    arr[0][0]=0;
    arr[0][1]=1;
    arr[0][2]=2;
    arr[0][3]=3;
    arr[0][4]=4;
    arr[1][0]=5;
    arr[1][1]=2;
    arr[1][2]=2;
    arr[1][3]=3;
    arr[1][4]=4;
    arr[2][0]=9;
    arr[2][1]=1;
    arr[2][2]=2;
    arr[2][3]=3;
    arr[2][4]=4;
    arr[3][0]=9;
    arr[3][1]=1;
    arr[3][2]=2;
    arr[3][3]=3;
    arr[3][4]=4;
    foreach(arr[i,j])begin
       //arr[i][j]=$random;
      $display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
    end
  end
endmodule
