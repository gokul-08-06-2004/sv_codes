// module three_dimensional_array;
//   integer i,j,k;
//   bit [3:0]arr[0:1][0:2][0:3]='{'{'{1,2,3,4},'{5,6,7,8},'{9,10,11,12}},
//                                 '{'{1,2,3,4},'{5,6,7,8},'{9,10,11,12}}};
  
//   initial begin
//     for(i=0;i<2;i++)begin
//       for(j=0;j<3;j++)begin
//         for(k=0;k<4;k++)begin
//           $display("arr[%0d][%0d][%0d]=%0d",i,j,k,arr[i][j][k]);
//         end
//       end
//     end
//   end
// endmodule

module three_dimensional_array;

  int arr[3][3][4]='{'{'{1,2,3,4},'{5,6,7,8},'{9,10,11,12}},
                     '{'{13,14,15,16},'{17,18,19,20},'{21,22,23,24}},
                     '{'{25,26,27,28},'{29,30,31,32},'{33,34,35,36}}};
     initial begin
       foreach(arr[i,j,k])begin
          $display("arr[%0d][%0d][%0d]=%0d",i,j,k,arr[i][j][k]);
        end
  end
endmodule



// Code your testbench here
// or browse Examples
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
