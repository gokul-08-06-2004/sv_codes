// Code your design here
module one_dimensional_array;
//  shortint arr[0:2]='{1,2,3};
  //shortint arr[3];
  byte arr[3];
  initial begin
    arr[0]=5;
    arr[1]=127;
    arr[2]=3;
    foreach(arr[i])begin
      $display("arr[%0d]=%0d",i,arr[i]);
    end
  end
    endmodule



module one_dimenional_array;
  integer i;
  logic [15:0]arr[3:0];
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
//     $display("arr=%h",arr);Cannot assign a packed type 'bit[15:0]' to an unpacked type 'reg[15:0] $[3:0]'
    
//     for(i=0;i<4;i++)begin
//       $display("arr[%0d]=%0d",i,arr[i]);
//     end
  end
endmodule


