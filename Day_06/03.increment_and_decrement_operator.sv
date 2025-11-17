module increment_decrement;
  
  int a,b,c;
  
  initial begin
    
    a=10;
    b=a++;
    $display("a=%0d b=%0d",a,b);
    
    b=++a;
    $display("a=%0d b=%0d",a,b);
    
    a=b--;
    $display("a=%0d b=%0d",a,b);
    
    a=--b;
    $display("a=%0d b=%0d",a,b);
    
    c=b++ + ++b;
    $display("c=%0d",c);
    
    $display("a=%0d b=%0d c=%0d",a,b,c);
    
    c=++b + ++b;
    $display("c=%0d b=%0d",c,b);
    
    a=b-- + b--;
    $display("a=%0d b=%0d",a,b);
    
    a=--b + --b;
    $display("a=%0d b=%0d ",a,b);
    
    c=a-- + --a;
    $display("c=%0d a=%0d",c,a);
    
    b=b++ + b++;
    $display("b=%0d",b);
 
  end
endmodule
