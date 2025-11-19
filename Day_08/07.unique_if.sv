module unique_if;
  int a,b;
  
  initial begin
    a=30;b=40;
    
    //noraml if
   if(a>b)
      $display("%0d is greater than %0d",a,b);
    else if(a<b)
      $display("%0d is less than %0d",a,b);
    else 
      $display("%0d is equal to %0d",a,b);//# 30 is less than 40
    
    // unique if with one condition true
    unique if(a>b)
      $display("%0d is greater than %0d",a,b);
    else if(a<b)
      $display("%0d is less than %0d",a,b);
    else 
      $display("%0d is equal to %0d",a,b);//# 30 is less than 40
    
    //no  condition is true in if
      if(a>b)
      $display("%0d is greater than %0d",a,b);
    else if(a==b)
      $display("%0d is less than %0d",a,b);// no error but it run
    
    //no  condition is true in unique_if and no else statement
    unique if(a>30)
      $display("%0d is greater than 30",a);
    else if(a<20)
      $display("%0d is less than 20",a);//Warning: (vsim-8315) No condition is true in the unique/priority if/case statement.
    
    //more unique if condition
    a=30;b=10;
    unique if(a>b)
      $display("%0d is greater than %0d",a,b);
    unique if(b<a)
      $display("%0d is less than %0d",a,b);
    else 
      $display("%0d is equal to %0d",a,b);
      
    // output :
//     # 30 is greater than 10
//     # 30 is less than 10
    
    //unique0 is used avoid warning if none of conditon is true and no else statement 
    unique0 if(a>40)
      $display("%0d is greater than 40",a);
    else if(a<10)
      $display("%0d is less than 10",a);// no runtime is observed
    
   // if condition is true in unique
    unique0 if(a>b)
      $display("%0d is greater than %0d",a,b);//is executed 
    else if(b<a)
      $display("%0d is less than %0d",a,b);//** Warning: (vsim-8360) The if/case statement is not unique.
    
    // if one condition is true in unique
    unique0 if(a>b)
      $display("%0d is greater than %0d",a,b);// is executed no return any warning
    else if(b>a)
      $display("%0d is less than %0d",a,b);

  end
endmodule
