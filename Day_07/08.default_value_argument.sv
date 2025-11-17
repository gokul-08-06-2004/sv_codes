module value_in_argument;
  int i;
  function int sum(input int a,b);
    sum=a+b;
    return sum;
  endfunction
  
  initial begin
int a,b;
    int result;
    for(i=0;i<6;i++)begin
      a=i+1;
      b=i+2;
      result=sum(a,b);
      $display("a=%0d b=%0d result=%0d",a,b,result);
    end
  end
endmodule
--------------------------------------------------------------------------------------------
module default_value_in_argument;
  
  function int sum(input int a=10,b=20);// it update the value locally and do not update the value of globle variable
    sum=a+b;// here a and b are update locally
    return sum;// return the value sum 
  endfunction
  
  initial begin
    int a;
    int b;
    int result=sum();//  donot pass the value to function it default value int 
    $display("a=%0d b=%0d result=%0d",a,b,result);//# a=0 b=0 result=30
    
    a=10;b=30;
    result =sum(a,b);// pass the value function argument
    $display("a=%0d b=%0d result=%0d",a,b,result);//# a=10 b=30 result=40
  end
endmodule
