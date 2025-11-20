module priority_if;
  
  int a,b;
  
  initial begin
    
    a=10;b=20;
    
    priority if(a>b)
      $display("%0d is greater than %0d",a,b);
    else if(a<b)
      $display("%0d is less than %0d",a,b);//# 10 is less than 20
    else 
      $display("%0d is equal to %0d",a,b);
    
    
    a=20;b=10;
    priority if(a==b)
      $display("%0d is greater than %0d",a,b);
    else if(b>a)
      $display("%0d is less than %0d",a,b);
    else 
      $display("%0d is equal to %0d",a,b);// 20 is equal to 10
    
    a=20;b=10;
    // no  condition match and no else 
     
//     priority if(a==b)
//       $display("%0d is greater than %0d",a,b);
//     else if(b>a)
//       $display("%0d is less than %0d",a,b);//** Warning: (vsim-8315) No condition is true in the unique/priority if/case statement.
    
    // more than one conditon true
         // condition is atleast one condition is true to avoid warning
    priority if(a>b)
      $display("%0d is greater than %0d",a,b);// is excuted
    else if(b<a)
      $display("%0d is less than %0d",a,b);// is not excuted but no warning issue
    
    
  end
endmodule
