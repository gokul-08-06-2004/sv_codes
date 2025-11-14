// Code your testbench here
// or browse Examplesmodule string_methods;
module string_method;
  int i;
  string name[4]={"goukl","kabils","selvas","vijaymu"};
  
  
  initial begin
    
    $display("name=%p",name);
    foreach(name[i])
      $display("name[%0d]=%s",i,name[i]);
    $display("\n");
    i=0;
    repeat(4)begin
      $display("name[%0d]=%s",i,name[i]);
      i++;
    end
    
    for(i=0;i<4;i++)begin
      $display("name[%0d]=%0d",i,name[i].len());
    end
    
    name[0].putc(3,"u");
    $display("goukl changed to %s",name[0]);
    name[0].putc(2,"k");
    $display("gouul changed to %s",name[0]);
 
    $display("some one get the  %s",name[2].getc(4));
    
    for(i=0;i<4;i++)begin
      $display("uppercase[%0d]=%s",i,name[i].toupper());
    end
    i=0;
    while(i<4)begin
      $display("lowercase[%0d]=%s",i,name[i].tolower());
      i++;
    end
    
    if(name[0]==name[1])// normal compare
      $display("name[0] is equal to name[1]");
    else 
      $display("name[0] is not equal to name[1]");
    
    // compare method
    $display("compare name[1] and name[2] is %0d",name[1].compare(name[2]));
    $display("compare name[1] and name[3] is %0d",name[1].compare(name[3]));
    $display("upper case for name[1]=%s",name[1].toupper());
    
    name[1]="gokulsa";
    $display("name[1]=%s",name[1]);
    
    $display("icompare name[1] and name[2] is %0d",name[2].icompare(name[1]));
    $display("name[1]=%s",name[1]);
    
    $display("substr=%s",name[1].substr(2,4));
    
    
  end
endmodule
