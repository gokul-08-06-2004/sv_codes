module pass_by_value;

  function int sum(int a,b);
   a=a+b;// value of "a" is update locally and do not update outside the function or global variable.
   return a;
  endfunction
  
  initial begin
    int a=10;
    int b=20;
    int result=sum(a,b);
    $display("a=%0d b=%0d sum=%0d",a,b,result);// #a=10 b=20 sum=30
  end
endmodule
------------------------------------------------------------------------------------------------------
module pass_by_value_refargument;
  
  function automatic int mul(ref int a,b);// use automatic in ref argument and ref is used instead of input for update value of global variable 
    
    a=a*b;// value a is update global variable use ref argument
    return a;
  endfunction
  
  initial begin
    int a=10;
    int b=20;
    int result=mul(a,b);
    $display("a=%0d b=%0d result=%0d",a,b,result);//# a=200 b=20 result=200
  end
endmodule
