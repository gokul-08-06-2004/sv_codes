module size_casting;
  
  int a;
  byte b;
  longint c;
  shortint d;
  bit e;
    logic [3:0]p,q,r,sum;
    bit carry;
  initial begin
    a=20;
    b=10;
    c=400;
    d=30;
 
    a=32'(b);
    $display("a=%b ,size_of_a is %0d bit",a,$size(a));
    
    b=8'(a);
    $display("b=%b",b);
    
    a=a+32'(b);
    $display("a=%b",a);
    
    d=16'(a)+16'(b+c);
    $display("d=%b",d);
   
    p=10;q=10;
    {carry,sum}=5'(p+q);
    $display("sum=%b carry=%b size of sum,carry is %0d",sum,carry,$size({carry,sum}));
    
    
  end
endmodule
