module four_dimensional_array;
  integer i,j,k,l;
  logic [31:0]arr [2][2][2][2]='{'{'{'{1,2},'{3,4}},'{'{5,6},'{7,8}}},
                                 '{'{'{9,10},'{11,12}},'{'{13,14},'{15,16}}}};
  
  initial begin
    for(i=0;i<2;i++)begin
      for(j=0;j<2;j++)begin
        for(k=0;k<2;k++)begin
          for(l=0;l<2;l++)begin
            $display("arr[%0d][%0d][%0d][%0d]=%0d",i,j,k,l,arr[i][j][k][l]);
          end
        end
      end
    end
  end
initial begin
  foreach(arr[i,j,k,l])begin
      $display("arr[%0d][%0d][%0d][%0d]=%0d",i,j,k,l,arr[i][j][k][l]);
  end
end
endmodule
