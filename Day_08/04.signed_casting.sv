module signed_cast;
  
  bit [3:0] a;
 int b;
  initial begin
    
    a=4'b1111;
    b=10;
   
    b=4'(a);
    $display("b=%0d",b);
    
    b=signed'(a);
    $display("b=%0d",b);
    
    b=unsigned'(a);
    $display("b=%0d",b);
    
    a=-1;
    b=signed'(a);
    $display("b=%0d",b);
    b=unsigned'(a);
    $display("b=%0d",b);
    
    
  end
endmodule
