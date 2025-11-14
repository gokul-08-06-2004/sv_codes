module string_type;
  int i;
  bit[11:0]name;
  string a="hellow";
  string b;
  string c="gokul";
  
  initial begin
    name='ha12;
    $display("name=%h",name);
    $display("name=%s",a);
//     b=a;
//     $display("name=%s",b);
    
    foreach(a[i])begin
      $display("name[%0d]=%s",i,a[i]);
    end
    $display("\n");
    for(i=0;i<5;i++)begin
      b[i]=c[i];
      $write("%s",b[i]);
    end
    $display("\n");
    if(a==b)
      $display("a is equal to b [%s]==[%s]",a,c);
    if(a!=b)
      $display("a is not equal to b [%s]!=[%s]",a,c);
    if(a>b)
      $display(" a is greater than b [%s]>[%s]",a,c);
    if(a<b)
      $display("a is less than b [%s]<[%s]",a,c);
    $display("a=%s and b=%s",a,c);
    $display("concatination ={%s} ",{a," ",c});
    $display("replecation=%s",{3{a}}); 
  end
endmodule
