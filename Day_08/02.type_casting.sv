module type_casting_example;
  string  name;
  int a[3];real d[3];
  real b;
  longint c;
int e;
  real f;
  initial begin
    name="A";
    b=3.14;
    a[0]=int'(name);  
    $display("a[0]=%0d",a[0]);
    a[1]=int'(b);
    $display("a[1]=%0d",a[1]);
    a[1]=a[0]+int'(b);
    a[2]=int'((a[0]==65)?a[1]:0);
    $display("a[2]=%0d",a[2]);
    $display("b=%0d",b);
    
    c=longint'(a[0]);
    $display("c=%0d",c);
    
    name=string'(a[2]);
    $display("name=%s",name);
    
    name=string'(c);
    $display("name=%s",name);
  
    //name={string'(a[2])+string'(a[2])};concatenation string is not allowed type csasting

    c=longint'(b)+longint'(a[1]);
    $display("c=%0d",c);
    
    c=23+longint'(b);
    $display("c=%0d",c);
    
    b=2.34+real'(c);
    $display("b=%f",b);
    
    b=real'(c);
    $display("b=%f",b);
    
    c=longint'(b);
    $display("c=%0d",c);
    // arithemetic expression
    a[0]=int'(6+int'(b));
    $display("a[0]=%0d",a[0]);
    
    a[0]=65;a[1]=4;
    name=string'(a[0]+a[1]);
    $display("name=%s",name);
    
    e=65;f=2.44;
    name=string'(e+int'(f));
    $display("name=%s",name);
    // compare
    c=23;
    a[1]=int'((a[0]>c)?e+2:e-2);
    $display("a[1]=%0d",a[1]);
    c=20;
    e=int'(c>>2);
    $display("c=%0d",e);
    
    d='{1.22,2.66,3.77};
    for(int i=0;i<3;i++)begin
      a[i]=int'(d[i]);
      $display("a[%0d]=%0d",i,a[i]);
    end
    
    
  end
endmodule
