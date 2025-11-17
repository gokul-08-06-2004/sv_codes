module const_ref_argument;
  
  function automatic int sum(const ref int a,b);
   //a=a+b;// Variable 'a' is const  Illegal LHS of assignment.
    sum =a+b;
    return sum;
  endfunction
  
  initial begin
    int a=10;
    int b=20;
    int result=sum(a,b);
    $display("a=%0d b=%0d result=%0d",a,b,result);
  end
endmodule
