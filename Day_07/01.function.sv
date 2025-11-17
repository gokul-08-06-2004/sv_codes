//normal function
module function_normal;
  
  function int compare(input int a,b);
    if(a>b)
      $display("a is greater than b");
    else if(a<b)
      $display("a is less than b");
    else if(a==b)
      $display("a is equal to b");
  endfunction
  
  initial begin
    
    compare(10,2);
    compare(2,10);
    compare(2,2);
  end
endmodule
//function using for loop
module function_name;
  int i;
  int a;
  int b;
  int result;
  
  function int mul(input int a,b);
    begin
      mul=a*b;
    end
    endfunction
  
  initial begin
    a=1;
    b=10;
    for(i=a;i<=b;i++)
      begin
        result=mul(i,i);
        $display("square=%0d result=%0d",i,result);
      end
  end
    endmodule

// automatic function

module automatic_function;
      
      function automatic integer factorial(input integer num);
        begin
          if(num>1)
            factorial=num*factorial(num-1);
          else 
            factorial=1;
        end
        
      endfunction
      initial begin
        $display("factorial number is %0d",factorial(4));
      end
        endmodule
