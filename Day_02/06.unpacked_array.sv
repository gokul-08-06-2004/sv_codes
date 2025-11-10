// Code your testbench here
// or browse Examples
module one_dimenional_array;
  integer i;
  logic [15:0]arr[3:0]='{1,2,3,4};
  initial begin
    arr[0]=16'haaaa;
    $display("arr[0]=%h",arr[0]);
    arr[1]=16'haaaa;
    $display("arr[1]=%h",arr[1]);
    arr[2]=16'hbbbb;
    $display("arr[2]=%h",arr[2]);
    arr[3]=16'hdddd;
    $display("arr[3]=%h",arr[3]);
    
//     arr=16'hadcd;
//     $display("arr=%h",arr);
    
// //     for(i=0;i<4;i++)begin
//       $display("arr[%0d]=%0d",i,arr[i]);
//     end
  end
endmodule

module two_dimensional_unpacked;
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


module three_dimensional_unpacked;
  integer i,j,k;
  reg [7:0]arr[3:0][3:0][3:0]='{'{'{1,2,3,4},'{5,6,7,8},'{9,10,11,12},'{13,14,15,16}},
                                '{'{1,2,3,4},'{5,6,7,8},'{9,10,11,12},'{13,14,15,16}},
                                '{'{1,2,3,4},'{5,6,7,8},'{9,10,11,12},'{13,14,15,16}},
                                '{'{1,2,3,4},'{5,6,7,8},'{9,10,11,12},'{13,14,15,16}}};
  initial begin
        $display("arr[0][1][2]=%0h",arr[0][1][2]);
    for(i=0;i<4;i++)begin
      for(j=0;j<4;j++)begin
        for(k=0;k<4;k++)begin
          $display("arr[%0d][%0d][%0d]=%0d",i,j,k,arr[i][j][k]);
        end
      end
    end
  end
    endmodule
