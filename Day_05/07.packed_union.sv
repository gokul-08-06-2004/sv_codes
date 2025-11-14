module packed_union;
  int i,j,k;
  int x;
  typedef union packed{
    logic [7:0]id;
    bit[7:0]std;
    logic [7:0]address;
  }bio;
  
  bio b[3];
  
  initial begin
    
    for(i=0;i<3;i++)begin
      b[i].id=i*30;
      $display("id[%0d]=%0d",i,b[i].id);
      for(j=i;j<=i;j++)begin
        b[j].std=j*40;
        $display("std[%0d]=%0d",j,b[j].std);
        for(k=j;k<=j;k++)begin
          b[k].address=k*50;
          $display("address[%0d]=%0d \n",k,b[k].address);
        end
      end
    end
    $display("bio=%p",b);
  end
endmodule
