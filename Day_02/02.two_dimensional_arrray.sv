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


