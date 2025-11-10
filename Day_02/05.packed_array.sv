module packed_array;
  logic [3:0]arr=13;
  initial begin
      $display("arr=%0d",arr);
  end
endmodule

module packed_array
  bit [3:0][4:0]arr='{3,4,5,21};
 initial begin
   foreach(arr[i])begin
     $display("arr[%0d]=%0d",i,arr[i]);
   end
 end
endmodule

module packed_array;
  integer i,j;
  bit [0:3][0:2][0:3]arr='{'{1,2,3},'{1,2,3},'{1,2,3},'{1,2,3}};
  initial begin
//     foreach(arr[i,j])begin
//       $display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
    for(i=0;i<4;i++)begin
      for(j=0;j<3;j++)begin
        $display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
      end
    end
  end
endmodule
